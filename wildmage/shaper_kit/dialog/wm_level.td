/** @tra dialog.tra */

import { LOCALS, tra } from "@bgforge/iets";
import { AddSpecialAbility, ApplySpellRES, ChangeAIScript, CheckStat, CheckStatLT, G, Global, GlobalGT, LevelLT, Myself, ScrLev, SetGlobal, Stat } from "@bgforge/iets/bg2";

//---------------------------------------------------------------------------------------
//         -----------------------------------
//           Spellshaper Interactive Levelup
//         -----------------------------------
//---------------------------------------------------------------------------------------
//
// This Dialogue offers interactive choices during levelup
//
// It's first called by BALDUR.BCS, when a Non-Lawful Wild Mage drops to 50% Hitpoints.
//
// Select a special ability at levels 1,3,5,7,9,12,15,18,21
// Int 16+ allows extra feats at levels 24,27,30,36,42,48
//
// The Dialog is always started, but when intelligence is to low,
// There are no lines to display, and nothing happens ingame...
//----------------------------------------------------------------------------------------

/**
 * 0 - never triggered
 * 1 - set by baldur.bcs
 * 2 - agreed to embrace
 * 100 - embraced, start dialog
 * -1 - surge suppressed
 */
const GVAR_spellshaper = "wm_spellshaper";

/** "Ambidextrousity" (Two Ranks!) */
const LVAR_feat_ambidextrous = "wm_feat_ambidextrous";
/** "Vicious Hits" (+1 Damage) */
const LVAR_wm_feat_vicious = "wm_feat_vicious";
/** "Toughness" (+10% Hitpoints) */
const LVAR_feat_toughness = "wm_feat_toughness";
/** "Improved Criticals" (+1 Critical Hit Range) */
const LVAR_feat_criticals = "wm_feat_criticals";

begin("WM_LEVEL",
    state("Doit", () => {
        if (G(GVAR_spellshaper, 1)) {
            say(tra(220), tra(221));
            reply(tra(222)).goTo(Yes);
            reply(tra(223)).goTo(No);
        }
    }),
    No,
    Yes,
    Done,
    stateLevel1_23,
    stateLevel24_26,
    stateLevel27_29,
    stateLevel30_35,
    stateLevel36_41,
);

function No() {
    say(tra(224));
    action(SetGlobal(GVAR_spellshaper, "GLOBAL", -1)).exit();
}
function Yes() {
    say(tra(225));
    action(SetGlobal(GVAR_spellshaper, "GLOBAL", 2),
        SetGlobal("wm_level", "LOCALS", -10),
        ChangeAIScript("wm_chao1", ScrLev.OVERRIDE)).exit();
}
function Done() {
    if (G(GVAR_spellshaper, 2)) {
        say(tra(230), tra(231), tra(232));
    }
    action(SetGlobal(GVAR_spellshaper, "GLOBAL", 100)).goTo(stateLevel1_23);
}


/**
 * Reply list.
 * All feat states use it, just with different conditions
 */
function repliesFeatMenu() {
    // Weaveshear
    if (!LevelLT(Myself, 5)) {
        reply(tra(217)).goTo(stateShear);
    }

    // Weave Spell
    if (!LevelLT(Myself, 3)) {
        reply(tra(216)).goTo(stateWeave);
    }

    // Ambidextrousity
    if (Global(LVAR_feat_ambidextrous, LOCALS, 0) && !CheckStatLT(Myself, 16, Stat.DEX)) {
        reply(tra(201)).goTo(stateAmbidex);
    }

    // Ambidextrousity
    if (Global(LVAR_feat_ambidextrous, LOCALS, 1) && !CheckStatLT(Myself, 16, Stat.DEX)) {
        reply(tra(202)).goTo(stateAmbidex);
    }

    // Backstabbing (x2)
    if (CheckStat(Myself, 1, Stat.BACKSTABDAMAGEMULTIPLIER)) {
        reply(tra(203)).goTo(stateBackstab);
    }

    // Backstabbing Adept (x3)
    if (CheckStat(Myself, 2, Stat.BACKSTABDAMAGEMULTIPLIER) && !LevelLT(Myself, 5) && !CheckStatLT(Myself, 14, Stat.DEX)) {
        reply(tra(204)).goTo(stateBackstab);
    }

    // Backstabbing Expert (x4)
    if (CheckStat(Myself, 3, Stat.BACKSTABDAMAGEMULTIPLIER) && !LevelLT(Myself, 9) && !CheckStatLT(Myself, 15, Stat.DEX)) {
        reply(tra(205)).goTo(stateBackstab);
    }

    // Backstabbing Master (x5)
    if (CheckStat(Myself, 4, Stat.BACKSTABDAMAGEMULTIPLIER) && !LevelLT(Myself, 15) && !CheckStatLT(Myself, 16, Stat.DEX)) {
        reply(tra(206)).goTo(stateBackstab);
    }

    // Combat Speed
    if (Global(LVAR_feat_ambidextrous, LOCALS, 2) && !LevelLT(Myself, 18)) {
        reply(tra(207)).goTo(stateSpeed);
    }

    // Dagger Specialization
    if (CheckStat(Myself, 1, Stat.PROFICIENCYDAGGER)) {
        reply(tra(208)).goTo(stateDagger);
    }

    // Improved Criticals
    if (Global(LVAR_feat_criticals, LOCALS, 0) && !LevelLT(Myself, 9)) {
        reply(tra(210)).goTo(stateQuick);
    }

    // Toughness
    if (Global(LVAR_feat_toughness, LOCALS, 0) && !LevelLT(Myself, 3)) {
        reply(tra(211)).goTo(stateTough);
    }

    // Vicious hits
    if (!GlobalGT(LVAR_wm_feat_vicious, LOCALS, 4) && !LevelLT(Myself, 3)) {
        reply(tra(212)).goTo(stateDamage);
    }

    // Rogue HLA: Assassination
    if (!CheckStatLT(Myself, 4, Stat.BACKSTABDAMAGEMULTIPLIER) && !LevelLT(Myself, 18) && !CheckStatLT(Myself, 16, Stat.DEX)) {
        reply(tra(213)).goTo(stateAssassin);
    }

    // Rogue HLA: Avoid Death
    if (Global(LVAR_feat_toughness, LOCALS, 1) && !LevelLT(Myself, 18)) {
        reply(tra(214)).goTo(stateAvoid);
    }

    // Rogue HLA: Evasion
    if (!CheckStatLT(Myself, 16, Stat.DEX) && !LevelLT(Myself, 18)) {
        reply(tra(215)).goTo(stateEvade);
    }
}

/**
 * State for levels up to 23 inclusive, or Int 19+
 */
function stateLevel1_23() {
    if (LevelLT(Myself, 24) || !CheckStatLT(Myself, 19, Stat.INT)) {
        say(tra(200));
        repliesFeatMenu();
    }
}

/**
 * State for levels 24-26 inclusive
 */
function stateLevel24_26() {
    if (!LevelLT(Myself, 24) && LevelLT(Myself, 27) && !CheckStatLT(Myself, 15, Stat.INT)) {
        say(tra(200));
        repliesFeatMenu();
    }
}

/**
 * State for levels 27-29 inclusive
 */
function stateLevel27_29() {
    if (!LevelLT(Myself, 27) && LevelLT(Myself, 30) && !CheckStatLT(Myself, 16, Stat.INT)) {
        say(tra(200));
        repliesFeatMenu();
    }
}

/**
 * State for levels 30-35 inclusive
 */
function stateLevel30_35() {
    if (!LevelLT(Myself, 30) && LevelLT(Myself, 36) && !CheckStatLT(Myself, 17, Stat.INT)) {
        say(tra(200));
        repliesFeatMenu();
    }
}

/**
 * State for levels 36-41 inclusive
 */
function stateLevel36_41() {
    if (!LevelLT(Myself, 36) && LevelLT(Myself, 42) && !CheckStatLT(Myself, 18, Stat.INT)) {
        say(tra(200));
        repliesFeatMenu();
    }
}


function stateShear() {
    action(AddSpecialAbility("wm_shear")).exit();
}

function stateWeave() {
    action(AddSpecialAbility("wm_weave")).exit();
}

function stateDagger() {
    action(ApplySpellRES("wm_#dag2", Myself)).exit();
}

function stateAmbidex() {
    if (Global(LVAR_feat_ambidextrous, LOCALS, 0)) {
        action(ApplySpellRES("wm_#amb1", Myself), SetGlobal(LVAR_feat_ambidextrous, LOCALS, 1)).exit();
    }
    if (Global(LVAR_feat_ambidextrous, LOCALS, 1)) {
        action(ApplySpellRES("wm_#amb2", Myself), SetGlobal(LVAR_feat_ambidextrous, LOCALS, 2)).exit();
    }
}

function stateSpeed() {
    action(ApplySpellRES("wm_#fast", Myself), SetGlobal(LVAR_feat_ambidextrous, LOCALS, 3)).exit();
}

function stateTough() {
    action(ApplySpellRES("wm_#toug", Myself), SetGlobal(LVAR_feat_toughness, LOCALS, 1)).exit();
}

function stateDamage() {
    action(ApplySpellRES("wm_#dam", Myself), SetGlobal(LVAR_wm_feat_vicious, LOCALS, 1)).exit();
}

function stateQuick() {
    action(ApplySpellRES("wm_#crit", Myself), SetGlobal(LVAR_feat_criticals, LOCALS, 1)).exit();
}

function stateBackstab() {
    action(ApplySpellRES("wm_#stab", Myself)).exit();
}

function stateAssassin() {
    action(AddSpecialAbility("SPCL916")).exit();
}

function stateAvoid() {
    action(AddSpecialAbility("SPCL917")).exit();
}

function stateEvade() {
    action(AddSpecialAbility("SPCL913")).exit();
}
