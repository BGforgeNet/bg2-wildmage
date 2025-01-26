import { $tra, SplRef } from "ielib";
import { ApplySpellRES, DisplayString, DisplayStringHead, HaveSpell, HaveSpellRES, Myself, PartyRested, PlaySound, RandomNumLT } from "ielib/bg2";


/** Rest wild magic roll maximum */
export const SLEEP_MAX_ROLL = 28;

/**
 * If random roll is less than rollLimit, create a random magic effect after party has rested.
 *
 * Make sure to use this in incrementing order of `rollLimit`, to avoid missing effects.
 *
 * @param rollLimit roll limit
 * @param headString passed to DisplayStringHead
 * @param spellRes spell resource
 */
export function randomEffect(rollLimit: number, headString: number, spellRes: SplRef) {
    if (PartyRested() && RandomNumLT(SLEEP_MAX_ROLL, rollLimit)) {
        PlaySound("EFF_M10")
        DisplayString(Myself, $tra(10201))  // "Wild Magic made your dreams come true"
        DisplayStringHead(Myself, headString)
        ApplySpellRES(spellRes, Myself)
    }
}

/**
 * @returns true if current creature has any of the listed wizard spells
 */
export function haveWizardSpells(): boolean {
    return (
        HaveSpellRES("WM_ATTR")
        || HaveSpellRES("WM_RND")
        || HaveSpellRES("WM_SQRL")
        || HaveSpellRES("WM_SQRL1")

        || HaveSpellRES("WM_BLADE")
        || HaveSpellRES("WM_MISS")
        || HaveSpellRES("WM_HORDE")

        || HaveSpellRES("WM_RND2")
        || HaveSpellRES("WM_LIGHT")
        || HaveSpellRES("WM_WORD")

        || HaveSpellRES("WM_HEAL")
        || HaveSpellRES("WM_LIQ")
        || HaveSpellRES("WM_GLYPH")

        || HaveSpellRES("WM_RND3")
        || HaveSpellRES("WM_LUCK")
        || HaveSpellRES("WM_VORTX")

        || HaveSpellRES("WM_ARMOR")
        || HaveSpellRES("WM_UNLK")
        || HaveSpellRES("WM_STRIK")

        || HaveSpellRES("WM_RND4")
        || HaveSpellRES("WM_DISP")
        || HaveSpellRES("WM_COW")

        || HaveSpellRES("WM_CHAOB")
        || HaveSpellRES("WM_EYE")
        || HaveSpellRES("WM_RECUP")

        || HaveSpellRES("WM_SHLD")
        || HaveSpellRES("WM_WFIRE")
        || HaveSpellRES("WM_SPHR")

        //-------------------------  204 Wizard Spells from "SPELL.IDS"
        || HaveSpell(2101)
        || HaveSpell(2102)
        || HaveSpell(2103)
        || HaveSpell(2104)
        || HaveSpell(2105)
        || HaveSpell(2106)
        || HaveSpell(2107)
        || HaveSpell(2108)
        || HaveSpell(2109)
        || HaveSpell(2110)
        || HaveSpell(2111)
        || HaveSpell(2112)
        || HaveSpell(2113)
        || HaveSpell(2114)
        || HaveSpell(2115)
        || HaveSpell(2116)
        || HaveSpell(2117)
        || HaveSpell(2118)
        || HaveSpell(2119)
        || HaveSpell(2120)
        || HaveSpell(2121)
        || HaveSpell(2122)
        || HaveSpell(2123)
        || HaveSpell(2124)
        || HaveSpell(2125)

        || HaveSpell(2201)
        || HaveSpell(2202)
        || HaveSpell(2203)
        || HaveSpell(2204)
        || HaveSpell(2205)
        || HaveSpell(2206)
        || HaveSpell(2207)
        || HaveSpell(2208)
        || HaveSpell(2209)
        || HaveSpell(2210)
        || HaveSpell(2211)
        || HaveSpell(2212)
        || HaveSpell(2213)
        || HaveSpell(2214)
        || HaveSpell(2215)
        || HaveSpell(2216)
        || HaveSpell(2217)
        || HaveSpell(2218)
        || HaveSpell(2219)
        || HaveSpell(2220)
        || HaveSpell(2221)
        || HaveSpell(2223)
        || HaveSpell(2224)

        || HaveSpell(2301)
        || HaveSpell(2302)
        || HaveSpell(2303)
        || HaveSpell(2304)
        || HaveSpell(2305)
        || HaveSpell(2306)
        || HaveSpell(2307)
        || HaveSpell(2308)
        || HaveSpell(2309)
        || HaveSpell(2310)
        || HaveSpell(2311)
        || HaveSpell(2312)
        || HaveSpell(2313)
        || HaveSpell(2314)
        || HaveSpell(2315)
        || HaveSpell(2316)
        || HaveSpell(2317)
        || HaveSpell(2318)
        || HaveSpell(2319)
        || HaveSpell(2320)
        || HaveSpell(2321)
        || HaveSpell(2322)
        || HaveSpell(2324)
        || HaveSpell(2325)
        || HaveSpell(2326)

        || HaveSpell(2401)
        || HaveSpell(2402)
        || HaveSpell(2403)
        || HaveSpell(2404)
        || HaveSpell(2405)
        || HaveSpell(2406)
        || HaveSpell(2407)
        || HaveSpell(2408)
        || HaveSpell(2409)
        || HaveSpell(2410)
        || HaveSpell(2411)
        || HaveSpell(2412)
        || HaveSpell(2413)
        || HaveSpell(2414)
        || HaveSpell(2415)
        || HaveSpell(2416)
        || HaveSpell(2417)
        || HaveSpell(2418)
        || HaveSpell(2419)
        || HaveSpell(2420)
        || HaveSpell(2421)
        || HaveSpell(2423)
        || HaveSpell(2424)
        || HaveSpell(2425)

        || HaveSpell(2501)
        || HaveSpell(2502)
        || HaveSpell(2503)
        || HaveSpell(2504)
        || HaveSpell(2505)
        || HaveSpell(2506)
        || HaveSpell(2507)
        || HaveSpell(2508)
        || HaveSpell(2509)
        || HaveSpell(2510)
        || HaveSpell(2511)
        || HaveSpell(2512)
        || HaveSpell(2513)
        || HaveSpell(2514)
        || HaveSpell(2515)
        || HaveSpell(2516)
        || HaveSpell(2517)
        || HaveSpell(2518)
        || HaveSpell(2519)
        || HaveSpell(2520)
        || HaveSpell(2521)
        || HaveSpell(2522)
        || HaveSpell(2523)

        || HaveSpell(2601)
        || HaveSpell(2602)
        || HaveSpell(2603)
        || HaveSpell(2604)
        || HaveSpell(2605)
        || HaveSpell(2606)
        || HaveSpell(2607)
        || HaveSpell(2608)
        || HaveSpell(2609)
        || HaveSpell(2610)
        || HaveSpell(2611)
        || HaveSpell(2612)
        || HaveSpell(2613)
        || HaveSpell(2614)
        || HaveSpell(2615)
        || HaveSpell(2616)
        || HaveSpell(2617)
        || HaveSpell(2618)
        || HaveSpell(2619)
        || HaveSpell(2620)
        || HaveSpell(2621)
        || HaveSpell(2622)
        || HaveSpell(2623)
        || HaveSpell(2624)
        || HaveSpell(2625)

        || HaveSpell(2701)
        || HaveSpell(2702)
        || HaveSpell(2703)
        || HaveSpell(2704)
        || HaveSpell(2705)
        || HaveSpell(2707)
        || HaveSpell(2708)
        || HaveSpell(2709)
        || HaveSpell(2710)
        || HaveSpell(2711)
        || HaveSpell(2712)
        || HaveSpell(2713)
        || HaveSpell(2714)
        || HaveSpell(2715)
        || HaveSpell(2716)
        || HaveSpell(2717)
        || HaveSpell(2718)
        || HaveSpell(2719)
        || HaveSpell(2720)
        || HaveSpell(2721)
        || HaveSpell(2722)

        || HaveSpell(2801)
        || HaveSpell(2803)
        || HaveSpell(2804)
        || HaveSpell(2805)
        || HaveSpell(2807)
        || HaveSpell(2808)
        || HaveSpell(2809)
        || HaveSpell(2810)
        || HaveSpell(2811)
        || HaveSpell(2812)
        || HaveSpell(2813)
        || HaveSpell(2814)
        || HaveSpell(2815)
        || HaveSpell(2816)
        || HaveSpell(2817)
        || HaveSpell(2818)

        || HaveSpell(2902)
        || HaveSpell(2903)
        || HaveSpell(2905)
        || HaveSpell(2907)
        || HaveSpell(2908)
        || HaveSpell(2909)
        || HaveSpell(2910)
        || HaveSpell(2911)
        || HaveSpell(2912)
        || HaveSpell(2913)
        || HaveSpell(2914)
        || HaveSpell(2915)
        || HaveSpell(2916)
        || HaveSpell(2917)
        || HaveSpell(2918)
        || HaveSpell(2919)
        || HaveSpell(2920)
        || HaveSpell(2921)
        || HaveSpell(2922)
        || HaveSpell(2923)
        || HaveSpell(2924)
        || HaveSpell(2925)
    )
}
