$modelname "AmericaInfantryCIAOfficer.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AICIAOff_Body"
}
// Barney buggy weapon moment
$bodygroup "Weapon" {
	blank
	studio "bodies/AICIAOff_Pistol"
	studio "bodies/AICIAOff_Pistol"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "AIOFCR SPINE" -4.09 -5.62 -7.25 8.37 6.03 7.20
$hbox 2 "AIOFCR SPINE1" 0.00 -5.56 -8.52 9.99 6.21 8.28
$hbox 1 "AIOFCR HEAD" 0.00 -6.80 -3.26 13.34 5.62 3.38
$hbox 4 "AIOFCR L UPPERA" 0.00 -3.40 -3.30 13.84 2.57 2.67
$hbox 4 "AIOFCR L FOREAR" 0.00 -2.26 -2.01 10.49 1.79 2.31
$hbox 5 "AIOFCR R UPPERA" 0.00 -2.99 -2.57 14.92 3.03 3.29
$hbox 5 "AIOFCR R FOREAR" 0.00 -2.10 -2.57 10.95 1.67 1.77
$hbox 6 "AIOFCR L THIGH" 0.00 -5.09 -3.77 35.07 4.77 2.60
$hbox 6 "AIOFCR L FOOT" -1.09 -2.35 -2.79 4.10 5.72 2.94
$hbox 7 "AIOFCR R THIGH" 0.00 -4.32 -3.11 35.07 4.66 3.79
$hbox 7 "AIOFCR R FOOT" -0.97 -2.57 -2.61 4.10 5.72 2.95
$attachment 0 "MUZZLEFX01" 0 0 0
$attachment 1 "AIOFCR R HAND" 0 0 0
$attachment 2 "AIOFCR HEAD" 0 0 0


// NORMAL STANDING
$sequence "DefaultConditionState STA" {
	"anims/AIOFCR_STA"
	fps 21
	loop
	rotate -90
	ACT_IDLE 50
}
//Regular spice animations
$sequence "DefaultConditionState IDA" {
	"anims/AIOFCR_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims/AIOFCR_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Running
$sequence "MOVING" {
	"anims/AIOFCR_RNA"
	fps 30
	loop
	rotate -90
}


// NORMAL ATTACK
$sequence "PREATTACK_A" {
	"anims/AIOFCR_ATAST"
	fps 30
	rotate -90
	ACT_ARM 1
	{ event 2 8 }
}
$sequence "FIRING_A" {
	"anims/AIOFCR_ATALP"
	fps 30
	loop
	rotate -90
}
//This transition allows him to put his gun away when he's finished attacking.
$sequence "TRANS_FIRING_A TRANS_STAND" {
	"anims/AIOFCR_ATAED"
	fps 30
	rotate -90
	ACT_DISARM 1
	{ event 4 72 }
}


// Death
$sequence "DYING DTA" {
	"anims/AIOFCR_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 184 }
	X
}
$sequence "DYING DTB" {
	"anims/AIOFCR_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 100 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/AIOFCR_ADTE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/AIOFCR_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/AIOFCR_ADTE3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/AIOFCR_CHA"
	fps 30
	loop
	rotate -90
}


// PARACHUTING ANIMATIONS
//@TODO - MISSING ANIMATION FILE
//$sequence "FREEFALL" {
//	"anims/AIOFCR_PFL"
//	fps 30
//	rotate -90
//}
$sequence "PARACHUTING" {
	"anims/AIOFCR_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/AIOFCR_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/AIOFCR_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// Bomb planting
$sequence "UNPACKING" {
	"anims/AICIAOFF_PLNT"
	fps 30
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused SST" {
	"anims/AIOFCR_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SLP" {
	"anims/AIOFCR_SLP"
	fps 30
	loop
	rotate -90
}
$sequence "unused SWKST" {
	"anims/AIOFCR_SWKST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SWKLP" {
	"anims/AIOFCR_SWKLP"
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
	{ event 1004 1 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 23 "common/npc_step2.wav" }
	{ event 1004 37 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 1 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 23 "common/npc_step2.wav" }
	{ event 1004 37 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/AIOFCR_ATAST"
	fps 30
	rotate -90
	ACT_RELOAD 1
}
$sequence "victorydance" {
	"anims/AIOFCR_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "shoot" {
	"anims/AIOFCR_ATALP"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 3 5 }
	{ event 5001 5 "21" }
	{ event 3 22 }
	{ event 5001 22 "21" }
	{ event 3 39 }
	{ event 5001 39 "21" }
}
$sequence "flinch" {
	"anims/AIOFCR_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/AIOFCR_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/AIOFCR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/AIOFCR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/AIOFCR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/AIOFCR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
