$modelname "ChinaInfantryOfficer.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/NIOFCR_Body"
}
// Barney buggy weapon moment
$bodygroup "Weapon" {
	blank
	studio "bodies/NIOFCR_Pistol"
	studio "bodies/NIOFCR_Pistol"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "NIOFCR SPINE" -4.09 -5.03 -6.40 8.37 3.61 7.47
$hbox 2 "NIOFCR SPINE1" 0.00 -5.74 -7.44 9.99 5.24 8.18
$hbox 1 "NIOFCR HEAD" -1.85 -4.79 -4.47 11.14 6.39 4.59
$hbox 4 "NIOFCR L UPPERA" 0.00 -3.16 -3.35 13.78 3.07 2.34
$hbox 4 "NIOFCR L FOREAR" 0.00 -0.61 -1.40 10.71 2.60 1.45
$hbox 5 "NIOFCR R UPPERA" 0.00 -3.35 -2.57 15.18 2.50 2.63
$hbox 5 "NIOFCR R FOREAR" 0.00 -0.50 -1.08 9.99 2.52 1.17
$hbox 6 "NIOFCR L THIGH" 0.00 -5.09 -3.77 35.07 4.77 2.60
$hbox 6 "NIOFCR L FOOT" -0.82 -2.03 -3.98 4.10 12.72 1.74
$hbox 7 "NIOFCR R THIGH" 0.00 -4.32 -3.11 35.07 4.66 3.79
$hbox 7 "NIOFCR R FOOT" -0.74 -2.00 -3.13 4.24 12.72 3.11
$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "NIOFCR R HAND" 0 0 0
$attachment 2 "NIOFCR HEAD" 0 0 0


// NORMAL STANDING
$sequence "DefaultConditionState STA" {
	"anims/NIOFCR_STA"
	fps 21
	loop
	rotate -90
	ACT_IDLE 50
}
//Regular spice animations
$sequence "DefaultConditionState IDA" {
	"anims/NIOFCR_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims/NIOFCR_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Running
$sequence "MOVING" {
	"anims\RNA"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 22 "common/npc_step2.wav" }
	{ event 1004 36 "common/npc_step4.wav" }
}


// NORMAL ATTACK
$sequence "PREATTACK_A" {
	"anims\NIOFCR_ATAST"
	fps 30
	rotate -90
	ACT_ARM 1
	{ event 2 8 }
}
$sequence "FIRING_A" {
	"anims\NIOFCR_ATALP"
	fps 30
	loop
	rotate -90
}
//This transition allows him to put his gun away when he's finished attacking.
$sequence "TRANS_FIRING_A TRANS_STAND" {
	"anims\NIOFCR_ATAED"
	fps 30
	rotate -90
	ACT_DISARM 1
	{ event 4 72 }
}


// Death
$sequence "DYING DTA" {
	"anims\NIOFCR_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 184 }
	X
}
$sequence "DYING DTB" {
	"anims\NIOFCR_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 100 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims\NIOFCR_ADTE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims\NIOFCR_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims\NIOFCR_ADTE3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims\NIOFCR_CHA"
	fps 30
	loop
	rotate -90
}


// PARACHUTING ANIMATIONS
//@TODO - MISSING ANIMATION FILE
//$sequence "FREEFALL" {
//	"anims\NIOFCR_PFL"
//	fps 30
//	rotate -90
//}
$sequence "PARACHUTING" {
	"anims\NIOFCR_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims\NIOFCR_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims\NIOFCR_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// !!!UNUSED!!!
$sequence "unused SST" {
	"anims\NIOFCR_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SLP" {
	"anims\NIOFCR_SLP"
	fps 30
	loop
	rotate -90
}
$sequence "unused SWKST" {
	"anims\NIOFCR_SWKST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SWKLP" {
	"anims\NIOFCR_SWKLP"
	fps 30
	loop
	rotate -90
}


// Basic monster sequences
$sequence "walk" {
	"anims\RNA"
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 22 "common/npc_step2.wav" }
	{ event 1004 36 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims\NIOFCR_ATAST"
	fps 30
	rotate -90
	ACT_RELOAD 1
}
$sequence "victorydance" {
	"anims/NIOFCR_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "shoot" {
	"anims\NIOFCR_ATALP"
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
	"anims/NIOFCR_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/NIOFCR_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/NIOFCR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/NIOFCR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/NIOFCR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/NIOFCR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
