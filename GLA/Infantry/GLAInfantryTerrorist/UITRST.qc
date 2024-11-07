$modelname "GLAInfantryTerrorist.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UITRST_SKN"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UITRST SPINE" -5.00 -7.20 -9.00 8.00 7.20 9.00
$hbox 2 "UITRST SPINE1" 0.00 -7.20 -9.00 10.00 7.20 9.00
$hbox 1 "UITRST HEAD" -2.00 -7.00 -5.00 13.00 7.00 5.00
$hbox 4 "UITRST L UPPERA" 0.00 -3.54 -4.42 16.34 2.89 2.94
$hbox 4 "UITRST L FOREAR" 0.00 -2.37 -0.79 12.72 1.74 1.84
$hbox 4 "UITRST L HAND" 0.00 -1.02 -3.98 6.78 0.19 3.13
$hbox 5 "UITRST R UPPERA" 0.00 -3.72 -2.74 15.72 2.65 2.64
$hbox 5 "UITRST R FOREAR" 0.00 -2.43 -1.29 12.90 2.12 1.34
$hbox 5 "UITRST R HAND" 0.00 -1.02 -2.64 6.62 0.35 4.05
$hbox 6 "UITRST L THIGH" 0.00 -6.00 -4.30 36.00 6.00 4.30
$hbox 6 "UITRST L FOOT" 0.00 -4.00 -4.00 4.00 13.00 4.00
$hbox 7 "UITRST R THIGH" 0.00 -6.00 -4.30 36.00 6.00 4.60
$hbox 7 "UITRST R FOOT" 0.00 -4.00 -4.00 4.00 13.00 4.00


// Idle
$sequence "DefaultConditionState STA" {
	"anims/UITRST_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 26
}
//Regular spice animations
$sequence "DefaultConditionState IDA" {
	"anims/UITRST_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/UITRST_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Running
$sequence "MOVING" {
	"anims/UITRST_RNA"
	fps 30
	loop
	rotate -90
}


// Attacking
$sequence "ATTACKING MOVING" {
	"anims/UITRST_RNB"
	fps 30
	loop
	rotate -90
}
$sequence "PREATTACK_A" {
	"anims/UITRST_ATA"
	fps 30
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/UITRST_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 48 }
	X
}
$sequence "DYING DTC" {
	"anims/UITRST_DTC"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 48 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/UITRST_ADTE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/UITRST_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/UITRST_ADTE3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/UITRST_CHA"
	fps 30
	loop
	rotate -90
}


// Parachute
$sequence "FREEFALL" {
	"anims/UITRST_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/UITRST_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/UITRST_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/UITRST_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// !!!UNUSED!!!
$sequence "unused DBLU" {
	"anims/UITRST_DBLU"
	fps 30
	loop
	rotate -90
}
$sequence "unused DGRN" {
	"anims/UITRST_DGRN"
	fps 30
	loop
	rotate -90
}
$sequence "unused DTB1" {
	"anims/UITRST_DTB1"
	fps 30
	loop
	rotate -90
}
$sequence "unused DTB2" {
	"anims/UITRST_DTB2"
	fps 30
	loop
	rotate -90
}
$sequence "unused DTB3" {
	"anims/UITRST_DTB3"
	fps 30
	loop
	rotate -90
}
$sequence "unused DTD1" {
	"anims/UITRST_DTD1"
	fps 30
	loop
	rotate -90
}
$sequence "unused DTD2" {
	"anims/UITRST_DTD2"
	fps 30
	loop
	rotate -90
}
$sequence "unused DTD3" {
	"anims/UITRST_DTD3"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUR" {
	"anims/UITRST_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/UITRST_SST"
	fps 30
	loop
	rotate -90
}


// Houndeye sequences
$sequence "run" {
	"anims/_run"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 5 "common/npc_step2.wav" }
	{ event 1004 13 "common/npc_step4.wav" }
}
$sequence "run2" {
	"anims/_run2"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 5 "common/npc_step2.wav" }
	{ event 1004 15 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 18
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 5 "common/npc_step2.wav" }
	{ event 1004 13 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run2"
	fps 18
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 5 "common/npc_step2.wav" }
	{ event 1004 15 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_run"
	fps 18
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 5 "common/npc_step2.wav" }
	{ event 1004 13 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/UITRST_STA"
	fps 1
	rotate -90
	ACT_RELOAD 1
	frame 0 0
}
$sequence "triggerbomb" {
	"anims/UITRST_ATA"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 2 0 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
	{ event 3 23 }
}
$sequence "victorydance" {
	"anims/UITRST_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/UITRST_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/UITRST_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/UITRST_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/UITRST_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/UITRST_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/UITRST_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
