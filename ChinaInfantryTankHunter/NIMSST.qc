$modelname "ChinaInfantryTankHunter.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/NIMSST_Body"
}
$bodygroup "Weapon" {
	studio "bodies/NIMSST_MissileLauncher"
	blank
}
$bodygroup "Nuclear Backpack" {
	blank
	studio "bodies/NIMSST_NuclearBackpack"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "AIMSSL" -6.00 -8.00 -1.00 6.00 8.00 12.00
$hbox 2 "AIMSSL SPINE1" 0.00 -5.00 -8.00 10.00 6.40 8.00
$hbox 1 "AIMSSL HEAD" 0.00 -7.32 -5.61 11.78 6.05 5.52
$hbox 4 "AIMSSL L UPPERA" -0.20 -4.09 -3.16 22.76 2.36 2.94
$hbox 4 "AIMSSL L HAND" -0.84 -1.25 -2.85 6.56 1.53 3.07
$hbox 5 "AIMSSL R UPPERA" 0.00 -4.17 -3.31 22.65 2.26 2.63
$hbox 5 "AIMSSL R HAND" -0.59 -1.41 -2.11 7.36 1.15 3.78
$hbox 6 "AIMSSL L THIGH" 0.00 -3.43 -4.13 35.91 4.86 2.75
$hbox 6 "AIMSSL L FOOT" 0.00 -3.49 -2.87 3.60 10.94 2.56
$hbox 7 "AIMSSL R THIGH" 0.00 -2.84 -3.58 35.91 4.74 3.88
$hbox 7 "AIMSSL R FOOT" -0.22 -4.01 -2.52 3.61 10.80 2.87
$attachment 0 "MUZZLEFX01" 0 0 0
$attachment 1 "AIMSSL R HAND" 0 0 0
$attachment 2 "AIMSSL HEAD" 0 0 0
$attachment 3 "FX_EXHAUST_01" 0 0 0


// Idle
$sequence "DefaultConditionState STA" {
	"anims/NIMSST_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/NIMSST_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims/NIMSST_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Firing
$sequence "FIRING_A" {
	"anims\NIMSST_ATA"
	fps 30
	loop
	rotate -90
}
$sequence "RELOADING_A" {
	"anims\NIMSST_ATA"
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
	"anims\NIMSST_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 21 }
	X
}
$sequence "DYING DTB" {
	"anims\NIMSST_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 103 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims\NIMSST_ADTD1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims\NIMSST_ADTD2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims\NIMSST_ADTD3"
	fps 30
	rotate -90
}


// PARACHUTING ANIMATIONS
//$sequence "FREEFALL" {
//	"anims\NIMSST_PFL"
//	fps 30
//	rotate -90
//}
$sequence "PARACHUTING" {
	"anims\NIMSST_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims\NIMSST_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims\NIMSST_PDN"
	fps 30
	rotate -90
	ACT_LAND 1
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims\NIMSST_CHA"
	fps 30
	loop
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused SUR" {
	"anims\NIMSST_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims\NIMSST_SST"
	fps 30
	loop
	rotate -90
}


// Basic monster sequences
$sequence "shoot1" {
	"anims\NIMSST_ATA"
	fps 120
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 1 0 }
	{ event 5001 0 "101" }
	{ event 5031 0 "101" }
}
$sequence "victorydance" {
	"anims/NIMSST_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/NIMSST_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/NIMSST_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/NIMSST_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/NIMSST_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/NIMSST_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/NIMSST_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
