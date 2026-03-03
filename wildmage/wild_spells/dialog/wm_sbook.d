/** @tra dialog.tra */
/* Generated from wm_sbook.td - do not edit */

BEGIN WM_SBOOK

IF ~Global("wm_book_open","LOCALS",0)~ 1
    SAY @0
    ++ @10 + study
    ++ @11 + close
END

IF ~Global("wm_book_open","LOCALS",5)~ 2
    SAY @1
    ++ @10 + study
    ++ @11 + close
END

IF ~Global("wm_book_open","LOCALS",10)~ 3
    SAY @2
    ++ @10 + study
    ++ @11 + close
END

IF ~OR(3) Global("wm_book_open","LOCALS",7) Global("wm_book_open","LOCALS",14) Global("wm_book_open","LOCALS",21)~ state4
    SAY @3
    +~RandomNum(21,1)~+ @11 DO ~GiveItemCreate("SCRL7k",Myself,1,0,0)~ + close
    +~RandomNum(21,2)~+ @11 DO ~GiveItemCreate("SCRL5p",Myself,1,0,0)~ + close
    +~RandomNum(21,3)~+ @11 DO ~GiveItemCreate("SCRL5Q",Myself,1,0,0)~ + close
    +~RandomNum(21,4)~+ @11 DO ~GiveItemCreate("SCRL1u",Myself,1,0,0)~ + close
    +~RandomNum(21,5)~+ @11 DO ~GiveItemCreate("SCRL6q",Myself,1,0,0)~ + close
    +~RandomNum(21,6)~+ @11 DO ~GiveItemCreate("SCRL5i",Myself,1,0,0)~ + close
    +~RandomNum(21,7)~+ @11 DO ~GiveItemCreate("SCRL1s",Myself,1,0,0)~ + close
    +~RandomNum(21,8)~+ @11 DO ~GiveItemCreate("SCRLA5",Myself,1,0,0)~ + close
    +~RandomNum(21,9)~+ @11 DO ~GiveItemCreate("SCRLA7",Myself,1,0,0)~ + close
    +~RandomNum(21,10)~+ @11 DO ~GiveItemCreate("SCRL1d",Myself,1,0,0)~ + close
    +~RandomNum(21,11)~+ @11 DO ~GiveItemCreate("SCRL95",Myself,1,0,0)~ + close
    +~RandomNum(21,12)~+ @11 DO ~GiveItemCreate("SCRLA3",Myself,1,0,0)~ + close
    +~RandomNum(21,13)~+ @11 DO ~GiveItemCreate("SCRL6f",Myself,1,0,0)~ + close
    +~RandomNum(21,14)~+ @11 DO ~GiveItemCreate("SCRL91",Myself,1,0,0)~ + close
    +~RandomNum(21,15)~+ @11 DO ~GiveItemCreate("SCRL94",Myself,1,0,0)~ + close
    +~RandomNum(21,16)~+ @11 DO ~GiveItemCreate("SCRL66",Myself,1,0,0)~ + close
    +~RandomNum(21,17)~+ @11 DO ~GiveItemCreate("SCRL75",Myself,1,0,0)~ + close
    +~RandomNum(21,18)~+ @11 DO ~GiveItemCreate("SCRL71",Myself,1,0,0)~ + close
    +~RandomNum(21,19)~+ @11 DO ~GiveItemCreate("SCRL70",Myself,1,0,0)~ + close
    +~RandomNum(21,20)~+ @11 DO ~GiveItemCreate("SCRL83",Myself,1,0,0)~ + close
    +~RandomNum(21,21)~+ @11 DO ~GiveItemCreate("SCRLa6",Myself,1,0,0)~ + close
END

IF ~!GlobalLT("wm_book_spell","LOCALS",36)~ 4a
    SAY @9
    IF ~~ DO ~ActionOverride(Myself,DestroyItem("wm_sbook"))~ EXIT
END

IF ~!GlobalLT("wm_book_spell","LOCALS",31)~ 4b
    SAY @8
    ++ @10 + study
    ++ @11 + close
END

IF ~RandomNum(4,1)~ 5
    SAY @4
    ++ @10 + study
    ++ @11 + close
END

IF ~RandomNum(4,2)~ 6
    SAY @5
    ++ @10 + study
    ++ @11 + close
END

IF ~RandomNum(4,3)~ 7
    SAY @6
    ++ @10 + study
    ++ @11 + close
END

IF ~RandomNum(4,4)~ 8
    SAY @7
    ++ @10 + study
    ++ @11 + close
END

IF ~~ state03
    SAY ~~
    IF ~LevelLT(Myself,3)~ GOTO fail
    IF ~!LevelGT(Myself,3) GlobalGT("wm_book_spell","LOCALS",7)~ GOTO fail
    IF ~!LevelLT(Myself,3) OR(2) LevelGT(Myself,3) Global("wm_book_spell","LOCALS",7)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_blade")) IncrementGlobal("wm_book_spell","LOCALS",2)~ GOTO success
END

IF ~~ state04
    SAY ~~
    IF ~LevelLT(Myself,3)~ GOTO fail
    IF ~!LevelGT(Myself,3) GlobalGT("wm_book_spell","LOCALS",7)~ GOTO fail
    IF ~!LevelLT(Myself,3) OR(2) LevelGT(Myself,3) Global("wm_book_spell","LOCALS",7)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_miss")) IncrementGlobal("wm_book_spell","LOCALS",1)~ GOTO success
END

IF ~~ state05
    SAY ~~
    IF ~LevelLT(Myself,5)~ GOTO fail
    IF ~!LevelGT(Myself,5) GlobalGT("wm_book_spell","LOCALS",10)~ GOTO fail
    IF ~!LevelLT(Myself,5) OR(2) LevelGT(Myself,5) Global("wm_book_spell","LOCALS",10)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_light")) IncrementGlobal("wm_book_spell","LOCALS",2)~ GOTO success
END

IF ~~ state06
    SAY ~~
    IF ~LevelLT(Myself,5)~ GOTO fail
    IF ~!LevelGT(Myself,5) GlobalGT("wm_book_spell","LOCALS",10)~ GOTO fail
    IF ~!LevelLT(Myself,5) OR(2) LevelGT(Myself,5) Global("wm_book_spell","LOCALS",10)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_word")) IncrementGlobal("wm_book_spell","LOCALS",1)~ GOTO success
END

IF ~~ state07
    SAY ~~
    IF ~LevelLT(Myself,7)~ GOTO fail
    IF ~!LevelGT(Myself,7) GlobalGT("wm_book_spell","LOCALS",13)~ GOTO fail
    IF ~!LevelLT(Myself,7) OR(2) LevelGT(Myself,7) Global("wm_book_spell","LOCALS",13)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_heal")) IncrementGlobal("wm_book_spell","LOCALS",2)~ GOTO success
END

IF ~~ state08
    SAY ~~
    IF ~LevelLT(Myself,7)~ GOTO fail
    IF ~!LevelGT(Myself,7) GlobalGT("wm_book_spell","LOCALS",13)~ GOTO fail
    IF ~!LevelLT(Myself,7) OR(2) LevelGT(Myself,7) Global("wm_book_spell","LOCALS",13)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_glyph")) IncrementGlobal("wm_book_spell","LOCALS",1)~ GOTO success
END

IF ~~ state09
    SAY ~~
    IF ~LevelLT(Myself,9)~ GOTO fail
    IF ~!LevelGT(Myself,9) GlobalGT("wm_book_spell","LOCALS",16)~ GOTO fail
    IF ~!LevelLT(Myself,9) OR(2) LevelGT(Myself,9) Global("wm_book_spell","LOCALS",16)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_luck")) IncrementGlobal("wm_book_spell","LOCALS",2)~ GOTO success
END

IF ~~ state10
    SAY ~~
    IF ~LevelLT(Myself,9)~ GOTO fail
    IF ~!LevelGT(Myself,9) GlobalGT("wm_book_spell","LOCALS",16)~ GOTO fail
    IF ~!LevelLT(Myself,9) OR(2) LevelGT(Myself,9) Global("wm_book_spell","LOCALS",16)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_vortx")) IncrementGlobal("wm_book_spell","LOCALS",1)~ GOTO success
END

IF ~~ state11
    SAY ~~
    IF ~LevelLT(Myself,11)~ GOTO fail
    IF ~!LevelGT(Myself,11) GlobalGT("wm_book_spell","LOCALS",19)~ GOTO fail
    IF ~!LevelLT(Myself,11) OR(2) LevelGT(Myself,11) Global("wm_book_spell","LOCALS",19)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_unlk")) IncrementGlobal("wm_book_spell","LOCALS",2)~ GOTO success
END

IF ~~ state12
    SAY ~~
    IF ~LevelLT(Myself,11)~ GOTO fail
    IF ~!LevelGT(Myself,11) GlobalGT("wm_book_spell","LOCALS",19)~ GOTO fail
    IF ~!LevelLT(Myself,11) OR(2) LevelGT(Myself,11) Global("wm_book_spell","LOCALS",19)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_strik")) IncrementGlobal("wm_book_spell","LOCALS",1)~ GOTO success
END

IF ~~ state13
    SAY ~~
    IF ~LevelLT(Myself,13)~ GOTO fail
    IF ~!LevelGT(Myself,13) GlobalGT("wm_book_spell","LOCALS",22)~ GOTO fail
    IF ~!LevelLT(Myself,13) OR(2) LevelGT(Myself,13) Global("wm_book_spell","LOCALS",22)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_disp")) IncrementGlobal("wm_book_spell","LOCALS",2)~ GOTO success
END

IF ~~ state14
    SAY ~~
    IF ~LevelLT(Myself,13)~ GOTO fail
    IF ~!LevelGT(Myself,13) GlobalGT("wm_book_spell","LOCALS",22)~ GOTO fail
    IF ~!LevelLT(Myself,13) OR(2) LevelGT(Myself,13) Global("wm_book_spell","LOCALS",22)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_cow")) IncrementGlobal("wm_book_spell","LOCALS",1)~ GOTO success
END

IF ~~ state15
    SAY ~~
    IF ~LevelLT(Myself,15)~ GOTO fail
    IF ~!LevelGT(Myself,15) GlobalGT("wm_book_spell","LOCALS",25)~ GOTO fail
    IF ~!LevelLT(Myself,15) OR(2) LevelGT(Myself,15) Global("wm_book_spell","LOCALS",25)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_eye")) IncrementGlobal("wm_book_spell","LOCALS",2)~ GOTO success
END

IF ~~ state16
    SAY ~~
    IF ~LevelLT(Myself,15)~ GOTO fail
    IF ~!LevelGT(Myself,15) GlobalGT("wm_book_spell","LOCALS",25)~ GOTO fail
    IF ~!LevelLT(Myself,15) OR(2) LevelGT(Myself,15) Global("wm_book_spell","LOCALS",25)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_recup")) IncrementGlobal("wm_book_spell","LOCALS",1)~ GOTO success
END

IF ~~ state17
    SAY ~~
    IF ~LevelLT(Myself,17)~ GOTO fail
    IF ~!LevelGT(Myself,17) GlobalGT("wm_book_spell","LOCALS",28)~ GOTO fail
    IF ~!LevelLT(Myself,17) OR(2) LevelGT(Myself,17) Global("wm_book_spell","LOCALS",28)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_shld")) IncrementGlobal("wm_book_spell","LOCALS",2)~ GOTO success
END

IF ~~ state18
    SAY ~~
    IF ~LevelLT(Myself,17)~ GOTO fail
    IF ~!LevelGT(Myself,17) GlobalGT("wm_book_spell","LOCALS",28)~ GOTO fail
    IF ~!LevelLT(Myself,17) OR(2) LevelGT(Myself,17) Global("wm_book_spell","LOCALS",28)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_sphr")) IncrementGlobal("wm_book_spell","LOCALS",1)~ GOTO success
END

IF ~~ state19
    SAY ~~
    IF ~LevelLT(Myself,19)~ GOTO fail
    IF ~!LevelLT(Myself,19)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_reinc")) IncrementGlobal("wm_book_spell","LOCALS",1)~ GOTO success
END

IF ~~ fun
    SAY @18
    IF ~~ DO ~IncrementGlobal("wm_book_spell","LOCALS",1)~ EXIT
END

IF ~~ study
    SAY @13
    IF ~OR(3) Global("wm_book_spell","LOCALS",35) !GlobalGT("wm_book_spell","LOCALS",30) GlobalLT("wm_book_spell_A","LOCALS",9)~ DO ~IncrementGlobal("wm_book_open","LOCALS",1)~ GOTO study1
    IF ~Global("wm_book_spell","LOCALS",31) !GlobalLT("wm_level","LOCALS",19)~ DO ~IncrementGlobal("wm_book_open","LOCALS",1)~ GOTO study1
    IF ~Global("wm_book_spell","LOCALS",31) GlobalLT("wm_level","LOCALS",19)~ DO ~IncrementGlobal("wm_book_open","LOCALS",1)~ GOTO study2
    IF ~!GlobalLT("wm_book_spell","LOCALS",32) !GlobalGT("wm_book_spell","LOCALS",34)~ DO ~IncrementGlobal("wm_book_open","LOCALS",1)~ GOTO study3
END

IF ~~ close
    SAY @19
    IF ~~ DO ~IncrementGlobal("wm_book_open","LOCALS",1)~ EXIT
END

IF ~~ fail
    SAY @16
    IF ~~ EXIT
END

IF ~~ success
    SAY @17
    IF ~~ EXIT
END

IF ~~ study1
    SAY @14
    +~OR(2) Global("wm_book_spell","LOCALS",0) Global("wm_book_spell","LOCALS",1)~+ @20 + state00
    +~OR(2) Global("wm_book_spell","LOCALS",0) Global("wm_book_spell","LOCALS",6)~+ @22 + state02
    +~OR(2) Global("wm_book_spell","LOCALS",7) Global("wm_book_spell","LOCALS",8)~+ @23 + state03
    +~OR(2) Global("wm_book_spell","LOCALS",7) Global("wm_book_spell","LOCALS",9)~+ @24 + state04
    +~OR(2) Global("wm_book_spell","LOCALS",10) Global("wm_book_spell","LOCALS",11)~+ @25 + state05
    +~OR(2) Global("wm_book_spell","LOCALS",10) Global("wm_book_spell","LOCALS",12)~+ @26 + state06
    +~OR(2) Global("wm_book_spell","LOCALS",13) Global("wm_book_spell","LOCALS",14)~+ @27 + state07
    +~OR(2) Global("wm_book_spell","LOCALS",13) Global("wm_book_spell","LOCALS",15)~+ @28 + state08
    +~OR(2) Global("wm_book_spell","LOCALS",16) Global("wm_book_spell","LOCALS",17)~+ @29 + state09
    +~OR(2) Global("wm_book_spell","LOCALS",16) Global("wm_book_spell","LOCALS",18)~+ @30 + state10
    +~OR(2) Global("wm_book_spell","LOCALS",19) Global("wm_book_spell","LOCALS",20)~+ @31 + state11
    +~OR(2) Global("wm_book_spell","LOCALS",19) Global("wm_book_spell","LOCALS",21)~+ @32 + state12
    +~OR(2) Global("wm_book_spell","LOCALS",22) Global("wm_book_spell","LOCALS",23)~+ @33 + state13
    +~OR(2) Global("wm_book_spell","LOCALS",22) Global("wm_book_spell","LOCALS",24)~+ @34 + state14
    +~OR(2) Global("wm_book_spell","LOCALS",25) Global("wm_book_spell","LOCALS",26)~+ @35 + state15
    +~OR(2) Global("wm_book_spell","LOCALS",25) Global("wm_book_spell","LOCALS",27)~+ @36 + state16
    +~OR(2) Global("wm_book_spell","LOCALS",28) Global("wm_book_spell","LOCALS",29)~+ @37 + state17
    +~OR(2) Global("wm_book_spell","LOCALS",28) Global("wm_book_spell","LOCALS",30)~+ @38 + state18
    +~Global("wm_book_spell","LOCALS",31) !GlobalLT("wm_level","LOCALS",19)~+ @39 + state19
    +~Global("wm_book_spell","LOCALS",35)~+ @40 + state20
    +~Global("wm_book_spell_A","LOCALS",0) GlobalGT("wm_book_spell","LOCALS",0)~+ @41 + state21
    +~Global("wm_book_spell_A","LOCALS",1) GlobalGT("wm_book_spell","LOCALS",7)~+ @42 + state22
    +~Global("wm_book_spell_A","LOCALS",2) GlobalGT("wm_book_spell","LOCALS",10)~+ @43 + state23
    +~Global("wm_book_spell_A","LOCALS",3) GlobalGT("wm_book_spell","LOCALS",13)~+ @44 + state24
    +~Global("wm_book_spell_A","LOCALS",4) GlobalGT("wm_book_spell","LOCALS",16)~+ @45 + state25
    +~Global("wm_book_spell_A","LOCALS",5) GlobalGT("wm_book_spell","LOCALS",19)~+ @46 + state26
    +~Global("wm_book_spell_A","LOCALS",6) GlobalGT("wm_book_spell","LOCALS",22)~+ @47 + state27
    +~Global("wm_book_spell_A","LOCALS",7) GlobalGT("wm_book_spell","LOCALS",25)~+ @48 + state28
    +~Global("wm_book_spell_A","LOCALS",8) GlobalGT("wm_book_spell","LOCALS",28)~+ @49 + state29
    ++ @11 + close2
END

IF ~~ study2
    SAY @15
    ++ @11 + close2
END

IF ~~ study3
    SAY @15
    ++ @11 DO ~IncrementGlobal("wm_book_spell","LOCALS",1)~ + close2
END

IF ~~ state00
    SAY ~~
    IF ~Level(Myself,1) GlobalGT("wm_book_spell","LOCALS",0)~ GOTO fail
    IF ~OR(2) LevelGT(Myself,1) Global("wm_book_spell","LOCALS",0)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_rnd")) IncrementGlobal("wm_book_spell","LOCALS",6)~ GOTO success
END

IF ~~ state02
    SAY ~~
    IF ~Level(Myself,1) GlobalGT("wm_book_spell","LOCALS",0)~ GOTO fail
    IF ~OR(2) LevelGT(Myself,1) Global("wm_book_spell","LOCALS",0)~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_sqrl")) IncrementGlobal("wm_book_spell","LOCALS",1)~ GOTO success
END

IF ~~ state20
    SAY ~~
    IF ~LevelLT(Myself,20)~ GOTO fail
    IF ~!LevelLT(Myself,20)~ GOTO fun
END

IF ~~ state21
    SAY ~~
    IF ~~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_attr")) IncrementGlobal("wm_book_spell_A","LOCALS",1)~ GOTO success
END

IF ~~ state22
    SAY ~~
    IF ~~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_horde")) IncrementGlobal("wm_book_spell_A","LOCALS",1)~ GOTO success
END

IF ~~ state23
    SAY ~~
    IF ~~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_rnd2")) IncrementGlobal("wm_book_spell_A","LOCALS",1)~ GOTO success
END

IF ~~ state24
    SAY ~~
    IF ~~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_liq")) IncrementGlobal("wm_book_spell_A","LOCALS",1)~ GOTO success
END

IF ~~ state25
    SAY ~~
    IF ~~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_rnd3")) IncrementGlobal("wm_book_spell_A","LOCALS",1)~ GOTO success
END

IF ~~ state26
    SAY ~~
    IF ~~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_armor")) IncrementGlobal("wm_book_spell_A","LOCALS",1)~ GOTO success
END

IF ~~ state27
    SAY ~~
    IF ~~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_rnd4")) IncrementGlobal("wm_book_spell_A","LOCALS",1)~ GOTO success
END

IF ~~ state28
    SAY ~~
    IF ~~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_chaob")) IncrementGlobal("wm_book_spell_A","LOCALS",1)~ GOTO success
END

IF ~~ state29
    SAY ~~
    IF ~~ DO ~ActionOverride(Myself,AddSpecialAbility("wm_wfire")) IncrementGlobal("wm_book_spell_A","LOCALS",1)~ GOTO success
END

IF ~~ close2
    SAY @19
    IF ~~ EXIT
END
