/** @tra dialog.tra */
/* Generated from wm_level.td - do not edit */

BEGIN WM_LEVEL

IF ~G("wm_spellshaper",1)~ Doit
    SAY @220 = @221
    ++ @222 + Yes
    ++ @223 + No
END

IF ~~ No
    SAY @224
    IF ~~ DO ~SetGlobal("wm_spellshaper","GLOBAL",-1)~ EXIT
END

IF ~~ Yes
    SAY @225
    IF ~~ DO ~SetGlobal("wm_spellshaper","GLOBAL",2) SetGlobal("wm_level","LOCALS",-10) ChangeAIScript("wm_chao1",0)~ EXIT
END

IF ~G("wm_spellshaper",2)~ Done
    SAY @230 = @231 = @232
    IF ~~ DO ~SetGlobal("wm_spellshaper","GLOBAL",100)~ GOTO stateLevel1_23
END

IF ~OR(2) LevelLT(Myself,24) !CheckStatLT(Myself,19,38)~ stateLevel1_23
    SAY @200
    +~!LevelLT(Myself,5)~+ @217 + stateShear
    +~!LevelLT(Myself,3)~+ @216 + stateWeave
    +~Global("wm_feat_ambidextrous","LOCALS",0) !CheckStatLT(Myself,16,40)~+ @201 + stateAmbidex
    +~Global("wm_feat_ambidextrous","LOCALS",1) !CheckStatLT(Myself,16,40)~+ @202 + stateAmbidex
    +~CheckStat(Myself,1,56)~+ @203 + stateBackstab
    +~CheckStat(Myself,2,56) !LevelLT(Myself,5) !CheckStatLT(Myself,14,40)~+ @204 + stateBackstab
    +~CheckStat(Myself,3,56) !LevelLT(Myself,9) !CheckStatLT(Myself,15,40)~+ @205 + stateBackstab
    +~CheckStat(Myself,4,56) !LevelLT(Myself,15) !CheckStatLT(Myself,16,40)~+ @206 + stateBackstab
    +~Global("wm_feat_ambidextrous","LOCALS",2) !LevelLT(Myself,18)~+ @207 + stateSpeed
    +~CheckStat(Myself,1,96)~+ @208 + stateDagger
    +~Global("wm_feat_criticals","LOCALS",0) !LevelLT(Myself,9)~+ @210 + stateQuick
    +~Global("wm_feat_toughness","LOCALS",0) !LevelLT(Myself,3)~+ @211 + stateTough
    +~!GlobalGT("wm_feat_vicious","LOCALS",4) !LevelLT(Myself,3)~+ @212 + stateDamage
    +~!CheckStatLT(Myself,4,56) !LevelLT(Myself,18) !CheckStatLT(Myself,16,40)~+ @213 + stateAssassin
    +~Global("wm_feat_toughness","LOCALS",1) !LevelLT(Myself,18)~+ @214 + stateAvoid
    +~!CheckStatLT(Myself,16,40) !LevelLT(Myself,18)~+ @215 + stateEvade
END

IF ~!LevelLT(Myself,24) LevelLT(Myself,27) !CheckStatLT(Myself,15,38)~ stateLevel24_26
    SAY @200
    +~!LevelLT(Myself,5)~+ @217 + stateShear
    +~!LevelLT(Myself,3)~+ @216 + stateWeave
    +~Global("wm_feat_ambidextrous","LOCALS",0) !CheckStatLT(Myself,16,40)~+ @201 + stateAmbidex
    +~Global("wm_feat_ambidextrous","LOCALS",1) !CheckStatLT(Myself,16,40)~+ @202 + stateAmbidex
    +~CheckStat(Myself,1,56)~+ @203 + stateBackstab
    +~CheckStat(Myself,2,56) !LevelLT(Myself,5) !CheckStatLT(Myself,14,40)~+ @204 + stateBackstab
    +~CheckStat(Myself,3,56) !LevelLT(Myself,9) !CheckStatLT(Myself,15,40)~+ @205 + stateBackstab
    +~CheckStat(Myself,4,56) !LevelLT(Myself,15) !CheckStatLT(Myself,16,40)~+ @206 + stateBackstab
    +~Global("wm_feat_ambidextrous","LOCALS",2) !LevelLT(Myself,18)~+ @207 + stateSpeed
    +~CheckStat(Myself,1,96)~+ @208 + stateDagger
    +~Global("wm_feat_criticals","LOCALS",0) !LevelLT(Myself,9)~+ @210 + stateQuick
    +~Global("wm_feat_toughness","LOCALS",0) !LevelLT(Myself,3)~+ @211 + stateTough
    +~!GlobalGT("wm_feat_vicious","LOCALS",4) !LevelLT(Myself,3)~+ @212 + stateDamage
    +~!CheckStatLT(Myself,4,56) !LevelLT(Myself,18) !CheckStatLT(Myself,16,40)~+ @213 + stateAssassin
    +~Global("wm_feat_toughness","LOCALS",1) !LevelLT(Myself,18)~+ @214 + stateAvoid
    +~!CheckStatLT(Myself,16,40) !LevelLT(Myself,18)~+ @215 + stateEvade
END

IF ~!LevelLT(Myself,27) LevelLT(Myself,30) !CheckStatLT(Myself,16,38)~ stateLevel27_29
    SAY @200
    +~!LevelLT(Myself,5)~+ @217 + stateShear
    +~!LevelLT(Myself,3)~+ @216 + stateWeave
    +~Global("wm_feat_ambidextrous","LOCALS",0) !CheckStatLT(Myself,16,40)~+ @201 + stateAmbidex
    +~Global("wm_feat_ambidextrous","LOCALS",1) !CheckStatLT(Myself,16,40)~+ @202 + stateAmbidex
    +~CheckStat(Myself,1,56)~+ @203 + stateBackstab
    +~CheckStat(Myself,2,56) !LevelLT(Myself,5) !CheckStatLT(Myself,14,40)~+ @204 + stateBackstab
    +~CheckStat(Myself,3,56) !LevelLT(Myself,9) !CheckStatLT(Myself,15,40)~+ @205 + stateBackstab
    +~CheckStat(Myself,4,56) !LevelLT(Myself,15) !CheckStatLT(Myself,16,40)~+ @206 + stateBackstab
    +~Global("wm_feat_ambidextrous","LOCALS",2) !LevelLT(Myself,18)~+ @207 + stateSpeed
    +~CheckStat(Myself,1,96)~+ @208 + stateDagger
    +~Global("wm_feat_criticals","LOCALS",0) !LevelLT(Myself,9)~+ @210 + stateQuick
    +~Global("wm_feat_toughness","LOCALS",0) !LevelLT(Myself,3)~+ @211 + stateTough
    +~!GlobalGT("wm_feat_vicious","LOCALS",4) !LevelLT(Myself,3)~+ @212 + stateDamage
    +~!CheckStatLT(Myself,4,56) !LevelLT(Myself,18) !CheckStatLT(Myself,16,40)~+ @213 + stateAssassin
    +~Global("wm_feat_toughness","LOCALS",1) !LevelLT(Myself,18)~+ @214 + stateAvoid
    +~!CheckStatLT(Myself,16,40) !LevelLT(Myself,18)~+ @215 + stateEvade
END

IF ~!LevelLT(Myself,30) LevelLT(Myself,36) !CheckStatLT(Myself,17,38)~ stateLevel30_35
    SAY @200
    +~!LevelLT(Myself,5)~+ @217 + stateShear
    +~!LevelLT(Myself,3)~+ @216 + stateWeave
    +~Global("wm_feat_ambidextrous","LOCALS",0) !CheckStatLT(Myself,16,40)~+ @201 + stateAmbidex
    +~Global("wm_feat_ambidextrous","LOCALS",1) !CheckStatLT(Myself,16,40)~+ @202 + stateAmbidex
    +~CheckStat(Myself,1,56)~+ @203 + stateBackstab
    +~CheckStat(Myself,2,56) !LevelLT(Myself,5) !CheckStatLT(Myself,14,40)~+ @204 + stateBackstab
    +~CheckStat(Myself,3,56) !LevelLT(Myself,9) !CheckStatLT(Myself,15,40)~+ @205 + stateBackstab
    +~CheckStat(Myself,4,56) !LevelLT(Myself,15) !CheckStatLT(Myself,16,40)~+ @206 + stateBackstab
    +~Global("wm_feat_ambidextrous","LOCALS",2) !LevelLT(Myself,18)~+ @207 + stateSpeed
    +~CheckStat(Myself,1,96)~+ @208 + stateDagger
    +~Global("wm_feat_criticals","LOCALS",0) !LevelLT(Myself,9)~+ @210 + stateQuick
    +~Global("wm_feat_toughness","LOCALS",0) !LevelLT(Myself,3)~+ @211 + stateTough
    +~!GlobalGT("wm_feat_vicious","LOCALS",4) !LevelLT(Myself,3)~+ @212 + stateDamage
    +~!CheckStatLT(Myself,4,56) !LevelLT(Myself,18) !CheckStatLT(Myself,16,40)~+ @213 + stateAssassin
    +~Global("wm_feat_toughness","LOCALS",1) !LevelLT(Myself,18)~+ @214 + stateAvoid
    +~!CheckStatLT(Myself,16,40) !LevelLT(Myself,18)~+ @215 + stateEvade
END

IF ~!LevelLT(Myself,36) LevelLT(Myself,42) !CheckStatLT(Myself,18,38)~ stateLevel36_41
    SAY @200
    +~!LevelLT(Myself,5)~+ @217 + stateShear
    +~!LevelLT(Myself,3)~+ @216 + stateWeave
    +~Global("wm_feat_ambidextrous","LOCALS",0) !CheckStatLT(Myself,16,40)~+ @201 + stateAmbidex
    +~Global("wm_feat_ambidextrous","LOCALS",1) !CheckStatLT(Myself,16,40)~+ @202 + stateAmbidex
    +~CheckStat(Myself,1,56)~+ @203 + stateBackstab
    +~CheckStat(Myself,2,56) !LevelLT(Myself,5) !CheckStatLT(Myself,14,40)~+ @204 + stateBackstab
    +~CheckStat(Myself,3,56) !LevelLT(Myself,9) !CheckStatLT(Myself,15,40)~+ @205 + stateBackstab
    +~CheckStat(Myself,4,56) !LevelLT(Myself,15) !CheckStatLT(Myself,16,40)~+ @206 + stateBackstab
    +~Global("wm_feat_ambidextrous","LOCALS",2) !LevelLT(Myself,18)~+ @207 + stateSpeed
    +~CheckStat(Myself,1,96)~+ @208 + stateDagger
    +~Global("wm_feat_criticals","LOCALS",0) !LevelLT(Myself,9)~+ @210 + stateQuick
    +~Global("wm_feat_toughness","LOCALS",0) !LevelLT(Myself,3)~+ @211 + stateTough
    +~!GlobalGT("wm_feat_vicious","LOCALS",4) !LevelLT(Myself,3)~+ @212 + stateDamage
    +~!CheckStatLT(Myself,4,56) !LevelLT(Myself,18) !CheckStatLT(Myself,16,40)~+ @213 + stateAssassin
    +~Global("wm_feat_toughness","LOCALS",1) !LevelLT(Myself,18)~+ @214 + stateAvoid
    +~!CheckStatLT(Myself,16,40) !LevelLT(Myself,18)~+ @215 + stateEvade
END

IF ~~ stateShear
    SAY ~~
    IF ~~ DO ~AddSpecialAbility("wm_shear")~ EXIT
END

IF ~~ stateWeave
    SAY ~~
    IF ~~ DO ~AddSpecialAbility("wm_weave")~ EXIT
END

IF ~~ stateAmbidex
    SAY ~~
    IF ~Global("wm_feat_ambidextrous","LOCALS",0)~ DO ~ApplySpellRES("wm_#amb1",Myself) SetGlobal("wm_feat_ambidextrous","LOCALS",1)~ EXIT
    IF ~Global("wm_feat_ambidextrous","LOCALS",1)~ DO ~ApplySpellRES("wm_#amb2",Myself) SetGlobal("wm_feat_ambidextrous","LOCALS",2)~ EXIT
END

IF ~~ stateBackstab
    SAY ~~
    IF ~~ DO ~ApplySpellRES("wm_#stab",Myself)~ EXIT
END

IF ~~ stateSpeed
    SAY ~~
    IF ~~ DO ~ApplySpellRES("wm_#fast",Myself) SetGlobal("wm_feat_ambidextrous","LOCALS",3)~ EXIT
END

IF ~~ stateDagger
    SAY ~~
    IF ~~ DO ~ApplySpellRES("wm_#dag2",Myself)~ EXIT
END

IF ~~ stateQuick
    SAY ~~
    IF ~~ DO ~ApplySpellRES("wm_#crit",Myself) SetGlobal("wm_feat_criticals","LOCALS",1)~ EXIT
END

IF ~~ stateTough
    SAY ~~
    IF ~~ DO ~ApplySpellRES("wm_#toug",Myself) SetGlobal("wm_feat_toughness","LOCALS",1)~ EXIT
END

IF ~~ stateDamage
    SAY ~~
    IF ~~ DO ~ApplySpellRES("wm_#dam",Myself) SetGlobal("wm_feat_vicious","LOCALS",1)~ EXIT
END

IF ~~ stateAssassin
    SAY ~~
    IF ~~ DO ~AddSpecialAbility("SPCL916")~ EXIT
END

IF ~~ stateAvoid
    SAY ~~
    IF ~~ DO ~AddSpecialAbility("SPCL917")~ EXIT
END

IF ~~ stateEvade
    SAY ~~
    IF ~~ DO ~AddSpecialAbility("SPCL913")~ EXIT
END
