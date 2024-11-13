$modelname "AmericaInfantrySTNG.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AISTNG_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/AISTNG_Weapon"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "AISTNG SPINE" -4.00 -6.00 -8.00 8.00 6.00 8.00
$hbox 2 "AISTNG SPINE1" 0.00 -6.00 -8.00 10.00 6.00 8.00
$hbox 1 "AISTNG HEAD" -2.00 -6.00 -7.00 11.00 4.00 6.00
$hbox 4 "AISTNG L UPPERA" -1.00 -4.00 -3.00 15.00 4.00 3.00
$hbox 4 "AISTNG L FOREAR" 0.00 -2.00 -3.00 11.00 3.00 3.00
$hbox 4 "AISTNG L HAND" -1.00 -2.00 -4.00 7.00 2.00 3.00
$hbox 5 "AISTNG R UPPERA" -1.00 -4.00 -3.00 15.00 4.00 3.00
$hbox 5 "AISTNG R FOREAR" 0.00 -2.00 -3.00 11.00 3.00 3.00
$hbox 5 "AISTNG R HAND" -1.00 -2.00 -3.00 8.00 2.00 4.00
$hbox 6 "AISTNG L THIGH" 0.00 -5.00 -4.00 36.00 5.00 3.00
$hbox 6 "AISTNG L FOOT" -1.00 -3.00 -4.00 4.00 13.00 3.00
$hbox 7 "AISTNG R THIGH" 0.00 -5.00 -3.00 36.00 5.00 4.00
$hbox 7 "AISTNG R FOOT" -1.00 -3.00 -3.00 4.00 13.00 4.00
$attachment 0 "MUZZLEFX01" 0 0 0
$attachment 1 "EXHAUST01" 0 0 0


// Idle
$sequence "DefaultConditionState STA" {
	"anims/AISTNG_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 31
}
$sequence "DefaultConditionState IDA" {
	"anims/AISTNG_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/AISTNG_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Attack
$sequence "PREATTACK_A" {
	"anims/AISTNG_ATA"
	fps 30
	rotate -90
}
$sequence "FIRING_A" {
	"anims/AISTNG_ATA2"
	fps 30
	rotate -90
}


// Undeploy
$sequence "UNPACKING" {
	"anims/AISTNG_DR1"
	fps 30
	rotate -90
}
$sequence "TRANS_Unpacking TRANS_Moving" {
	"anims/AISTNG_DR2"
	fps 30
	rotate -90
}


// Run
$sequence "MOVING" {
	"anims/AISTNG_RNA"
	fps 30
	loop
	rotate -90
}


// Deploy
$sequence "TRANS_Moving TRANS_Packing" {
	"anims/AISTNG_RD1"
	fps 30
	rotate -90
}
$sequence "PACKING" {
	"anims/AISTNG_RD2"
	fps 30
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/AISTNG_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 22 }
	X
}
$sequence "DYING DTB" {
	"anims/AISTNG_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 35 }
	X
}
$sequence "DYING MOVING" {
	"anims/AISTNG_DTC"
	fps 30
	rotate -90
	{ event 2001 118 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/AISTNG_ADTF1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/AISTNG_ADTF2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/AISTNG_ADTF3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/AISTNG_CHA"
	fps 30
	loop
	rotate -90
}


// Parachute
$sequence "FREEFALL" {
	"anims/AISTNG_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/AISTNG_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/AISTNG_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/AISTNG_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// Prisoner of War
$sequence "surrender_start" {
	"anims/AISTNG_SUR"
	fps 30
	rotate -90
}
$sequence "surrender_idle" {
	"anims/AISTNG_SST"
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
	{ event 1004 14 "common/npc_step2.wav" }
	{ event 1004 33 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 14 "common/npc_step2.wav" }
	{ event 1004 33 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 14 "common/npc_step2.wav" }
	{ event 1004 33 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 14 "common/npc_step2.wav" }
	{ event 1004 33 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/AISTNG_ATA"
	fps 55
	rotate -90
	ACT_RELOAD 1
	frame 0 0
}
$sequence "victorydance" {
	"anims/AISTNG_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "shoot" {
	"anims/_attack"
	fps 55
	rotate -90
	ACT_RANGE_ATTACK1 1
    { event 1 274 }
	{ event 5001 274 "101" }
	{ event 5011 274 "101" }
}
$sequence "flinch" {
	"anims/AISTNG_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/AISTNG_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/AISTNG_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/AISTNG_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/AISTNG_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/AISTNG_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
