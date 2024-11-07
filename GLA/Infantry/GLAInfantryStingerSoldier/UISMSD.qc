$modelname "GLAInfantryStingerSoldier.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UISMSD_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/UISMSD_Stinger"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UISMSD SPINE" -4.08 -6.44 -9.50 9.00 6.08 9.50
$hbox 2 "UISMSD SPINE1" 0.00 -6.00 -9.50 9.56 6.00 9.50
$hbox 1 "UISMSD HEAD" -1.84 -5.72 -4.91 13.00 6.34 5.72
$hbox 4 "UISMSD L UPPERA" 0.00 -4.41 -3.07 14.31 2.87 2.34
$hbox 4 "UISMSD L FOREAR" 0.00 -3.80 -3.20 10.00 3.30 2.20
$hbox 4 "UISMSD L HAND" 0.00 -3.15 -2.84 8.71 1.13 1.97
$hbox 5 "UISMSD R UPPERA" 0.00 -4.26 -2.39 16.35 2.46 3.39
$hbox 5 "UISMSD R FOREAR" 0.00 -4.50 -2.50 10.00 3.00 3.50
$hbox 5 "UISMSD R HAND" 0.00 -3.14 -1.97 8.58 1.26 2.85
$hbox 6 "UISMSD L THIGH" 0.00 -5.37 -3.57 35.91 4.65 4.20
$hbox 6 "UISMSD L FOOT" -0.22 -2.72 -1.50 4.10 10.00 2.87
$hbox 7 "UISMSD R THIGH" 0.00 -5.37 -2.79 35.91 4.73 4.37
$hbox 7 "UISMSD R FOOT" -0.21 -2.22 -1.58 4.10 10.00 2.81
$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "MUZZLE02" 0 0 0
$attachment 2 "EXHAUST01" 0 0 0


// Idle
$sequence "DefaultConditionState STA" {
	"anims/UISMSD_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 46
}
$sequence "DefaultConditionState IDA" {
	"anims/UISMSD_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState STB" {
	"anims/UISMSD_STB"
	fps 30
	loop
	rotate -90
}
$sequence "DefaultConditionState IDC" {
	"anims/UISMSD_IDC"
	fps 30
	loop
	rotate -90
}
$sequence "DefaultConditionState IDD" {
	"anims/UISMSD_IDD"
	fps 30
	loop
	rotate -90
}


// Walking
$sequence "MOVING WKA" {
	"anims/UISMSD_WKA"
	fps 30
	loop
	rotate -90
}
$sequence "MOVING WKB" {
	"anims/UISMSD_WKB"
	fps 30
	loop
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/UISMSD_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 39 }
	X
}
$sequence "DYING DTB" {
	"anims/UISMSD_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 37 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing ADTF1" {
	"anims/UISMSD_ADTF1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING ADTF2" {
	"anims/UISMSD_ADTF2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING ADTF3" {
	"anims/UISMSD_ADTF3"
	fps 30
	rotate -90
}
$sequence "TRANS_Dying TRANS_Flailing ADTG21" {
	"anims/UISMSD_ADTG21"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING ADTG22" {
	"anims/UISMSD_ADTG22"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING ADTG23" {
	"anims/UISMSD_ADTG23"
	fps 30
	rotate -90
}


// Firing
$sequence "FIRING_A" {
	"anims/UISMSD_ATA"
	fps 30
	loop
	rotate -90
}
$sequence "FIRING_B" {
	"anims/UISMSD_ATB"
	fps 30
	loop
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/UISMSD_CHA"
	fps 30
	loop
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused DTA2" {
	"anims/UISMSD_DTA2"
	fps 30
	loop
	rotate -90
}
$sequence "unused DTB2" {
	"anims/UISMSD_DTB2"
	fps 30
	loop
	rotate -90
}
$sequence "unused CHB" {
	"anims/UISMSD_CHB"
	fps 30
	loop
	rotate -90
}
$sequence "unused CHBST" {
	"anims/UISMSD_CHBST"
	fps 30
	loop
	rotate -90
}
$sequence "unused CHBLP" {
	"anims/UISMSD_CHBLP"
	fps 30
	loop
	rotate -90
}
$sequence "unused CHBED" {
	"anims/UISMSD_CHBED"
	fps 30
	loop
	rotate -90
}
$sequence "unused TCADN" {
	"anims/UISMSD_TCADN"
	fps 30
	loop
	rotate -90
}
$sequence "unused TCALP" {
	"anims/UISMSD_TCALP"
	fps 30
	loop
	rotate -90
}
$sequence "unused TCAED" {
	"anims/UISMSD_TCAED"
	fps 30
	loop
	rotate -90
}
$sequence "unused TCBDN" {
	"anims/UISMSD_TCBDN"
	fps 30
	loop
	rotate -90
}
$sequence "unused TCBLP" {
	"anims/UISMSD_TCBLP"
	fps 30
	loop
	rotate -90
}
$sequence "unused TCBUP" {
	"anims/UISMSD_TCBUP"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUR" {
	"anims/UISMSD_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/UISMSD_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SWK" {
	"anims/UISMSD_SWK"
	fps 30
	loop
	rotate -90
}
$sequence "unused SURB" {
	"anims/UISMSD_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SSTB" {
	"anims/UISMSD_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SWKB" {
	"anims/UISMSD_SWK"
	fps 30
	loop
	rotate -90
}


// Basic monster sequences
$sequence "run" {
	"anims/_run"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 11 "common/npc_step2.wav" }
	{ event 1004 26 "common/npc_step4.wav" }
	{ event 1004 48 "common/npc_step2.wav" }
	{ event 1004 72 "common/npc_step4.wav" }
	{ event 1004 98 "common/npc_step2.wav" }
	{ event 1004 121 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_walk"
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 3 "common/npc_step2.wav" }
	{ event 1004 18 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 11 "common/npc_step2.wav" }
	{ event 1004 26 "common/npc_step4.wav" }
	{ event 1004 48 "common/npc_step2.wav" }
	{ event 1004 72 "common/npc_step4.wav" }
	{ event 1004 98 "common/npc_step2.wav" }
	{ event 1004 121 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_walk"
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 3 "common/npc_step2.wav" }
	{ event 1004 18 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/UISMSD_IDC"
	fps 305
	rotate -90
	ACT_RELOAD 1
}
$sequence "shoot" {
	"anims/UISMSD_ATA"
	fps 59.50
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 1 5 }
	{ event 5001 5 "101" }
	{ event 5011 5 "101" }
	{ event 5021 5 "101" }
}
$sequence "shoot2" {
	"anims/UISMSD_ATB"
	fps 104
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 1 51 }
	{ event 5001 51 "101" }
	{ event 5011 51 "101" }
	{ event 5021 51 "101" }
}
$sequence "victorydance" {
	"anims/UISMSD_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/UISMSD_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/UISMSD_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/UISMSD_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/UISMSD_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/UISMSD_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/UISMSD_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
