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
	"anims\AIOFCR_ATAST"
	fps 30
	rotate -90
	ACT_ARM 1
	{ event 2 8 }
}
$sequence "FIRING_A" {
	"anims\AIOFCR_ATALP"
	fps 30
	loop
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 3 1 }
	{ event 5001 1 "21" }
	{ event 3 22 }
	{ event 5001 22 "21" }
	{ event 3 39 }
	{ event 5001 39 "21" }
}
//This transition allows him to put his gun away when he's finished attacking.
$sequence "TRANS_FIRING_A TRANS_STAND" {
	"anims\AIOFCR_ATAED"
	fps 30
	rotate -90
	ACT_DISARM 1
	{ event 4 72 }
}


// Death
$sequence "DYING DTA" {
	"anims\AIOFCR_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 184 }
	X
}
$sequence "DYING DTB" {
	"anims\AIOFCR_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 100 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims\AIOFCR_ADTE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims\AIOFCR_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims\AIOFCR_ADTE3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims\AIOFCR_CHA"
	fps 30
	loop
	rotate -90
}


// PARACHUTING ANIMATIONS
//@TODO - MISSING ANIMATION FILE
//$sequence "FREEFALL" {
//	"anims\AIOFCR_PFL"
//	fps 30
//	rotate -90
//}
$sequence "PARACHUTING" {
	"anims\AIOFCR_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims\AIOFCR_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims\AIOFCR_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// Bomb planting
$sequence "UNPACKING" {
	"anims\AICIAOFF_PLNT"
	fps 30
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused SST" {
	"anims\AIOFCR_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SLP" {
	"anims\AIOFCR_SLP"
	fps 30
	loop
	rotate -90
}
$sequence "unused SWKST" {
	"anims\AIOFCR_SWKST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SWKLP" {
	"anims\AIOFCR_SWKLP"
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
	"anims\AIOFCR_ATAST"
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
