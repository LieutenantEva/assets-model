$modelname "ChinaInfantryRedguard.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/NICNSC_SKN"
	studio "bodies/NICNSCI_SKN"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "NICNSC" -4.76 -5.17 -1.21 4.91 6.04 12.45
$hbox 2 "NICNSC SPINE1" 0.00 -11.82 -11.18 12.27 5.15 12.60
$hbox 1 "NICNSC HEAD" -1.23 -4.56 -3.90 11.87 5.56 4.10
$hbox 4 "NICNSC L UPPERA" 0.00 -3.13 -3.21 21.29 2.16 3.24
$hbox 4 "NICNSC L HAND" -0.30 -1.59 -3.59 6.36 1.29 2.72
$hbox 5 "NICNSC R UPPERA" -0.43 -3.37 -3.31 21.29 2.29 2.96
$hbox 5 "NICNSC R HAND" -0.50 -1.93 -2.66 7.22 0.58 3.09
$hbox 6 "NICNSC L THIGH" 0.00 -4.31 -3.63 35.25 3.98 3.35
$hbox 6 "NICNSC L FOOT" 0.00 -3.44 -2.89 4.22 11.36 3.60
$hbox 7 "NICNSC R THIGH" 0.00 -4.30 -3.64 35.25 3.87 4.26
$hbox 7 "NICNSC R FOOT" -0.13 -3.88 -2.98 4.23 11.41 2.51
$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "NICNSC R HAND" 0 0 0
$attachment 2 "NICNSC HEAD" 0 0 0


// ------- Standing-Around Animations
$sequence "DefaultConditionState STA" {
	"anims/NICNSC_STA"
	fps 35
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/NICNSC_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims/NICNSC_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "REALLYDAMAGED" {
	"anims/NICNSC_STB"
	fps 30
	loop
	rotate -90
}


// ------- Machine Gun Animations
$sequence "USING_WEAPON_A" {
	"anims\NICNSC_ATA"
	fps 30
	loop
	rotate -90
}
$sequence "USING_WEAPON_A REALLYDAMAGED" {
	"anims\NICNSC_ATC"
	fps 30
	loop
	rotate -90
}
$sequence "USING_WEAPON_B" {
	"anims\NICNSC_ATA2"
	fps 30
	loop
	rotate -90
}
$sequence "USING_WEAPON_B REALLYDAMAGED" {
	"anims\NICNSC_ATC2"
	fps 30
	loop
	rotate -90
}


// ------- Firing-related Transitions
$sequence "TRANS_Firing TRANS_FiringDamaged" {
	"anims\NICNSC_AA2AC"
	fps 30
	rotate -90
}
$sequence "TRANS_Stand TRANS_Firing" {
	"anims\NICNSC_SA2AA"
	fps 30
	rotate -90
	ACT_RELOAD 1
	{ event 2 1 }
}
$sequence "TRANS_Firing TRANS_Stand" {
	"anims\NICNSC_AA2SA"
	fps 30
	rotate -90
}
$sequence "TRANS_StandDamaged TRANS_FiringDamaged" {
	"anims\NICNSC_ATCST"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringDamaged TRANS_StandDamaged" {
	"anims\NICNSC_ATCED"
	fps 30
	rotate -90
}


// ------------- Damage Transitions --------------------
$sequence "TRANS_StandDamaged TRANS_RunDamaged" {
	"anims\NICNSC_STB2RNB"
	fps 30
	rotate -90
}
$sequence "TRANS_RunDamaged TRANS_StandDamaged" {
	"anims\NICNSC_RNB2STB"
	fps 30
	rotate -90
}
$sequence "TRANS_Stand TRANS_StandDamaged" {
	"anims\NICNSC_STA2STB"
	fps 30
	rotate -90
}


// ------- Bayonet Animations
$sequence "PREATTACK_C" {
	"anims\NICNSC_ATB1"
	fps 30
	rotate -90
	ACT_MELEE_ATTACK1 1
	{ event 3 16 }
	{ event 2010 16 }
}
$sequence "FIRING_C" {
	"anims\NICNSC_ATB2"
	fps 30
	rotate -90
}
$sequence "PREATTACK_C REALLYDAMAGED" {
	"anims\NICNSC_ATD1"
	fps 30
	rotate -90
}
$sequence "FIRING_C REALLYDAMAGED" {
	"anims\NICNSC_ATD2"
	fps 30
	rotate -90
}


// ------- Parachuting Animations
//$sequence "FREEFALL" {
//	"anims\NICNSC_POP"
//	fps 30
//	rotate -90
//}
$sequence "PARACHUTING" {
	"anims\NICNSC_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims\NICNSC_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims\NICNSC_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// ------- Movement Animations
$sequence "MOVING" {
	"anims\NICNSC_RNA"
	fps 26
	loop
	rotate -90
	ACT_RUN 1
	LX
}
$sequence "MOVING REALLYDAMAGED" {
	"anims\NICNSC_RNB"
	fps 30
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
}


// ------- Bldg-capture
$sequence "UNPACKING" {
	"anims\NICNSC_FDP1"
	fps 30
	rotate -90
}
$sequence "RAISING_FLAG" {
	"anims\NICNSC_FDP2"
	fps 30
	rotate -90
}
$sequence "PACKING" {
	"anims\NICNSC_FDP1-reversed"
	fps 30
	rotate -90
}
$sequence "TRANS_Raising TRANS_Packing" {
	"anims\NICNSC_FDP2-reversed"
	fps 30
	rotate -90
}


// ------- Dying Animations
$sequence "DYING DTA" {
	"anims\NICNSC_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 0 }
	{ event 2001 20 }
	X
}
$sequence "DYING DTB" {
	"anims\NICNSC_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 0 }
	{ event 2001 28 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims\NICNSC_ATDE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims\NICNSC_ATDE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims\NICNSC_ATDE3"
	fps 30
	rotate -90
}


// --- cheering
$sequence "SPECIAL_CHEERING" {
	"anims\NICNSC_CHA"
	fps 30
	loop
	rotate -90
}
$sequence "SPECIAL_CHEERING REALLYDAMAGED" {
	"anims\NICNSC_CHB"
	fps 30
	loop
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused MAR" {
	"anims\NICNSC_MAR"
	fps 30
	loop
	rotate -90
}
$sequence "unused MARN" {
	"anims\NICNSC_MARN"
	fps 30
	loop
	rotate -90
}
$sequence "unused CAPED" {
	"anims\NICNSC_CAPED"
	fps 30
	loop
	rotate -90
}
$sequence "unused CAPST" {
	"anims\NICNSC_CAPST"
	fps 30
	loop
	rotate -90
}
$sequence "unused CAP" {
	"anims\NICNSC_CAP"
	fps 30
	loop
	rotate -90
}
$sequence "unused CAPB" {
	"anims\NICNSC_CAPB"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUR" {
	"anims\NICNSC_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims\NICNSC_SST"
	fps 30
	loop
	rotate -90
}
