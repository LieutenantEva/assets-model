$modelname "GLAInfantryHijacker.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UIHJCK_SKN"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UIHJCK SPINE" -4.00 -6.00 -9.00 7.00 6.00 9.00
$hbox 2 "UIHJCK SPINE1" 0.00 -6.00 -10.00 10.00 7.00 10.00
$hbox 1 "UIHJCK HEAD" -2.00 -6.00 -5.00 14.00 7.00 5.00
$hbox 4 "UIHJCK L UPPERA" 0.00 -4.00 -5.00 13.00 4.00 4.00
$hbox 4 "UIHJCK L FOREAR" 0.00 -4.00 -3.30 9.00 3.00 3.00
$hbox 4 "UIHJCK L HAND" -1.00 -2.00 -4.00 7.00 2.00 3.00
$hbox 5 "UIHJCK R UPPERA" 0.00 -4.00 -5.00 13.00 4.00 4.00
$hbox 5 "UIHJCK R FOREAR" 0.00 -4.00 -3.30 9.00 3.00 3.00
$hbox 5 "UIHJCK R HAND" -1.00 -2.00 -3.00 8.00 2.00 4.00
$hbox 6 "UIHJCK L THIGH" 0.00 -5.00 -4.30 35.00 6.00 3.00
$hbox 6 "UIHJCK L FOOT" -1.00 -8.00 -3.30 4.00 11.00 3.00
$hbox 7 "UIHJCK R THIGH" 0.00 -5.00 -4.00 35.00 6.00 4.50
$hbox 7 "UIHJCK R FOOT" -1.00 -8.00 -3.00 4.00 11.00 4.00


// Idle
$sequence "DefaultConditionState STA" {
	"anims/UIHJCK_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 26
}
$sequence "DefaultConditionState IDA" {
	"anims/UIHJCK_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/UIHJCK_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Running
$sequence "MOVING" {
	"anims/UIHJCK_RUN"
	fps 30
	loop
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/UIHJCK_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 48 }
	X
}
$sequence "DYING DTB" {
	"anims/UIHJCK_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 103 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/UIHJCK_ADTE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/UIHJCK_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/UIHJCK_ADTE3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/UIHJCK_CHA"
	fps 30
	loop
	rotate -90
}


// Parachute
//$sequence "FREEFALL" {
//	"anims/UIHJCK_PFL"
//	fps 30
//	rotate -90
//}
$sequence "PARACHUTING" {
	"anims/UIHJCK_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/UIHJCK_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/UIHJCK_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// !!!UNUSED!!!
$sequence "unused SUR" {
	"anims/UIHJCK_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/UIHJCK_SST"
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
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 16 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 16 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 16 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 16 "common/npc_step4.wav" }
}
$sequence "victorydance" {
	"anims/UIHJCK_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/UIHJCK_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/UIHJCK_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/UIHJCK_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/UIHJCK_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/UIHJCK_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/UIHJCK_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
