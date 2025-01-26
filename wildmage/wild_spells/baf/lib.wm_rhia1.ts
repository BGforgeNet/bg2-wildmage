import { $obj, GLOBAL, LOCALS, ObjectPtr, SpellID } from "ielib";
import {
    ForceSpellRES, Global, GlobalGT, GlobalTimerNotExpired, IncrementGlobal,
    LastSeenBy, LevelGT, LevelLT, Myself, NearestEnemyOf, Range, ReallyForceSpell, See, SetGlobal,
    SetGlobalTimer, SpellRES, TenthNearestEnemyOf, TenthNearestEnemyOfType
} from "ielib/bg2";

/** Spellcasting delay */
export const LTIMER_delay = "delay"
/** Wild surge turns him into squirrel when this reaches 5/7/10 dependent on level */
export const LVAR_doomed = "doomed"

/** Main quest state tracking */
export const GVAR_start = "wm_start";

/**
 * Rhialto permanently turns himself into a squirrel.
 * Called at first meeting, after a few rounds.
 * @param enemyLevelLimit only cast if the nearest enemy level is lower than this
 * @param doomedThreshold only cast if LVAR_doomed is greater than this
 */
export function turnIntoSquirrel(enemyLevelLimit: number, doomedThreshold: number) {
    if (Global(GVAR_start, GLOBAL, 1)
        && See(NearestEnemyOf(Myself))
        && GlobalGT(LVAR_doomed, LOCALS, doomedThreshold)
        && LevelLT(LastSeenBy(Myself), enemyLevelLimit)
        && !GlobalTimerNotExpired("delay", LOCALS)
    ) {
        SetGlobal(GVAR_start, GLOBAL, 2)
        SetGlobalTimer(LTIMER_delay, LOCALS, 6)
        ForceSpellRES("WM_RHIA1", LastSeenBy(Myself))
    }
}

/**
 * Force cast `spell`, conditionally. Also increment `LVAR_doomed` and set `LTIMER_delay`.
 * @param spell spell ID
 * @param spellVar only cast if this isn't 0
 * @param enemyMinLevel only cast if enemy level is greater than this
 * @param target spell target, default `LastSeenBy(Myself)`
 */
export function castSpellIf(spell: SpellID, spellVar: string, enemyMinLevel: number = 0, target: ObjectPtr = LastSeenBy(Myself)) {
    if (See(NearestEnemyOf(Myself))
        && LevelGT(LastSeenBy(Myself), enemyMinLevel)
        && Global(spellVar, LOCALS, 0)
        && !GlobalTimerNotExpired(LTIMER_delay, LOCALS)
    ) {
        actDoomAndDelay()
        IncrementGlobal(spellVar, LOCALS, 1)
        ReallyForceSpell(target, spell)
    }
}

/**
 * Increment `LVAR_doomed`, set `LVAR_delay` cast timer
 */
export function actDoomAndDelay() {
    SetGlobalTimer(LTIMER_delay, LOCALS, 6)
    IncrementGlobal(LVAR_doomed, LOCALS, 1)
}

/**
 * Cast Wildstrike, increment `LVAR_castWildstrike`
 * @param lvar only cast if `LVAR_castWildstrike == lvar`
 */
export function castWildstrike(lvar: number) {
    const LVAR_castWildstrike = "strike"
    if (Global(LVAR_castWildstrike, LOCALS, lvar)
        && GlobalGT("doomed", LOCALS, 2)
        && See(TenthNearestEnemyOfType($obj("[0.0.0.MAGE_ALL]")))
        && !GlobalTimerNotExpired(LTIMER_delay, LOCALS)
    ) {
        actDoomAndDelay()
        IncrementGlobal(LVAR_castWildstrike, LOCALS, 1)
        SpellRES("WM_STRIK", LastSeenBy(Myself))
    }
}

/**
 * Cast Glyph of Wild Magic, increment `LVAR_castGlyph`.
 * @param lvar only cast if `LVAR_castGlyph == lvar`
 */
export function castGlyph(lvar: number) {
    const LVAR_castGlyph = "glyph"
    if (Global(LVAR_castGlyph, LOCALS, lvar)
        && See(TenthNearestEnemyOf(Myself))
        && !Range(LastSeenBy(Myself), 5)
        && !GlobalTimerNotExpired(LTIMER_delay, LOCALS)
    ) {
        actDoomAndDelay()
        IncrementGlobal(LVAR_castGlyph, LOCALS, 1)
        SpellRES("WM_GLPH", LastSeenBy(Myself))
    }
}

/**
 * Cast Rhialto's Random Missiles, increment `LVAR_castRandomMissiles`.
 * @param lvar only cast if `LVAR_castRandomMissiles == lvar`
 */
export function castRandomMissiles(lvar: number) {
    const LVAR_castRandomMissiles = "missile"
    if (Global(LVAR_castRandomMissiles, LOCALS, lvar)
        && See(TenthNearestEnemyOf(Myself))
        && LevelGT(LastSeenBy(Myself), 4)      // Level 5+
        && !GlobalTimerNotExpired(LTIMER_delay, LOCALS)
    ) {
        actDoomAndDelay()
        IncrementGlobal(LVAR_castRandomMissiles, LOCALS, 1)
        SpellRES("WM_MISS", LastSeenBy(Myself))
    }
}
