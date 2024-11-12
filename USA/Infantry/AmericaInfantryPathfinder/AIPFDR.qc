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
$texrendermode Remap2_224_255_255.bmp masked


$flags 0
$eyeposition 0 0 73
$hbox 3 "AIPFDR SPINE" -4.09 -6.55 -7.81 7.18 5.21 6.81
$hbox 2 "AIPFDR SPINE1" -1.00 -9.01 -9.19 10.30 6.34 9.15
$hbox 1 "AIPFDR HEAD" 0.00 -7.00 -6.00 15.00 7.00 5.00
$hbox 4 "AIPFDR L UPPERA" 0.00 -4.00 -3.00 12.00 3.00 4.00
$hbox 4 "AIPFDR L FOREAR" 0.00 -3.00 -3.00 12.00 3.00 3.00
$hbox 4 "AIPFDR L HAND" 0.00 -1.94 -3.35 7.64 1.78 3.42
$hbox 5 "AIPFDR R UPPERA" 0.00 -4.00 -3.00 12.00 3.00 4.00
$hbox 5 "AIPFDR R FOREAR" 0 -3.00 -3.00 12.00 3.00 3.00
$hbox 5 "AIPFDR R HAND" 0.00 -2.00 -3.27 7.51 1.86 3.26
$hbox 6 "AIPFDR L THIGH" 0.00 -4.00 -3.00 33.00 6.00 4.00
$hbox 6 "AIPFDR L FOOT" -1.00 -2.00 -4.00 4.00 11.00 4.00
$hbox 7 "AIPFDR R THIGH" 0.00 -4.00 -3.00 33.00 6.00 4.00
$hbox 7 "AIPFDR R FOOT" -1.00 -2.00 -3.00 4.00 11.00 4.00
$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "AIPFDR R HAND" 0 0 0
$attachment 2 "AIPFDR HEAD" 0 0 0


// Idle
$sequence "DefaultConditionState STA" {
	"anims/AIPFDR_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 22
}
$sequence "DefaultConditionState IDA" {
	"anims/IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Running
$sequence "MOVING" {
	"anims/AIPFDR_RNA"
	fps 30
	loop
	rotate -90
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
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/AIPFDR_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/AIPFDR_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
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
$sequence "run" {
	"anims/_run"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 18 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 20
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 18 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 20
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 18 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_run"
	fps 20
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 18 "common/npc_step4.wav" }
}
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
	fps 11
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
$sequence "grenadethrow" {
	"anims/AIPFDR_ATBTR"
	fps 25
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 2 0 }
}
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
	"anims/AIPFDR_DVA"
	fps 41
	rotate -90
	ACT_HOP 1
	{ event 3 16 }
}
$sequence "fly_up" {
	"anims/AIPFDR_STB"
	fps 30
	loop
	rotate -90
}
$sequence "fly_down" {
	"anims/AIPFDR_STB"
	fps 30
	loop
	rotate -90
}
$sequence "fly_attack" {
	"anims/AIPFDR_ATA"
	fps 23
	rotate -90
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 1 17 }
	{ event 5001 17 "31" }
}
$sequence "landfromjump" {
	"anims/AIPFDR_ADTA3"
	fps 30
	rotate -90
}
