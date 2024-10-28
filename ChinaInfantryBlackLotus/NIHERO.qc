$modelname "ChinaInfantryBlackLotus.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/NIHERO_Body"
}
$bodygroup "Briefcase" {
	studio "bodies/NIHERO_Briefcase"
	blank
}
$bodygroup "Satellite Antenna" {
	studio "bodies/NIHERO_SatCom"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "NIHERO SPINE" -4.10 -2.81 -5.11 8.37 4.09 4.50
$hbox 2 "NIHERO SPINE1" 0.00 -4.44 -7.91 10.80 9.20 7.94
$hbox 1 "NIHERO HEAD" -0.91 -4.81 -3.30 10.91 5.84 3.34
$hbox 4 "NIHERO L UPPERA" 0.00 -2.64 -2.09 14.27 2.10 3.40
$hbox 4 "NIHERO L FOREAR" 0.00 -1.41 -1.44 9.88 1.85 0.77
$hbox 4 "NIHERO L HAND" 0.00 -1.94 -2.35 7.64 1.78 2.42
$hbox 5 "NIHERO R UPPERA" 0.00 -2.72 -3.58 14.75 2.28 1.91
$hbox 5 "NIHERO R FOREAR" 0.00 -1.81 -1.00 10.03 1.89 0.88
$hbox 5 "NIHERO R HAND" 0.00 -2.00 -2.27 7.51 1.86 3.26
$hbox 6 "NIHERO L THIGH" 0.00 -3.30 -2.89 34.94 3.35 2.86
$hbox 6 "NIHERO L FOOT" -0.45 -1.72 -2.20 4.10 10.95 1.98
$hbox 7 "NIHERO R THIGH" 0.00 -3.29 -3.21 34.94 3.23 3.47
$hbox 7 "NIHERO R FOOT" -1.38 -2.06 -2.49 4.10 10.95 2.50
$attachment 0 "BONE_COMSAT" 2 0 25
$attachment 1 "NIHERO R HAND" 0 0 0
$attachment 2 "NIHERO HEAD" 0 0 0


$sequence "pose" {
	"bodies/NIHERO_Body"
	fps 1
	rotate -90
	frame 0 0
}


// --- idle
$sequence "DefaultConditionState STA" {
	"anims/NIHERO_STA"
	fps 17
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/NIHERO_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims/NIHERO_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "REALLYDAMAGED ISTA" {
	"anims/NIHERO_ISTA"
	fps 30
	loop
	rotate -90
}
$sequence "REALLYDAMAGED IIDA" {
	"anims/NIHERO_IIDA"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Stand TRANS_StandInjured" {
	"anims/NIHERO_ISTAHIT"
	fps 30
	rotate -90
}


// --- moving
$sequence "MOVING" {
	"anims/RNA"
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


// --- packing states
//Preparing to attack (unpacking gear)
$sequence "UNPACKING" {
	"anims/NIHero_ATA1"
	fps 30
	rotate -90
}
//Processing attack (hacking)
$sequence "FIRING_A" {
	"anims/NIHero_ATA2"
	fps 30
	loop
	rotate -90
}
//Completing attack (packing gear)
$sequence "PACKING" {
	"anims/NIHero_ATA3"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringA TRANS_FiringAInjured" {
	"anims/NIHERO_IATAHIT"
	fps 30
	rotate -90
}
// --- injured-packing states
//Preparing to attack (unpacking gear)
$sequence "UNPACKING REALLYDAMAGED" {
	"anims/NIHero_IATA1"
	fps 30
	rotate -90
}
//Processing attack (hacking)
$sequence "FIRING_A REALLYDAMAGED" {
	"anims/NIHero_IATA2"
	fps 30
	loop
	rotate -90
}
//Completing attack (packing gear)
$sequence "PACKING REALLYDAMAGED" {
	"anims/NIHero_IATA3"
	fps 30
	rotate -90
}
// --- packing-dying states
//code doesn't really support this. Oh well.
$sequence "DYING RAISING_FLAG DTC" {
	"anims/NIHERO_DTC"
	fps 30
	loop
	rotate -90
}
$sequence "DYING RAISING_FLAG DTD" {
	"anims/NIHERO_DTD"
	fps 30
	loop
	rotate -90
}
$sequence "DYING RAISING_FLAG REALLYDAMAGED IDTA" {
	"anims/NIHero_IDTA"
	fps 30
	rotate -90
}
$sequence "DYING RAISING_FLAG REALLYDAMAGED IDTB" {
	"anims/NIHero_IDTB"
	fps 30
	rotate -90
}


// --- normal-dying states
$sequence "DYING DTA" {
	"anims/NIHERO_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 109 }
	X
}
$sequence "DYING DTB" {
	"anims/NIHERO_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 13 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/NIHERO_ADTF1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/NIHERO_ADTF2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/NIHERO_ADTF3"
	fps 30
	rotate -90
}


// --- cheering
$sequence "SPECIAL_CHEERING" {
	"anims/NIHERO_CHA"
	fps 30
	loop
	rotate -90
}
$sequence "SPECIAL_CHEERING REALLYDAMAGED" {
	"anims/NIHERO_ICHA"
	fps 30
	loop
	rotate -90
}


// --- falling states
$sequence "FREEFALL" {
	"anims/NIHERO_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/NIHERO_PHG"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/NIHERO_POP"
	fps 30
	rotate -90
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/NIHERO_PTD"
	fps 30
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused ATB1" {
	"anims/NIHERO_ATB1"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATB2" {
	"anims/NIHERO_ATB2"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUR" {
	"anims/NIHERO_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/NIHERO_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused ISUR" {
	"anims/NIHERO_ISUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused ISST" {
	"anims/NIHERO_ISST"
	fps 30
	loop
	rotate -90
}


// Female Assassin sequences
$sequence "reload" {
	"anims/NIHERO_IDB"
	fps 200
	rotate -90
	ACT_RELOAD 1
}
$sequence "victorydance" {
	"anims/NIHERO_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "shoot" {
	"anims/NIHERO_IDB"
	fps 1
	rotate -90
	ACT_RANGE_ATTACK1 1
	frame 0 0
}
$sequence "grenadethrow" {
	"anims/FullAttack"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 2 202 }
	{ event 5001 202 "31" }
	{ event 2 205 }
	{ event 5001 205 "31" }
	{ event 2 208 }
	{ event 5001 208 "31" }
	{ event 2 211 }
	{ event 5001 211 "31" }
	{ event 2 214 }
	{ event 5001 214 "31" }
	{ event 2 217 }
	{ event 5001 217 "31" }
	{ event 2 220 }
	{ event 5001 220 "31" }
	{ event 2 223 }
	{ event 5001 223 "31" }
	{ event 2 226 }
	{ event 5001 226 "31" }
	{ event 2 229 }
	{ event 5001 229 "31" }
	{ event 2 232 }
	{ event 5001 232 "31" }
	{ event 2 235 }
	{ event 5001 235 "31" }
	{ event 2 238 }
	{ event 5001 238 "31" }
	{ event 2 241 }
	{ event 5001 241 "31" }
	{ event 2 244 }
	{ event 5001 244 "31" }
	{ event 2 247 }
	{ event 5001 247 "31" }
	{ event 2 250 }
	{ event 5001 250 "31" }
	{ event 2 253 }
	{ event 5001 253 "31" }
	{ event 2 256 }
	{ event 5001 256 "31" }
	{ event 2 259 }
	{ event 5001 259 "31" }
	{ event 2 262 }
	{ event 5001 262 "31" }
	{ event 2 265 }
	{ event 5001 265 "31" }
	{ event 2 268 }
	{ event 5001 268 "31" }
}
//$sequence "kick" {
//	"anims/NIHERO_ATA1"
//	fps 30
//	rotate -90
//	ACT_MELEE_ATTACK1 1
//}
//$sequence "kickshort" {
//	"anims/NIHERO_ATA1"
//	fps 30
//	rotate -90
//	ACT_MELEE_ATTACK2 1
//}
$sequence "jump" {
	"anims/NIHERO_ADTF1"
	fps 30
	rotate -90
	ACT_HOP 1
	{ event 3 4 }
}
$sequence "fly_up" {
	"anims/NIHERO_ADTF2"
	fps 30
	loop
	rotate -90
}
$sequence "fly_down" {
	"anims/NIHERO_ADTF2"
	fps 30
	loop
	rotate -90
}
$sequence "fly_attack" {
	"anims/NIHERO_ADTF2"
	fps 30
	rotate -90
}
$sequence "landfromjump" {
	"anims/NIHERO_ADTF3"
	fps 30
	rotate -90
}
