$modelname "ChinaInfantryAmbassador.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/NIAMBSDR_SKN"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "NIAMBSDR SPINE" -4.00 -5.00 -8.00 10.00 6.00 8.00
$hbox 2 "NIAMBSDR SPINE1" 0.00 -6.00 -8.00 10.00 6.00 8.00
$hbox 1 "NIAMBSDR HEAD" -1.00 -6.00 -4.00 14.00 7.00 4.00
$hbox 4 "NIAMBSDR L UPPE" 0.00 -4.00 -5.00 13.00 4.00 4.00
$hbox 4 "NIAMBSDR L FORE" 0.00 -4.00 -3.30 9.00 3.00 3.00
$hbox 4 "NIAMBSDR L HAND" -1.00 -2.00 -4.00 7.00 2.00 3.00
$hbox 5 "NIAMBSDR R UPPE" 0.00 -4.00 -5.00 13.00 4.00 4.00
$hbox 5 "NIAMBSDR R FORE" 0.00 -4.00 -3.30 9.00 3.00 3.00
$hbox 5 "NIAMBSDR R HAND" -1.00 -2.00 -3.00 8.00 2.00 4.00
$hbox 6 "NIAMBSDR L THIG" 0.00 -5.00 -4.30 35.00 6.00 3.00
$hbox 6 "NIAMBSDR L FOOT" -1.00 -3.00 -3.00 4.00 11.30 2.00
$hbox 7 "NIAMBSDR R THIG" 0.00 -5.00 -4.00 35.00 6.00 4.50
$hbox 7 "NIAMBSDR R FOOT" -1.00 -3.00 -2.00 4.00 11.30 3.00


// Idle
$sequence "DefaultConditionState STA" {
	"anims/NIAMBSDR_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 8
}
$sequence "DefaultConditionState IDA" {
	"anims/NIAMBSDR_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/NIAMBSDR_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Running
$sequence "MOVING" {
	"anims/NIAMBSDR_RNA"
	fps 30
	loop
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/NIAMBSDR_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 62 }
	X
}
$sequence "DYING DTB" {
	"anims/NIAMBSDR_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 33 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/NIAMBSDR_ADTE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/NIAMBSDR_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/NIAMBSDR_ADTE3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/NIAMBSDR_CHA"
	fps 30
	loop
	rotate -90
}


// Parachute
//$sequence "FREEFALL" {
//	"anims/NIAMBSDR_PFL"
//	fps 30
//	rotate -90
//}
$sequence "PARACHUTING" {
	"anims/NIAMBSDR_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/NIAMBSDR_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/NIAMBSDR_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// !!!UNUSED!!!
$sequence "unused SST" {
	"anims/NIAMBSDR_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SLP" {
	"anims/NIAMBSDR_SLP"
	fps 30
	loop
	rotate -90
}
$sequence "unused SED" {
	"anims/NIAMBSDR_SED"
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
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 7 "common/npc_step4.wav" }
	{ event 1004 23 "common/npc_step2.wav" }
	{ event 1004 35 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 7 "common/npc_step4.wav" }
	{ event 1004 23 "common/npc_step2.wav" }
	{ event 1004 35 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 7 "common/npc_step4.wav" }
	{ event 1004 23 "common/npc_step2.wav" }
	{ event 1004 35 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 7 "common/npc_step4.wav" }
	{ event 1004 23 "common/npc_step2.wav" }
	{ event 1004 35 "common/npc_step4.wav" }
}
$sequence "victorydance" {
	"anims/NIAMBSDR_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/NIAMBSDR_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/NIAMBSDR_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/NIAMBSDR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/NIAMBSDR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/NIAMBSDR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/NIAMBSDR_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
