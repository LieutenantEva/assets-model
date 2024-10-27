$modelname "AmericaInfantryColonelBurton.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AIHERO_Body"
	studio "bodies/AIHERO_Body2"
	studio "bodies/AIHERO_Body3"
}
$bodygroup "Primary Weapon" {
	studio "bodies/AIHERO_Gun"
	studio "bodies/AIHERO_Gun3"
	blank
}
$bodygroup "Melee Weapon" {
	studio "bodies/AIHERO_Knife"
	blank
}
$bodygroup "Bomb Pack" {
	studio "bodies/AIHERO_BombPack"
	studio "bodies/AIHERO_BombPack3"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "AIHERO1 SPINE" -4.10 -5.83 -7.34 8.54 3.61 7.37
$hbox 2 "AIHERO1 SPINE1" 0.00 -7.44 -8.96 10.68 7.36 9.75
$hbox 1 "AIHERO1 NECK" 0.00 -0.94 -4.04 3.96 3.49 3.85
$hbox 1 "AIHERO1 HEAD" -0.81 -4.93 -3.63 12.41 6.09 3.90
$hbox 4 "AIHERO1 L UPPER" 0.00 -3.42 -2.84 15.67 2.75 4.68
$hbox 4 "AIHERO1 L FOREA" 0.00 -1.02 -0.94 10.50 1.77 2.08
$hbox 4 "AIHERO1 L HAND" 0.00 -0.94 -4.35 7.64 1.78 3.42
$hbox 5 "AIHERO1 R UPPER" 0.00 -3.60 -4.76 14.98 2.83 2.72
$hbox 5 "AIHERO1 R FOREA" 0.00 -1.57 -2.03 10.74 3.18 1.06
$hbox 5 "AIHERO1 R HAND" 0.00 -1.31 -3.27 7.51 1.86 4.26
$hbox 6 "AIHERO1 L THIGH" -2.79 -5.76 -4.82 34.24 4.09 3.14
$hbox 6 "AIHERO1 L FOOT" -3.26 -5.66 -4.30 4.19 12.84 2.19
$hbox 7 "AIHERO1 R THIGH" -2.31 -5.75 -3.28 34.24 3.98 4.58
$hbox 7 "AIHERO1 R FOOT" -3.15 -5.64 -2.47 4.19 12.84 4.44
$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "AIHERO1 R HAND" 0 0 0
$attachment 2 "AIHERO1 HEAD" 0 0 0


// idle
$sequence "DefaultConditionState STA" {
	"anims/AIHERO_STA"
	fps 25
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/AIHERO_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims/AIHERO_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
// injured idle
$sequence "REALLYDAMAGED ISTA" {
	"anims/AIHERO_ISTA"
	fps 30
	loop
	rotate -90
}
$sequence "REALLYDAMAGED IIDA" {
	"anims/AIHERO_IIDA"
	fps 30
	loop
	rotate -90
}
$sequence "REALLYDAMAGED IIDB" {
	"anims/AIHERO_IIDB"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Stand TRANS_StandInjured" {
	"anims/AIHERO_ISTAHIT"
	fps 30
	rotate -90
}


// moving
$sequence "MOVING" {
	"anims/RNA"
	fps 26
	loop
	rotate -90
	ACT_RUN 1
	LX
}
// injured moving
$sequence "MOVING REALLYDAMAGED" {
	"anims/IRNA"
	fps 26
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
}


// Firing animation
$sequence "FIRING_A" {
	"anims/AIHERO_ATA"
	fps 30
	loop
	rotate -90
}
// Injured Firing animation
$sequence "FIRING_A REALLYDAMAGED" {
	"anims/AIHERO_IATA"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_FiringA TRANS_FiringAInjured" {
	"anims/AIHERO_IATAHIT"
	fps 30
	rotate -90
}


// Placing charge animation
$sequence "UNPACKING" {
	"anims/AIHERO_ATB1"
	fps 30
	rotate -90
}
// Injured Placing charge animation
$sequence "UNPACKING REALLYDAMAGED" {
	"anims/AIHERO_IATB1"
	fps 30
	rotate -90
}


// Stab animations
$sequence "PREATTACK_B" {
	"anims/AIHERO_ATC"
	fps 30
	rotate -90
}
$sequence "TRANS_Stabbing TRANS_Stand" {
	"anims/AIHERO_ATC2"
	fps 30
	rotate -90
}
// Injured Stab animations
$sequence "PREATTACK_B REALLYDAMAGED" {
	"anims/AIHERO_IATC1"
	fps 30
	rotate -90
}
$sequence "TRANS_StabbingInjured TRANS_StandInjured" {
	"anims/AIHERO_IATC2"
	fps 30
	rotate -90
}


// cheering
$sequence "SPECIAL_CHEERING" {
	"anims/AIHERO_CHA"
	fps 30
	loop
	rotate -90
}
// injured cheering
$sequence "SPECIAL_CHEERING REALLYDAMAGED" {
	"anims/AIHERO_ICHA"
	fps 30
	loop
	rotate -90
}


// climbing
$sequence "CLIMBING" {
	"anims/AIHERO_CLMID"
	fps 30
	loop
	rotate -90
}
$sequence "CLIMBING MOVING" {
	"anims/AIHERO_CLMUP"
	fps 30
	loop
	rotate -90
}
$sequence "RAPPELLING MOVING" {
	"anims/AIHERO_CLMUP-reversed"
	fps 30
	loop
	rotate -90
}
// these transitions don't really work well with our code. leave 'em out.
$sequence "TRANS_Climbing TRANS_Stand" {
	"anims/AIHERO_CLMST"
	fps 30
	rotate -90
}
$sequence "TRANS_Stand TRANS_Climbing" {
	"anims/AIHERO_CLMST-reversed"
	fps 30
	rotate -90
}


// dying anims
$sequence "DYING DTA" {
	"anims/AIHERO_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 60 }
	X
}
$sequence "DYING DTB" {
	"anims/AIHERO_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 40 }
	X
}
$sequence "DYING IDTA" {
	"anims/AIHERO_IDTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 60 }
	X
}
$sequence "DYING IDTB" {
	"anims/AIHERO_IDTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 40 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/AIHERO_ADTG21"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/AIHERO_ADTG22"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/AIHERO_ADTG23"
	fps 30
	rotate -90
}


// misc anims
$sequence "FREEFALL" {
	"anims/AIHERO_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/AIHERO_PHG"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/AIHERO_POP"
	fps 30
	rotate -90
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/AIHERO_PTD"
	fps 30
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused CLMRT" {
	"anims/AIHERO_CLMRT"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUR" {
	"anims/AIHERO_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/AIHERO_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused ISUR" {
	"anims/AIHERO_ISUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused ISST" {
	"anims/AIHERO_ISST"
	fps 30
	loop
	rotate -90
}


// Female Assassin sequences
$sequence "victorydance" {
	"anims/AIHERO_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "shoot" {
	"anims/AIHERO_ATA"
	fps 45
	loop
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 1 1 }
	{ event 1 2 }
	{ event 1 3 }
	{ event 5001 1 "31" }
	{ event 5001 2 "31" }
	{ event 5001 3 "31" }
}
$sequence "grenadethrow" {
	"anims/AIHERO_ATB1"
	fps 60
	loop
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 2 42 }
}
$sequence "kick" {
	"anims/AIHERO_ATC"
	fps 30
	rotate -90
	ACT_MELEE_ATTACK1 1
}
$sequence "kickshort" {
	"anims/AIHERO_ATC"
	fps 30
	rotate -90
	ACT_MELEE_ATTACK2 1
}
$sequence "jump" {
	"anims/AIHERO_ADTG21"
	fps 30
	rotate -90
	ACT_HOP 1
	{ event 3 2 }
}
$sequence "fly_up" {
	"anims/AIHERO_ADTG22"
	fps 30
	loop
	rotate -90
}
$sequence "fly_down" {
	"anims/AIHERO_ADTG22"
	fps 30
	loop
	rotate -90
}
$sequence "fly_attack" {
	"anims/AIHERO_ADTG22"
	fps 30
	loop
	rotate -90
}
$sequence "landfromjump" {
	"anims/AIHERO_ADTG23"
	fps 30
	rotate -90
}
