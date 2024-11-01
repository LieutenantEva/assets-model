$modelname "AmericaInfantryPathfinder.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AIPFDR_Body"
	studio "bodies/AIPFDR_Body2"
}
$bodygroup "Primary Weapon" {
	studio "bodies/AIPFDR_SniperRifle"
	studio "bodies/AIPFDR_SniperRifle2"
	blank
}
$texrendermode z_aipthfindr2.bmp masked
$texrendermode Remap2_223_255_255.bmp masked


$flags 0
$eyeposition 0 0 73

$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "AIPFDR R HAND" 0 0 0
$attachment 2 "AIPFDR HEAD" 0 0 0


// Idle
$sequence "DefaultConditionState STA" {
	"anims/AIPFDR_STA"
	fps 21
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}


// Running
$sequence "MOVING" {
	"anims/RNA"
	fps 25
	loop
	rotate -90
	ACT_RUN 1
	LX
}


// Firing
$sequence "FIRING_A" {
	"anims/AIPFDR_ATB"
	fps 30
	loop
	rotate -90
}
$sequence "BETWEEN_FIRING_SHOTS_A" {
	"anims/AIPFDR_ATBST"
	fps 30
	rotate -90
}


// Death
$sequence "DYING" {
	"anims/AIPFDR_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 32 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/AIPFDR_ADTA1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/AIPFDR_ADTA2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/AIPFDR_ADTA3"
	fps 30
	rotate -90
}


// Parachute
$sequence "FREEFALL" {
	"anims/AIPFDR_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/AIPFDR_PHG"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/AIPFDR_POP"
	fps 30
	rotate -90
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/AIPFDR_PTD"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/AIPFDR_CHA"
	fps 30
	loop
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused ATBTR" {
	"anims/AIPFDR_ATBTR"
	fps 30
	loop
	rotate -90
}
$sequence "unused DVA" {
	"anims/AIPFDR_DVA"
	fps 30
	loop
	rotate -90
}
$sequence "unused STB" {
	"anims/AIPFDR_STB"
	fps 30
	loop
	rotate -90
}
$sequence "unused IDB" {
	"anims/AIPFDR_IDB"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATA" {
	"anims/AIPFDR_ATA"
	fps 30
	loop
	rotate -90
}
$sequence "unused CLA" {
	"anims/AIPFDR_CLA"
	fps 30
	loop
	rotate -90
}
$sequence "unused DTB" {
	"anims/AIPFDR_DTB"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUA" {
	"anims/AIPFDR_SUA"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUR" {
	"anims/AIPFDR_SUR"
	fps 30
	loop
	rotate -90
}


// Female Assassin sequences
$sequence "reload" {
	"anims/AIPFDR_ATBTR"
	fps 30
	rotate -90
	ACT_RELOAD 1
}
$sequence "victorydance" {
	"anims/AIPFDR_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "shoot" {
	"anims/AIPFDR_ATB"
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
//	"anims/AIPFDR_ATB"
//	fps 30
//	rotate -90
//	ACT_RANGE_ATTACK2 1
//	{ event 2 0 }
//}
//$sequence "kick" {
//	"anims/AIPFDR_ATC"
//	fps 30
//	rotate -90
//	ACT_MELEE_ATTACK1 1
//}
//$sequence "kickshort" {
//	"anims/AIPFDR_ATC"
//	fps 30
//	rotate -90
//	ACT_MELEE_ATTACK2 1
//}
$sequence "jump" {
	"anims/AIPFDR_ADTA1"
	fps 30
	rotate -90
	ACT_HOP 1
	{ event 3 4 }
}
$sequence "fly_up" {
	"anims/AIPFDR_ADTA2"
	fps 30
	loop
	rotate -90
}
$sequence "fly_down" {
	"anims/AIPFDR_ADTA2"
	fps 30
	loop
	rotate -90
}
$sequence "fly_attack" {
	"anims/AIPFDR_ADTA2"
	fps 30
	rotate -90
}
$sequence "landfromjump" {
	"anims/AIPFDR_ADTA3"
	fps 30
	rotate -90
}
