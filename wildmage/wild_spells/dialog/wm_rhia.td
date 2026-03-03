/** @tra dialog.tra */

import { tra } from "@bgforge/iets";
import { DestroyItem, DRYAD_TELEPORT, Enemy, ForceSpell, Global, Myself, TakePartyItem } from "@bgforge/iets/bg2";

//------------------------------------------------------------------------------
//         ----------------------
//           Rhialto's Dialogue
//         ----------------------
//------------------------------------------------------------------------------

begin("WM_RHIA",
    state("100", () => {
        if (Global("wm_start", "GLOBAL", 1)) {
            say(tra(100), tra(101), tra(102), tra(103));
            action(Enemy()).exit();
        }
    }),
    state("110", () => {
        if (!Global("wm_start", "GLOBAL", 1)) {
            say(tra(110));
            action(
                DestroyItem("WM_SBOOK"),
                DestroyItem("WM_BEAR"),
                TakePartyItem("WM_SBOOK"),
                ForceSpell(Myself, DRYAD_TELEPORT),
            ).exit();
        }
    }),
);
