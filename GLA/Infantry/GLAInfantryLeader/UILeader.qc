$modelname "GLAInfantryLeader.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UILEADER_Body"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "BIP01 SPINE" -5.00 -5.00 -8.00 9.00 6.00 8.00
$hbox 2 "BIP01 SPINE1" 0.00 -4.00 -8.00 9.00 6.00 8.00
$hbox 1 "BIP01 HEAD" -2.00 -4.00 -4.00 11.00 6.00 4.00
$hbox 4 "BIP01 L UPPERAR" -1.00 -4.00 -5.00 14.00 4.00 2.00
$hbox 4 "BIP01 L FOREARM" 0.00 -4.00 -4.00 11.00 4.00 2.00
$hbox 4 "BIP01 L HAND" -1.00 -1.00 -3.00 5.00 2.00 4.00
$hbox 5 "BIP01 R UPPERAR" -1.00 -4.00 -2.00 14.00 4.00 5.00
$hbox 5 "BIP01 R FOREARM" 0.00 -4.00 -2.00 11.00 4.00 4.00
$hbox 5 "BIP01 R HAND" -1.00 -1.00 -3.00 5.00 2.00 4.00
$hbox 6 "BIP01 L THIGH" 0.00 -5.00 -4.00 36.00 5.00 4.00
$hbox 6 "BIP01 L FOOT" -1.00 -4.00 -4.00 4.00 11.00 3.00
$hbox 7 "BIP01 R THIGH" 0.00 -5.00 -4.00 36.00 5.00 4.00
$hbox 7 "BIP01 R FOOT" -1.00 -4.00 -3.00 4.00 11.00 4.00
$controller 0 "BIP01 HEAD" XR -70 70


// Idle
$sequence "idle" {
	"anims/GENERAL_I1"
	fps 30
	loop
	rotate -90
	scale 6.7
	ACT_IDLE 7
}
$sequence "idle2" {
	"anims/GENERAL_I2"
	fps 30
	loop
	rotate -90
	scale 6.7
	ACT_IDLE 2
}


// Move
$sequence "walk" {
	"anims/GENERAL_W1"
	fps 30
	loop
	rotate -90
	scale 6.7
}
$sequence "run" {
	"anims/GENERAL_R1"
	fps 30
	loop
	rotate -90
	scale 6.7
}


// Death
$sequence "die" {
	"anims/GENERAL_D1"
	fps 30
	rotate -90
	scale 6.7
	ACT_DIESIMPLE 1
	{ event 2001 37 }
	X
}
$sequence "die2" {
	"anims/GENERAL_D2"
	fps 30
	rotate -90
	scale 6.7
	ACT_DIESIMPLE 1
	{ event 2001 35 }
	X
}


// Basic monster sequences
$sequence "run" {
	"anims/_run"
	fps 30
	loop
	rotate -90
	scale 6.7
	ACT_RUN 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 9 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_walk"
	fps 30
	loop
	rotate -90
	scale 6.7
	ACT_WALK 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 21 "common/npc_step4.wav" }
	{ event 1004 38 "common/npc_step2.wav" }
	{ event 1004 52 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	scale 6.7
	ACT_RUN_HURT 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 9 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_walk"
	fps 30
	loop
	rotate -90
	scale 6.7
	ACT_WALK_HURT 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 21 "common/npc_step4.wav" }
	{ event 1004 38 "common/npc_step2.wav" }
	{ event 1004 52 "common/npc_step4.wav" }
}
$sequence "victorydance" {
	"anims/GENERAL_I2"
	fps 30
	rotate -90
	scale 6.7
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/GENERAL_I1"
	fps 1
	rotate -90
	scale 6.7
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/GENERAL_I1"
	fps 1
	rotate -90
	scale 6.7
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/GENERAL_I1"
	fps 1
	rotate -90
	scale 6.7
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/GENERAL_I1"
	fps 1
	rotate -90
	scale 6.7
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/GENERAL_I1"
	fps 1
	rotate -90
	scale 6.7
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/GENERAL_I1"
	fps 1
	rotate -90
	scale 6.7
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
