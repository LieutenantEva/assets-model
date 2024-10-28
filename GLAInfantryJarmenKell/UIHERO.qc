$modelname "GLAInfantryJarmenKell.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UIHERO_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/UIHERO_SniperRifle"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UIHERO SPINE" -4.09 -7.55 -8.81 7.18 5.21 8.79
$hbox 2 "UIHERO SPINE1" 0.00 -9.01 -9.19 8.02 5.34 9.15
$hbox 1 "UIHERO HEAD" 0.00 -4.94 -3.70 11.31 5.12 3.25
$hbox 4 "UIHERO L UPPERA" 0.00 -3.94 -3.09 15.09 2.64 2.22
$hbox 4 "UIHERO L FOREAR" 0.00 -1.79 -1.23 10.96 1.42 1.60
$hbox 4 "UIHERO L HAND" 0.00 -1.94 -3.35 7.64 1.78 3.42
$hbox 5 "UIHERO R UPPERA" 0.00 -4.18 -2.14 14.34 2.74 2.30
$hbox 5 "UIHERO R FOREAR" 0.00 -1.82 -1.59 11.04 1.63 1.37
$hbox 5 "UIHERO R HAND" 0.00 -2.00 -3.27 7.51 1.86 3.26
$hbox 6 "UIHERO L THIGH" 0.00 -4.07 -5.30 34.69 3.62 3.35
$hbox 6 "UIHERO L FOOT" -1.03 -3.71 -3.14 4.10 12.72 2.38
$hbox 7 "UIHERO R THIGH" 0.00 -4.06 -3.62 34.70 3.53 4.97
$hbox 7 "UIHERO R FOOT" -0.94 -4.15 -2.91 4.10 12.72 2.82
$attachment 0 "MUZZLEFX01" 0 0 0
$attachment 1 "UIHERO R HAND" 0 0 0
$attachment 2 "UIHERO HEAD" 0 0 0


// --- idle
$sequence "DefaultConditionState STA" {
	"anims/UIHERO_STA"
	fps 21
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/UIHERO_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
// TODO: It's too damn big!
//$sequence "DefaultConditionState IDB" {
//	"anims/IDB"
//	fps 30
//	loop
//	rotate -90
//	ACT_IDLE 2
//}
$sequence "REALLYDAMAGED ISTA" {
	"anims/UIHERO_ISTA"
	fps 30
	loop
	rotate -90
}
$sequence "REALLYDAMAGED IIDA" {
	"anims/UIHERO_IIDA"
	fps 30
	loop
	rotate -90
}
$sequence "REALLYDAMAGED IIDB" {
	"anims/IIDB"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Stand TRANS_StandInjured" {
	"anims/UIHERO_ISTAHIT"
	fps 30
	rotate -90
}


// --- attack
$sequence "FIRING_A" {
	"anims/UIHERO_ATA"
	fps 30
	loop
	rotate -90
}
$sequence "FIRING_A REALLYDAMAGED" {
	"anims/UIHERO_IATA2"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_FiringA TRANS_FiringAInjured" {
	"anims/UIHERO_IATAHIT"
	fps 30
	rotate -90
}


// --- moving
$sequence "MOVING" {
	"anims/RNA2"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
}
$sequence "MOVING REALLYDAMAGED" {
	"anims/IRNA"
	fps 26
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
}


// --- cheering
$sequence "SPECIAL_CHEERING" {
	"anims/UIHERO_CHA"
	fps 30
	loop
	rotate -90
}
$sequence "SPECIAL_CHEERING REALLYDAMAGED" {
	"anims/UIHERO_ICHA"
	fps 30
	loop
	rotate -90
}


// --- dying
$sequence "DYING DTA" {
	"anims/UIHERO_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 69 }
	X
}
$sequence "DYING DTB" {
	"anims/UIHERO_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 29 }
	X
}
$sequence "DYING IDTA" {
	"anims/UIHERO_IDTA"
	fps 30
	rotate 90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 10 }
	X
}
$sequence "DYING IDTB" {
	"anims/UIHERO_IDTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 39 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/UIHERO_ADTG21"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/UIHERO_ADTG22"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/UIHERO_ADTG23"
	fps 30
	rotate -90
}


// misc anims
$sequence "FREEFALL" {
	"anims/UIHERO_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/UIHERO_PHG"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/UIHERO_POP"
	fps 30
	rotate -90
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/UIHERO_PTD"
	fps 30
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused IATA1" {
	"anims/UIHERO_IATA1"
	fps 30
	loop
	rotate -90
}
$sequence "unused IATA3" {
	"anims/UIHERO_IATA3"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUR" {
	"anims/UIHERO_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/UIHERO_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused ISUR" {
	"anims/UIHERO_ISUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused ISST" {
	"anims/UIHERO_ISST"
	fps 30
	loop
	rotate -90
}


// Female Assassin sequences
$sequence "reload" {
	"anims/UIHERO_IATA1"
	fps 30
	rotate -90
	ACT_RELOAD 1
}
$sequence "victorydance" {
	"anims/UIHERO_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "shoot" {
	"anims/UIHERO_ATA"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 1 0 }
	{ event 5001 0 "31" }
}
//$sequence "grenadethrow" {
//	"anims/UIHERO_ATA"
//	fps 30
//	rotate -90
//	ACT_RANGE_ATTACK2 1
//	{ event 2 0 }
//}
//$sequence "kick" {
//	"anims/UIHERO_ATC"
//	fps 30
//	rotate -90
//	ACT_MELEE_ATTACK1 1
//}
//$sequence "kickshort" {
//	"anims/UIHERO_ATC"
//	fps 30
//	rotate -90
//	ACT_MELEE_ATTACK2 1
//}
$sequence "jump" {
	"anims/UIHERO_ADTG21"
	fps 30
	rotate -90
	ACT_HOP 1
	{ event 3 4 }
}
$sequence "fly_up" {
	"anims/UIHERO_ADTG22"
	fps 30
	loop
	rotate -90
}
$sequence "fly_down" {
	"anims/UIHERO_ADTG22"
	fps 30
	loop
	rotate -90
}
$sequence "fly_attack" {
	"anims/UIHERO_ADTG22"
	fps 30
	rotate -90
}
$sequence "landfromjump" {
	"anims/UIHERO_ADTG23"
	fps 30
	rotate -90
}
