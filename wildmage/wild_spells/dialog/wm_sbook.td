/** @tra dialog.tra */

import { LOCALS, tra } from "@bgforge/iets";
import { ActionOverride, AddSpecialAbility, DestroyItem, GiveItemCreate, Global, GlobalGT, GlobalLT, IncrementGlobal, Level, LevelGT, LevelLT, Myself, RandomNum } from "@bgforge/iets/bg2";

//---------------------------------------------------------------------------------------
//         ----------------------
//           Spellbook Dialogue
//         ----------------------
//---------------------------------------------------------------------------------------
//
// Wild spells variant. See also: shaper_kit/dialog/wm_sbook.td
//
// Tier 1 has 2 spells (Random Spell, Rodent Form) using +6/+1 additive
// encoding. No Chaos Conduit, no spellshaper-specific routing.
//
// The Spellbook can be used to learn wild magic spells. The selection
// is dependent on the user's level. The spells show up in pairs,
// when the user has the first minimum level, he may learn one of them.
// To learn the second spell, the user needs to advance to the next level.
// The next pair of spells shows up when the user has learned both previous spells.
//
// MIN-LEVEL   SPELL
// 1st  2nd    LEVEL   SPELL SELECTION
//---------------------------------------------------------------------------------------
//  1    2       1     "Random Spell" + "Rodent Form"
//  3    4       2     "Blade Shower" + "Rhialto's Random Missiles"
//  5    6       3     "Gymlainac's Lightbend" + "Vile Word of Discord"
//  7    8       4     "Cellular Regeneration" + "Glyph of Wild Magic"
//  9   10       5     "Paithan's Lucky Streak" + "Vortex"
// 11   12       6     "Paithan's Fiasco" + "Wildstrike"
// 13   14       7     "Hornung's Random Dispatcher" + "Summon Cow"
// 15   16       8     "Eye of the Beholder" + "Mynoc's Wild Recuperation"
// 17   18       9     "Entropy Shield" + "Wild Sphere"
// 19    10     "Rhialto's Marvelous Reincarnation" (Needs to be spellshaper)
// 20    12      (Can't learn this spell, just a reference to "Karsus's Avatar")
//----------------------------------------------------------------------------------------

/**
 * Counts how many times the book has been opened.
 */
const LVAR_book_open_count = "wm_book_open";

/**
 * Tracks spell learning progress. Encoding varies by tier:
 *
 * Tier 1 (values 0-7): 2 independently learnable spells with +6/+1 additive encoding.
 *   +6: Random Spell, +1: Rodent Form.
 *   0=neither, 1=Rodent Form, 6=Random Spell, 7=both.
 *   First spell at level 1, second requires level 2+.
 *
 * Tiers 2-9 (values 7-31): paired spells with +2/+1 additive encoding.
 *   Each pair spans base B to B+3: B=neither, B+1=spell B, B+2=spell A, B+3=both.
 *   First spell at min-level, second at min-level+1. Pairs chain: 7->10->13->...->28->31.
 *
 * Post-pairs (31-36): sequential +1 increments.
 *   31: Reincarnation available (requires spellshaper level 19).
 *   32-34: Avatar search (3 study attempts, each +1).
 *   35: Avatar reference found (fun). 36: all done, book destroyed.
 */
const LVAR_book_spell = "wm_book_spell";

/**
 * Tracks additional spell learning (v1.4). Simple counter 0-9.
 * Each value unlocks one spell, gated by a wm_book_spell threshold
 * (must have progressed past the corresponding main spell pair's base).
 */
const LVAR_book_spell_A = "wm_book_spell_A";

begin("WM_SBOOK",
    state("1", () => {
        if (Global(LVAR_book_open_count, LOCALS, 0)) {
            say(tra(0));
            reply(tra(10)).goTo(study);
            reply(tra(11)).goTo(close);

        }
    }),
    state("2", () => {
        if (Global(LVAR_book_open_count, LOCALS, 5)) {
            say(tra(1));
            reply(tra(10)).goTo(study);
            reply(tra(11)).goTo(close);

        }
    }),
    state("3", () => {
        if (Global(LVAR_book_open_count, LOCALS, 10)) {
            say(tra(2));
            reply(tra(10)).goTo(study);
            reply(tra(11)).goTo(close);

        }
    }),
    state4,
    state("4a", () => {
        if (!GlobalLT(LVAR_book_spell, LOCALS, 36)) {
            say(tra(9));
            action(ActionOverride(Myself, DestroyItem("wm_sbook"))).exit();
        }
    }),
    state("4b", () => {
        if (!GlobalLT(LVAR_book_spell, LOCALS, 31)) {
            say(tra(8));
            reply(tra(10)).goTo(study);
            reply(tra(11)).goTo(close);
        }
    }),
    state("5", () => {
        if (RandomNum(4, 1)) {
            say(tra(4));
            reply(tra(10)).goTo(study);
            reply(tra(11)).goTo(close);
        }
    }),
    state("6", () => {
        if (RandomNum(4, 2)) {
            say(tra(5));
            reply(tra(10)).goTo(study);
            reply(tra(11)).goTo(close);
        }
    }),
    state("7", () => {
        if (RandomNum(4, 3)) {
            say(tra(6));
            reply(tra(10)).goTo(study);
            reply(tra(11)).goTo(close);
        }
    }),
    state("8", () => {
        if (RandomNum(4, 4)) {
            say(tra(7));
            reply(tra(10)).goTo(study);
            reply(tra(11)).goTo(close);
        }
    }),
    state03, state04, state05, state06, state07, state08, state09,
    state10, state11, state12, state13, state14, state15, state16, state17, state18, state19,
    fun,
);

/**
 * State that gives a spell scroll randomly, when `wm_book_open` local var is 7/14/21.
 */
function state4() {
    const RANDOM_PAGE_FALLOUT: [number, string][] = [
        [1, "SCRL7k"], // (6) Mislead
        [2, "SCRL5p"], // (5) Chaos
        [3, "SCRL5Q"], // (5) Feeblemind
        [4, "SCRL1u"], // (4) Confusion
        [5, "SCRL6q"], // (4) Teleport Field
        [6, "SCRL5i"], // (4) Greater Malison
        [7, "SCRL1s"], // (3) Dire Charm
        [8, "SCRLA5"], // (3) Melf's Minute Meteors
        [9, "SCRLA7"], // (3) Remove Magic
        [10, "SCRL1d"], // (3) Clairvoyance
        [11, "SCRL95"], // (2) Melf's Acid Arrow
        [12, "SCRLA3"], // (2) Glitterdust
        [13, "SCRL6f"], // (2) Ray of Enfeeblement
        [14, "SCRL91"], // (2) Knock
        [15, "SCRL94"], // (2) Resist Fear
        [16, "SCRL66"], // (1) Grease
        [17, "SCRL75"], // (1) Identify
        [18, "SCRL71"], // (1) Blindness
        [19, "SCRL70"], // (1) Color Spray
        [20, "SCRL83"], // (1) Chromatic Orb
        [21, "SCRLa6"], // (1) Spook
    ];
    if (Global(LVAR_book_open_count, LOCALS, 7)
        || Global(LVAR_book_open_count, LOCALS, 14)
        || Global(LVAR_book_open_count, LOCALS, 21)) {
        say(tra(3));
        for (const [roll, scroll] of RANDOM_PAGE_FALLOUT) {
            if (RandomNum(21, roll)) {
                reply(tra(11)).action(GiveItemCreate(scroll, Myself, 1, 0, 0)).goTo(close);
            }
        }
    }
}

function study() {
    say(tra(13));

    if (Global(LVAR_book_spell, LOCALS, 35)
        || !GlobalGT(LVAR_book_spell, LOCALS, 30)
        || GlobalLT(LVAR_book_spell_A, LOCALS, 9)) {
        action(IncrementGlobal(LVAR_book_open_count, LOCALS, 1)).goTo(study1);
    }
    if (Global(LVAR_book_spell, LOCALS, 31) && !GlobalLT("wm_level", LOCALS, 19)) {
        action(IncrementGlobal(LVAR_book_open_count, LOCALS, 1)).goTo(study1);
    }
    if (Global(LVAR_book_spell, LOCALS, 31) && GlobalLT("wm_level", LOCALS, 19)) {
        action(IncrementGlobal(LVAR_book_open_count, LOCALS, 1)).goTo(study2);
    }
    if (!GlobalLT(LVAR_book_spell, LOCALS, 32) && !GlobalGT(LVAR_book_spell, LOCALS, 34)) {
        action(IncrementGlobal(LVAR_book_open_count, LOCALS, 1)).goTo(study3);
    }
}

function close() {
    say(tra(19));
    action(IncrementGlobal(LVAR_book_open_count, LOCALS, 1)).exit();
}

function study1() {
    say(tra(14));

    // 2-spell tier 1: +6 for Random Spell, +1 for Rodent Form
    // -> +6 = 6/7
    if (Global(LVAR_book_spell, LOCALS, 0)
        || Global(LVAR_book_spell, LOCALS, 1)) {
        reply(tra(20)).goTo(state00);
    }
    // -> +1 = 1/7
    if (Global(LVAR_book_spell, LOCALS, 0)
        || Global(LVAR_book_spell, LOCALS, 6)) {
        reply(tra(22)).goTo(state02);
    }

    // Paired spell choices: each base has a +2 and +1 option
    const spellPairs = [
        [7, 8, 9, 23, 24, state03, state04],
        [10, 11, 12, 25, 26, state05, state06],
        [13, 14, 15, 27, 28, state07, state08],
        [16, 17, 18, 29, 30, state09, state10],
        [19, 20, 21, 31, 32, state11, state12],
        [22, 23, 24, 33, 34, state13, state14],
        [25, 26, 27, 35, 36, state15, state16],
        [28, 29, 30, 37, 38, state17, state18],
    ] as const;

    for (const [base, opt2, opt1, reply2, reply1, target2, target1] of spellPairs) {
        if (Global(LVAR_book_spell, LOCALS, base) || Global(LVAR_book_spell, LOCALS, opt2)) {
            reply(tra(reply2)).goTo(target2);
        }
        if (Global(LVAR_book_spell, LOCALS, base) || Global(LVAR_book_spell, LOCALS, opt1)) {
            reply(tra(reply1)).goTo(target1);
        }
    }

    // -> +1 = 32
    if (Global(LVAR_book_spell, LOCALS, 31) && !GlobalLT("wm_level", LOCALS, 19)) {
        reply(tra(39)).goTo(state19);
    }

    // -> +1 = 36
    if (Global(LVAR_book_spell, LOCALS, 35)) {
        reply(tra(40)).goTo(state20);
    }

    /** Advanced spell choices (spell_A tiers) */
    const spellTiers = [
        [0, 0, 41, state21],
        [1, 7, 42, state22],
        [2, 10, 43, state23],
        [3, 13, 44, state24],
        [4, 16, 45, state25],
        [5, 19, 46, state26],
        [6, 22, 47, state27],
        [7, 25, 48, state28],
        [8, 28, 49, state29],
    ] as const;

    for (const [level, threshold, replyNum, target] of spellTiers) {
        if (Global(LVAR_book_spell_A, LOCALS, level) && GlobalGT(LVAR_book_spell, LOCALS, threshold)) {
            reply(tra(replyNum)).goTo(target);
        }
    }

    reply(tra(11)).goTo(close2);
}

/** Can't find "Rhialto's Marvelous Reincarnation" unless Chaos Conduit was cast... */
function study2() {
    say(tra(15));
    reply(tra(11)).goTo(close2);
}

/** Need to search three times for "Rhialto's Avatar" */
function study3() {
    say(tra(15));
    reply(tra(11)).action(IncrementGlobal(LVAR_book_spell, LOCALS, 1)).goTo(close2);
}

function close2() {
    say(tra(19));
    exit();
}

function fail() {
    say(tra(16));
    exit();
}

function success() {
    say(tra(17));
    exit();
}

//----------------------
// SpellLevel 1: 1+2

function state00() {
    // 1st spell at Level 1+
    if (Level(Myself, 1) && GlobalGT(LVAR_book_spell, LOCALS, 0)) {
        goTo(fail);
    }
    // 2nd spell at Level 2+
    if (LevelGT(Myself, 1) || Global(LVAR_book_spell, LOCALS, 0)) {
        action(ActionOverride(Myself, AddSpecialAbility("wm_rnd")), IncrementGlobal(LVAR_book_spell, LOCALS, 6)).goTo(success);
    }
}

function state02() {
    // 1st spell at Level 1+
    if (Level(Myself, 1) && GlobalGT(LVAR_book_spell, LOCALS, 0)) {
        goTo(fail);
    }
    // 2nd spell at Level 2+
    if (LevelGT(Myself, 1) || Global(LVAR_book_spell, LOCALS, 0)) {
        action(ActionOverride(Myself, AddSpecialAbility("wm_sqrl")), IncrementGlobal(LVAR_book_spell, LOCALS, 1)).goTo(success);
    }
}

function learnSpell(levelReq: number, spellBase: number, ability: string, increment: number) {
    // first spell at levelReq+
    if (LevelLT(Myself, levelReq)) {
        goTo(fail);
    }
    // second spell at levelReq+1
    if (!LevelGT(Myself, levelReq) && GlobalGT(LVAR_book_spell, LOCALS, spellBase)) {
        goTo(fail);
    }
    if (!LevelLT(Myself, levelReq) && (LevelGT(Myself, levelReq) || Global(LVAR_book_spell, LOCALS, spellBase))) {
        action(ActionOverride(Myself, AddSpecialAbility(ability)), IncrementGlobal(LVAR_book_spell, LOCALS, increment)).goTo(success);
    }
}

function state03() { learnSpell(3, 7, "wm_blade", 2); }
function state04() { learnSpell(3, 7, "wm_miss", 1); }
function state05() { learnSpell(5, 10, "wm_light", 2); }
function state06() { learnSpell(5, 10, "wm_word", 1); }
function state07() { learnSpell(7, 13, "wm_heal", 2); }
function state08() { learnSpell(7, 13, "wm_glyph", 1); }
function state09() { learnSpell(9, 16, "wm_luck", 2); }
function state10() { learnSpell(9, 16, "wm_vortx", 1); }
function state11() { learnSpell(11, 19, "wm_unlk", 2); }
function state12() { learnSpell(11, 19, "wm_strik", 1); }
function state13() { learnSpell(13, 22, "wm_disp", 2); }
function state14() { learnSpell(13, 22, "wm_cow", 1); }
function state15() { learnSpell(15, 25, "wm_eye", 2); }
function state16() { learnSpell(15, 25, "wm_recup", 1); }
function state17() { learnSpell(17, 28, "wm_shld", 2); }
function state18() { learnSpell(17, 28, "wm_sphr", 1); }

/** 10th Level spell at Level 19+ */
function state19() {
    if (LevelLT(Myself, 19)) {
        goTo(fail);
    }
    if (!LevelLT(Myself, 19)) {
        action(ActionOverride(Myself, AddSpecialAbility("wm_reinc")), IncrementGlobal(LVAR_book_spell, LOCALS, 1)).goTo(success);
    }
}

/** Fun at Level 20+ */
function state20() {
    if (LevelLT(Myself, 20)) {
        goTo(fail);
    }
    if (!LevelLT(Myself, 20)) {
        goTo(fun);
    }
}

function fun() {
    say(tra(18));
    action(IncrementGlobal(LVAR_book_spell, LOCALS, 1)).exit();
}

/** v1.4 Additional Spells: Level 1-9 */
function learnAdditional(ability: string) {
    action(ActionOverride(Myself, AddSpecialAbility(ability)), IncrementGlobal(LVAR_book_spell_A, LOCALS, 1)).goTo(success);
}

/** Mynoc's Irresistible Appeal */
function state21() { learnAdditional("wm_attr"); }
/** Summon Wild Horde */
function state22() { learnAdditional("wm_horde"); }
/** Random Spell II */
function state23() { learnAdditional("wm_rnd2"); }
/** Corporeal Instability */
function state24() { learnAdditional("wm_liq"); }
/** Random Spell III */
function state25() { learnAdditional("wm_rnd3"); }
/** Meece's Wild Armour */
function state26() { learnAdditional("wm_armor"); }
/** Random Spell IV */
function state27() { learnAdditional("wm_rnd4"); }
/** Entropy Burst */
function state28() { learnAdditional("wm_chaob"); }
/** Wildfire */
function state29() { learnAdditional("wm_wfire"); }
