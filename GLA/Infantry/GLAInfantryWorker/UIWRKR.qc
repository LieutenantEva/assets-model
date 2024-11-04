$modelname "GLAInfantryWorker.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UIWRKR_SKN"
}
$bodygroup "Sledgehammer" {
	studio "bodies/UIWRKR_Hammer"
	blank
}
$bodygroup "Metal Detector" {
	blank
	studio "bodies/UIWRKR_MineDetector"
}
$bodygroup "Supply Box" {
	blank
	studio "bodies/UIWRKR_Box"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UIWRKR SPINE" -4.04 -4.08 -6.17 8.37 4.14 6.39
$hbox 2 "UIWRKR SPINE1" 0.00 -4.32 -7.46 10.18 5.20 7.65
$hbox 1 "UIWRKR HEAD" -0.60 -3.92 -2.44 11.54 6.49 2.80
$hbox 4 "UIWRKR L UPPERA" 0.00 -2.54 -2.20 10.63 2.36 1.71
$hbox 4 "UIWRKR L FOREAR" 0.00 -0.25 -1.17 10.06 1.79 1.20
$hbox 5 "UIWRKR R UPPERA" 0.00 -2.51 -2.01 10.66 2.23 2.22
$hbox 5 "UIWRKR R FOREAR" 0.00 -0.81 -1.15 10.09 1.88 1.28
$hbox 6 "UIWRKR L THIGH" -0.58 -3.72 -3.06 34.80 3.93 2.67
$hbox 6 "UIWRKR L FOOT" -0.97 -2.59 -2.17 4.10 5.72 2.02
$hbox 7 "UIWRKR R THIGH" -0.61 -3.07 -3.14 34.80 3.81 2.92
$hbox 7 "UIWRKR R FOOT" -0.86 -2.89 -1.67 4.10 5.72 2.45
$attachment 0 "BONE_FX" 0 0 0
$attachment 1 "UIWRKR R HAND" 0 0 0
$attachment 2 "UIWRKR HEAD" 0 0 0


$sequence "pose" {
	"bodies/UIWRKR_SKN"
	fps 30
	loop
	rotate -90
}


// Idle
$sequence "DefaultConditionState STA" {
	"anims/UIWRKR_STA"
	fps 9
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/UIWRKR_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}


// Running
$sequence "MOVING" {
	"anims/UIWRKR_RNA"
	fps 16
	loop
	rotate -90
}


// Metal detector
$sequence "ATTACKING" {
	"anims/UIWRKR_MS"
	fps 30
	loop
	rotate -90
}
$sequence "MOVING ATTACKING" {
	"anims/UIWRKR_MSW"
	fps 50
	rotate -90
}
//	STANDING -> ATTACKING
$sequence "TRANS_Stand TRANS_MetalDetector_Standing" {
	"anims/UIWRKR_TRB1" // take out standing
	fps 30
	rotate -90
}
//	ATTACKING -> STANDING
$sequence "TRANS_MetalDetector_Standing TRANS_Stand" {
	"anims/UIWRKR_TRB2" // put away standing
	fps 30
	rotate -90
}
//	CARRYING -> ATTACKING
$sequence "TRANS_Carry TRANS_MetalDetector_Standing" {
	"anims/UIWRKR_TRB1" // take out standing
	fps 30
	rotate -90
}
//	ATTACKING -> CARRYING
$sequence "TRANS_MetalDetector_Standing TRANS_Carry" {
	"anims/UIWRKR_TRB2" // put away standing
	fps 30
	rotate -90
}
//	CARRYING -> MOVING ATTACKING
$sequence "TRANS_Carry TRANS_MetalDetector_Moving" {
	"anims/UIWRKR_TRC1" // take out moving [NEW NON-SKATING ANIMATION]
	fps 30
	rotate -90
}
//	MOVING ATTACKING -> STANDING
$sequence "TRANS_MetalDetector_Moving TRANS_Stand" {
	"anims/UIWRKR_TRB2" // put away moving
	fps 30
	rotate -90
}
//	STANDING -> MOVING ATTACKING
$sequence "TRANS_Stand TRANS_MetalDetector_Moving" {
	"anims/UIWRKR_TRC1" // take out moving [NEW NON-SKATING ANIMATION]
	fps 30
	rotate -90
}
//	MOVING -> ATTACKING [STANDING]
$sequence "TRANS_Moving TRANS_MetalDetector_Standing" {
	"anims/UIWRKR_TRB1" // take out standing
	fps 30
	rotate -90
}
//	ATTACKING [STANDING] -> MOVING
$sequence "TRANS_MetalDetector_Standing TRANS_Moving" {
	"anims/UIWRKR_TRC2" // put away moving [NEW NON-SKATING ANIMATION]
	fps 30
	rotate -90
}
//	MOVING -> MOVING ATTACKING
$sequence "TRANS_Moving TRANS_MetalDetector_Moving" {
	"anims/UIWRKR_TRC1" // take out moving [NEW NON-SKATING ANIMATION]
	fps 30
	rotate -90
}
//	MOVING ATTACKING -> MOVING
$sequence "TRANS_MetalDetector_Moving TRANS_Moving" {
	"anims/UIWRKR_TRC2" // put away moving [NEW NON-SKATING ANIMATION]
	fps 30
	rotate -90
}


// Carrying supply box
$sequence "MOVING CARRYING" {
	"anims/UIWRKR_CARY"
	fps 12
	loop
	rotate -90
}
$sequence "CARRYING" {
	"anims/UIWRKR_CARST"
	fps 30 
	loop
	rotate -90
}
$sequence "TRANS_Stand TRANS_Carry" {
	"anims/UIWRKR_PIK"
	fps 30
	rotate -90
}

$sequence "TRANS_Carry TRANS_Stand" {
	"anims/UIWRKR_PIK-reversed"
	fps 30
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


// Sledgehammer
$sequence "ACTIVELY_CONSTRUCTING" {
	"anims/UIWRKR_BDA"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Stand TRANS_Constructing" {
	"anims/UIWRKR_TRA1"
	fps 30
	rotate -90
}
$sequence "TRANS_Constructing TRANS_Stand" {
	"anims/UIWRKR_TRA2"
	fps 30
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused SUR" {
	"anims/UIWRKR_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/UIWRKR_SST"
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
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 12 "common/npc_step4.wav" }
}
$sequence "stop! hammer time!" {
	"anims/_attack"
	fps 30
	rotate -90
	ACT_MELEE_ATTACK1 1
	{ event 1 59 }
	{ event 2 59 }
	{ event 1 59 }
	{ event 2 59 }
	{ event 1 59 }
	{ event 2 59 }
	{ event 1 59 }
	{ event 2 59 }
	{ event 1 59 }
	{ event 2 59 }
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
