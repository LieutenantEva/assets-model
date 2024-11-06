$modelname "AmericaInfantryPilot.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AIRPLT_Body"
}
$bodygroup "Transceiver" {
	studio "bodies/AIRPLT_Transceiver"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "RPILOT SPINE" -4.00 -5.00 -8.00 8.00 6.00 8.00
$hbox 2 "RPILOT SPINE1" 0.00 -6.00 -8.00 9.30 6.00 8.00
$hbox 1 "RPILOT HEAD" -2.00 -8.30 -6.60 11.00 5.40 6.00
$hbox 4 "RPILOT L UPPERA" 0.00 -4.00 -5.00 13.00 4.00 4.00
$hbox 4 "RPILOT L FOREAR" 0.00 -4.00 -3.30 9.00 3.00 3.00
$hbox 4 "RPILOT L HAND" -1.00 -2.00 -4.00 7.00 2.00 3.00
$hbox 5 "RPILOT R UPPERA" 0.00 -4.00 -5.00 13.00 4.00 4.00
$hbox 5 "RPILOT R FOREAR" 0.00 -4.00 -3.30 9.00 3.00 3.00
$hbox 5 "RPILOT R HAND" -1.00 -2.00 -3.00 8.00 2.00 4.00
$hbox 6 "RPILOT L THIGH" 0.00 -5.00 -4.30 30.00 6.00 3.00
$hbox 6 "RPILOT L FOOT" -1.00 -3.00 -3.00 4.00 11.30 2.00
$hbox 7 "RPILOT R THIGH" 0.00 -5.00 -4.00 30.00 6.00 4.50
$hbox 7 "RPILOT R FOOT" -1.00 -3.00 -2.00 4.00 11.30 3.00


// Idle
$sequence "DefaultConditionState STA" {
	"anims/AIRPLT_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 21
}
$sequence "DefaultConditionState IDA" {
	"anims/IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/AIRPLT_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Running
$sequence "MOVING" {
	"anims/AIRPLT_RNA"
	fps 30
	loop
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/AIRPLT_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 23 }
	X
}
$sequence "DYING DTB" {
	"anims/AIRPLT_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 38 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/AIRPLT_ADTE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/AIRPLT_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/AIRPLT_ADTE3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/AIRPLT_CHA"
	fps 30
	loop
	rotate -90
}


// Parachute
$sequence "FREEFALL" {
	"anims/AIRPLT_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/AIRPLT_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
//@TODO -- MISSING ANIMATION FILE
//$sequence "TRANS_Falling TRANS_Chute" {
//	"anims/AIRPLT_POP"
//	fps 30
//	rotate -90
//	ACT_HOVER 1
//}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/AIRPLT_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// !!!UNUSED!!!
$sequence "unused SUR" {
	"anims/AIRPLT_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/AIRPLT_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SURX" {
	"anims/AIRPLT_SURX"
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
	{ event 1004 7 "common/npc_step2.wav" }
	{ event 1004 20 "common/npc_step4.wav" }
	{ event 1004 30 "common/npc_step2.wav" }
	{ event 1004 41 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 7 "common/npc_step2.wav" }
	{ event 1004 20 "common/npc_step4.wav" }
	{ event 1004 30 "common/npc_step2.wav" }
	{ event 1004 41 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 7 "common/npc_step2.wav" }
	{ event 1004 20 "common/npc_step4.wav" }
	{ event 1004 30 "common/npc_step2.wav" }
	{ event 1004 41 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 7 "common/npc_step2.wav" }
	{ event 1004 20 "common/npc_step4.wav" }
	{ event 1004 30 "common/npc_step2.wav" }
	{ event 1004 41 "common/npc_step4.wav" }
}
$sequence "victorydance" {
	"anims/AIRPLT_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/AIRPLT_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/AIRPLT_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/AIRPLT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/AIRPLT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/AIRPLT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/AIRPLT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
