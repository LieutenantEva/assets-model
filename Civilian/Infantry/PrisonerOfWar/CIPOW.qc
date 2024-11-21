$modelname "PrisonerOfWar.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/CIPOW_Body"
}


$origin 0 0 0.125
$flags 0
$eyeposition 0 0 73
$hbox 3 "CIPOW SPINE" -6.00 -6.00 -8.00 8.00 6.00 8.00
$hbox 2 "CIPOW SPINE1" -2.00 -6.00 -8.00 9.00 6.00 8.00
$hbox 1 "CIPOW HEAD" -2.00 -5.00 -3.00 11.00 6.00 4.00
$hbox 4 "CIPOW L UPPERAR" 0.00 -3.00 -4.00 23.00 3.00 2.00
$hbox 4 "CIPOW L HAND" -2.00 -2.00 -3.00 7.00 2.00 3.00
$hbox 5 "CIPOW R UPPERAR" 0.00 -3.00 -2.00 23.00 3.00 4.00
$hbox 5 "CIPOW R HAND" -2.00 -2.00 -3.00 7.00 2.00 3.00
$hbox 6 "CIPOW L THIGH" 0.00 -4.00 -4.00 36.00 4.00 4.00
$hbox 6 "CIPOW L FOOT" -1.00 -3.00 -3.00 4.00 10.00 2.00
$hbox 7 "CIPOW R THIGH" 0.00 -4.00 -4.00 36.00 4.00 4.00
$hbox 7 "CIPOW R FOOT" -1.00 -3.00 -2.00 4.00 10.00 3.00


// Idle
$sequence "DefaultConditionState STA" {
	"anims/CIPOW_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 21
}
$sequence "DefaultConditionState IDA" {
	"anims/CIPOW_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/CIPOW_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Move
$sequence "MOVING WKA" {
	"anims/CIPOW_WKA"
	fps 30
	loop
	rotate -90
}
$sequence "MOVING RNA" {
	"anims/CIPOW_RNA"
	fps 30
	loop
	rotate -90
}


// Basic monster sequences
$sequence "run" {
	"anims/_run"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 8 "common/npc_step2.wav" }
	{ event 1004 20 "common/npc_step4.wav" }
	{ event 1004 29 "common/npc_step2.wav" }
	{ event 1004 41 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_walk"
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 4 "common/npc_step2.wav" }
	{ event 1004 19 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 8 "common/npc_step2.wav" }
	{ event 1004 20 "common/npc_step4.wav" }
	{ event 1004 29 "common/npc_step2.wav" }
	{ event 1004 41 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_walk"
	fps 30
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 4 "common/npc_step2.wav" }
	{ event 1004 19 "common/npc_step4.wav" }
}
$sequence "victorydance" {
	"anims/CIPOW_IDB"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/CIPOW_STA"
	fps 1
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/CIPOW_STA"
	fps 1
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/CIPOW_STA"
	fps 1
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/CIPOW_STA"
	fps 1
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/CIPOW_STA"
	fps 1
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/CIPOW_STA"
	fps 1
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
$sequence "die" {
	"anims/_die"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 31 }
	X
}
