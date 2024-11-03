$modelname "ChinaInfantryHacker.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/NIHCKR_Body"
}
$bodygroup "Laptop" {
	studio "bodies/NIHCKR_Laptop"
	blank
}
$bodygroup "Satellite Antenna" {
	studio "bodies/NIHCKR_SatCom"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "HCKR SPINE" -4.00 -5.00 -8.00 10.00 6.00 8.00
$hbox 2 "HCKR SPINE1" 0.00 -6.00 -8.00 8.30 6.00 8.00
$hbox 1 "HCKR HEAD" -2.00 -5.30 -6.60 11.00 5.40 6.00
$hbox 4 "HCKR L UPPERARM" 0.00 -4.00 -5.00 13.00 4.00 4.00
$hbox 4 "HCKR L FOREARM" 0.00 -4.00 -3.30 9.00 3.00 3.00
$hbox 4 "HCKR L HAND" -1.00 -2.00 -4.00 7.00 2.00 3.00
$hbox 5 "HCKR R UPPERARM" 0.00 -4.00 -5.00 13.00 4.00 4.00
$hbox 5 "HCKR R FOREARM" 0.00 -4.00 -3.30 9.00 3.00 3.00
$hbox 5 "HCKR R HAND" -1.00 -2.00 -3.00 8.00 2.00 4.00
$hbox 6 "HCKR L THIGH" 0.00 -5.00 -4.30 35.00 6.00 3.00
$hbox 6 "HCKR L FOOT" -1.00 -3.00 -3.00 4.00 11.30 2.00
$hbox 7 "HCKR R THIGH" 0.00 -5.00 -4.00 35.00 6.00 4.50
$hbox 7 "HCKR R FOOT" -1.00 -3.00 -2.00 4.00 11.30 3.00
$attachment 0 "BONE_SATCOM" 2 0 13


$sequence "pose" {
	"bodies/NIHCKR_SKN"
	fps 1
	rotate -90
	frame 0 0
}


// Idle
$sequence "DefaultConditionState STA" {
	"anims/NIHCKR_STA"
	fps 25
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/NIHCKR_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims/NIHCKR_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Running
$sequence "MOVING" {
	"anims/NIHCKR_RNA"
	fps 14
	loop
	rotate -90
}


// Hacking
$sequence "UNPACKING" {
	"anims/NIHCKR_ATB1"
	fps 30
	rotate -90
}
//HACKING ATTACK
$sequence "FIRING_A" {
	"anims/NIHCKR_ATB2"
	fps 30
	loop
	rotate -90
}
$sequence "PACKING" {
	"anims/NIHCKR_ATB3"
	fps 30
	rotate -90
}
//I was stopped by a stop command, so I get no proper PACKING state
$sequence "TRANS_FiringA TRANS_Stand" {
	"anims/NIHCKR_ATB3"
	fps 30
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/NIHCKR_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 94 }
	X
}
$sequence "DYING DTB" {
	"anims/NIHCKR_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 38 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/NIHCKR_ADTG1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/NIHCKR_ADTG2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/NIHCKR_ADTG3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/NIHCKR_CHA"
	fps 30
	loop
	rotate -90
}


// Parachute
$sequence "FREEFALL" {
	"anims/NIHCKR_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/NIHCKR_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/NIHCKR_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/NIHCKR_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// !!!UNUSED!!!
$sequence "unused ATA1" {
	"anims/NIHCKR_ATA1"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATA2" {
	"anims/NIHCKR_ATA2"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATA3" {
	"anims/NIHCKR_ATA3"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUR" {
	"anims/NIHCKR_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/NIHCKR_SST"
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
	{ event 1004 18 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 7 "common/npc_step2.wav" }
	{ event 1004 18 "common/npc_step4.wav" }
}
$sequence "victorydance" {
	"anims/NIHCKR_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/NIHCKR_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/NIHCKR_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/NIHCKR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/NIHCKR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/NIHCKR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/NIHCKR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
