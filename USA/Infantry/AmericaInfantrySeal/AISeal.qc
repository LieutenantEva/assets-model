$modelname "AmericaInfantrySeal.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AISEAL_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/AISEAL_Gun"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "AISEAL SPINE" -5.00 -5.00 -7.00 9.00 5.00 7.00
$hbox 2 "AISEAL SPINE1" 0.00 -5.00 -7.00 10.00 5.00 7.00
$hbox 1 "AISEAL HEAD" -2.00 -7.00 -4.00 11.00 4.00 4.00
$hbox 4 "AISEAL L UPPERA" -1.00 -3.00 -4.00 15.00 4.00 2.00
$hbox 4 "AISEAL L FOREAR" 0.00 -2.00 -4.00 11.00 3.00 2.00
$hbox 4 "AISEAL L HAND" -1.00 -1.00 -3.00 5.00 2.00 4.00
$hbox 5 "AISEAL R UPPERA" -1.00 -3.00 -2.00 15.00 4.00 4.00
$hbox 5 "AISEAL R FOREAR" 0.00 -2.00 -2.00 11.00 3.00 4.00
$hbox 5 "AISEAL R HAND" -1.00 -1.00 -3.00 5.00 2.00 4.00
$hbox 6 "AISEAL L THIGH" 0.00 -5.00 -4.00 36.00 5.00 4.00
$hbox 6 "AISEAL L FOOT" -1.00 -3.00 -2.00 4.00 10.00 4.00
$hbox 7 "AISEAL R THIGH" 0.00 -5.00 -4.00 36.00 5.00 4.00
$hbox 7 "AISEAL R FOOT" -1.00 -3.00 -3.00 4.00 10.00 2.00
$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "AISEAL R HAND" 0 0 0
$attachment 2 "AISEAL HEAD" 0 0 0


// Stand Position
$sequence "stand_idle" {
	"anims/AISEAL_STN"
	fps 30
	loop
	rotate -90
	scale 6.7
	ACT_IDLE 31
}
$sequence "stand_idle2" {
	"anims/AISEAL_IDA"
	fps 30
	loop
	rotate -90
	scale 6.7
	ACT_IDLE 2
}
$sequence "stand_idle3" {
	"anims/AISEAL_IDB"
	fps 30
	loop
	rotate -90
	scale 6.7
	ACT_IDLE 2
}
$sequence "stand_move" {
	"anims/AISeal_MVA"
	fps 30
	loop
	rotate -90
	scale 6.7
}
$sequence "stand_attack" {
	"anims/AISeal_ASA"
	fps 30
	loop
	rotate -90
	scale 6.7
}
$sequence "stand_attackmove" {
	"anims/AISeal_AMA"
	fps 30
	loop
	rotate -90
	scale 6.7
}
$sequence "stand_die" {
	"anims/AISeal_DBA"
	fps 30
	rotate -90
	scale 6.7
	ACT_DIESIMPLE 1
	{ event 2001 22 }
	X
}


// Prone Position
$sequence "stand_to_crawl" {
	"anims/AISeal_TSC"
	fps 30
	rotate -90
	scale 6.7
}
$sequence "stand_to_crawl2" {
	"anims/AISeal_TSC2"
	fps 30
	rotate -90
	scale 6.7
}
$sequence "crawl_move" {
	"anims/AISeal_CLA"
	fps 30
	loop
	rotate -90
	scale 6.7
}
$sequence "crawl_attack" {
	"anims/AISeal_APA"
	fps 30
	loop
	rotate -90
	scale 6.7
}
$sequence "crawl_to_stand" {
	"anims/AISeal_TCS"
	fps 30
	rotate -90
	scale 6.7
}


// HGrunt/Massn specific anims
$sequence "run" {
	"anims/_run"
	fps 30
	loop
	rotate -90
	scale 6.7
	ACT_RUN 1
	LX
	{ event 1004 5 "common/npc_step2.wav" }
	{ event 1004 18 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	scale 6.7
	ACT_WALK 1
	LX
	{ event 1004 5 "common/npc_step2.wav" }
	{ event 1004 18 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	scale 6.7
	ACT_RUN_HURT 1
	LX
	{ event 1004 5 "common/npc_step2.wav" }
	{ event 1004 18 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	scale 6.7
	ACT_WALK_HURT 1
	LX
	{ event 1004 5 "common/npc_step2.wav" }
	{ event 1004 18 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/AISeal_TCS"
	fps 3.66
	rotate -90
	scale 6.7
	ACT_RELOAD 1
	{ event 2 0 }
}
$sequence "advance_signal" {
	"anims/AISeal_ASA"
	fps 1
	rotate -90
	scale 6.7
	frame 0 0
	ACT_SIGNAL1 1
	{ event 10 1 }
}
$sequence "victorydance" {
	"anims/AISeal_ASA"
	fps 30
	rotate -90
	scale 6.7
	ACT_VICTORY_DANCE 1
}
$sequence "cower" {
	"anims/AISeal_TSC"
	fps 30
	rotate -90
	scale 6.7
	ACT_COWER 1
}
$sequence "combatidle" {
	"anims/AISeal_ASA"
	fps 1
	rotate -90
	scale 6.7
	frame 0 0
	ACT_IDLE_ANGRY 1
}
$sequence "crouching_idle" {
	"anims/AISeal_APA"
	fps 1
	rotate -90
	scale 6.7
	frame 0 0
}
$sequence "crouching_wait" {
	"anims/AISeal_APA"
	fps 1
	loop
	rotate -90
	scale 6.7
	frame 0 0
	ACT_CROUCH 0
}
$sequence "crouching_mp5" {
	"anims/AISeal_APA"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "50" }
	{ event 5 2 }
	{ event 5001 2 "50" }
	{ event 6 4 }
	{ event 5001 4 "50" }
	{ event 4 6 }
	{ event 5001 6 "50" }
	{ event 5 8 }
	{ event 5001 8 "50" }
	{ event 6 10 }
	{ event 5001 10 "50" }
	{ event 4 12 }
	{ event 5001 12 "50" }
	{ event 5 14 }
	{ event 5001 14 "50" }
	{ event 6 16 }
	{ event 5001 16 "50" }
	{ event 4 18 }
	{ event 5001 18 "50" }
	{ event 5 20 }
	{ event 5001 20 "50" }
	{ event 6 22 }
	{ event 5001 22 "50" }
	{ event 4 24 }
	{ event 5001 24 "50" }
	{ event 5 26 }
	{ event 5001 26 "50" }
	{ event 6 28 }
	{ event 5001 28 "50" }
}
$sequence "standing_mp5" {
	"anims/AISeal_ASA"
	fps 30
	rotate -90
	scale 6.7
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "50" }
	{ event 5 2 }
	{ event 5001 2 "50" }
	{ event 6 4 }
	{ event 5001 4 "50" }
	{ event 4 6 }
	{ event 5001 6 "50" }
	{ event 5 8 }
	{ event 5001 8 "50" }
	{ event 6 10 }
	{ event 5001 10 "50" }
	{ event 4 12 }
	{ event 5001 12 "50" }
	{ event 5 14 }
	{ event 5001 14 "50" }
	{ event 6 16 }
	{ event 5001 16 "50" }
	{ event 4 18 }
	{ event 5001 18 "50" }
	{ event 5 20 }
	{ event 5001 20 "50" }
	{ event 6 22 }
	{ event 5001 22 "50" }
	{ event 4 24 }
	{ event 5001 24 "50" }
	{ event 5 26 }
	{ event 5001 26 "50" }
	{ event 6 28 }
	{ event 5001 28 "50" }
	{ event 4 30 }
	{ event 5001 30 "50" }
	{ event 5 32 }
	{ event 5001 32 "50" }
	{ event 6 34 }
	{ event 5001 34 "50" }
	{ event 4 36 }
	{ event 5001 36 "50" }
}
$sequence "crouching_shotgun" {
	"anims/AISeal_APA"
	fps 31
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "standing_shotgun" {
	"anims/AISeal_ASA"
	fps 38
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
