/** @tra dialog.tra */
/* Generated from wm_rhia.td - do not edit */

BEGIN WM_RHIA

IF ~Global("wm_start","GLOBAL",1)~ 100
    SAY @100 = @101 = @102 = @103
    IF ~~ DO ~Enemy()~ EXIT
END

IF ~!Global("wm_start","GLOBAL",1)~ 110
    SAY @110
    IF ~~ DO ~DestroyItem("WM_SBOOK") DestroyItem("WM_BEAR") TakePartyItem("WM_SBOOK") ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END
