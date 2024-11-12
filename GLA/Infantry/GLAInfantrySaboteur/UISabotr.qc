$modelname "GLAInfantrySaboteur.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UISABOTR_Body"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UIWRKR SPINE" -6.00 -6.00 -7.00 8.00 6.00 7.00
$hbox 2 "UIWRKR SPINE1" -2.00 -3.00 -8.00 9.00 8.00 8.00
$hbox 1 "UIWRKR HEAD" -0.72 -2.34 -4.40 10.01 6.45 3.86
$hbox 4 "UIWRKR L CLAVIC" 0.00 -4.95 -0.00 6.21 1.56 1.18
$hbox 4 "UIWRKR L UPPERA" 0.00 -5.00 -3.00 20.00 2.00 3.00
$hbox 4 "UIWRKR L HAND" 0.00 -3.15 -2.84 8.71 1.13 1.97
$hbox 5 "UIWRKR R CLAVIC" 0.00 -4.96 -1.18 6.21 1.55 0.00
$hbox 5 "UIWRKR R UPPERA" 0.00 -5.00 -3.00 20.00 2.00 3.00
$hbox 5 "UIWRKR R HAND" 0.00 -3.14 -1.97 8.58 1.26 2.85
$hbox 6 "UIWRKR L THIGH" 0.00 -4.00 -4.00 36.00 4.00 4.00
$hbox 6 "UIWRKR L FOOT" -0.80 -2.39 -3.37 4.10 10.60 1.68
$hbox 7 "UIWRKR R THIGH" 0.00 -4.00 -4.00 36.00 4.00 4.00
$hbox 7 "UIWRKR R FOOT" -0.80 -2.41 -1.88 4.10 10.58 3.17


// Idle
$sequence "DefaultConditionState STA" {
	"anims/UIWRKR_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 10
}
$sequence "DefaultConditionState IDA" {
	"anims/UIWRKR_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Running
$sequence "MOVING" {
	"anims/UIWRKR_RNA"
	fps 30
	loop
	rotate -90
}


// Death
$sequence "DYING" {
	"anims/UIWRKR_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 31 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/UIWRKR_ADTE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/UIWRKR_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/UIWRKR_ADTE3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/UIWRKR_CHA"
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
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 12 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 20
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 12 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 20
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 12 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_run"
	fps 20
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 12 "common/npc_step4.wav" }
}
$sequence "victorydance" {
	"anims/UIWRKR_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/UIWRKR_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/UIWRKR_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/UIWRKR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/UIWRKR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/UIWRKR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/UIWRKR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
