$modelname "AmericaInfantryMissileDefender.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/NITHNT_SKN"
}
$texturegroup "versions"
{
	{ "Remap1_223_255_255.bmp" }
	{ "Remap2_223_255_255.bmp" }
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "NITHNT SPINE" -4.08 -6.44 -7.59 11.68 6.08 8.26
$hbox 2 "NITHNT SPINE1" 0.00 -7.74 -7.50 9.56 4.00 7.44
$hbox 1 "NITHNT HEAD" -2.71 -8.05 -6.00 11.00 5.91 5.28
$hbox 4 "NITHNT L UPPERA" 0.00 -3.32 -2.80 13.40 2.21 3.12
$hbox 4 "NITHNT L FOREAR" 0.00 -1.36 -1.18 10.69 1.66 1.32
$hbox 5 "NITHNT R UPPERA" 0.00 -3.52 -2.59 13.83 2.22 2.31
$hbox 5 "NITHNT R FOREAR" 0.00 -1.19 -1.44 10.80 2.00 1.07
$hbox 6 "NITHNT L THIGH" -1.81 -4.32 -4.42 34.00 4.39 2.98
$hbox 6 "NITHNT L FOOT" -2.60 -3.55 -3.11 4.10 5.72 2.47
$hbox 7 "NITHNT R THIGH" -1.34 -4.31 -3.17 34.00 4.29 4.30
$hbox 7 "NITHNT R FOOT" -2.49 -3.21 -2.14 4.10 5.72 3.07
$attachment 0 "MUZZLEFX01" 0 0 0
$attachment 1 "NITHNT R HAND" 0 0 0
$attachment 2 "NITHNT HEAD" 0 0 0
$attachment 3 "FX_EXHAUST_01" 0 0 0


// Idle
$sequence "DefaultConditionState STA" {
	"anims/NITHNT_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/NITHNT_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims/NITHNT_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Firing
$sequence "FIRING_A" {
	"anims\NITHNT_ATA"
	fps 30
	loop
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 1 1 }
	{ event 5001 1 "101" }
	{ event 5031 1 "101" }
}
$sequence "RELOADING_A" {
	"anims\NITHNT_ATA"
	fps 10
	rotate -90
	ACT_RELOAD 1
	{ event 2 1 }
}


// Running
$sequence "MOVING" {
	"anims\RNA"
	fps 20
	loop
	rotate -90
	ACT_RUN 1
	LX
}


// Death
$sequence "DYING DTA" {
	"anims\NITHNT_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 43 }
	X
}
$sequence "DYING DTB" {
	"anims\NITHNT_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 103 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims\NITHNT_ADTA1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims\NITHNT_ADTA2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims\NITHNT_ADTA3"
	fps 30
	rotate -90
}


// PARACHUTING ANIMATIONS
$sequence "FREEFALL" {
	"anims\NITHNT_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims\NITHNT_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims\NITHNT_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims\NITHNT_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims\NITHNT_CHA"
	fps 30
	loop
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused SUR" {
	"anims\NITHNT_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims\NITHNT_SST"
	fps 30
	loop
	rotate -90
}


// Basic monster sequences
$sequence "victorydance" {
	"anims/NITHNT_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/NITHNT_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/NITHNT_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/NITHNT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/NITHNT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/NITHNT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/NITHNT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
