$modelname "MilitiaInfantry.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/CIMILT1_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/CIMILT1_Gun"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "CIMILT1 SPINE" -6.00 -6.00 -8.00 7.00 7.00 8.00
$hbox 2 "CIMILT1 SPINE1" -2.00 -6.00 -8.00 10.00 7.00 8.00
$hbox 1 "CIMILT1 HEAD" -1.00 -6.00 -4.00 11.00 6.00 4.00
$hbox 4 "CIMILT1 L UPPER" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 4 "CIMILT1 L FOREA" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 4 "CIMILT1 L HAND" -1.00 -2.00 -3.00 7.00 2.00 3.00
$hbox 5 "CIMILT1 R UPPER" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 5 "CIMILT1 R FOREA" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 5 "CIMILT1 R HAND" -1.00 -2.00 -2.00 8.00 1.00 4.00
$hbox 6 "CIMILT1 L THIGH" -1.00 -6.00 -5.00 35.00 5.00 2.00
$hbox 6 "CIMILT1 L FOOT" -2.00 -4.00 -3.00 4.00 11.00 3.00
$hbox 7 "CIMILT1 R THIGH" -1.00 -6.00 -3.00 35.00 5.00 5.00
$hbox 7 "CIMILT1 R FOOT" -2.00 -4.00 -3.00 4.00 11.00 3.00
$attachment 0 "MUZZLEFX01" 0 0 0


// Idle
$sequence "DefaultConditionState STA" {
	"anims/CIMILT1_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 7
}
$sequence "DefaultConditionState IDA" {
	"anims/CIMILT1_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/CIMILT1_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Run
$sequence "MOVING" {
	"anims/CIMILT1_RNA"
	fps 30
	loop
	rotate -90
}


// Attack
$sequence "FIRING_A" {
	"anims/CIMILT1_ATA"
	fps 30
	loop
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/CIMILT1_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 36 }
	X
}
$sequence "DYING DTB" {
	"anims/CIMILT1_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 35 }
	X
}


// Cheer
$sequence "SPECIAL_CHEERING" {
	"anims/CIMILT1_CHA"
	fps 30
	loop
	rotate -90
}


// Parachute
$sequence "FREEFALL" {
	"anims/CIMILT1_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/CIMILT1_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/CIMILT1_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/CIMILT1_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// Prisoner of War
$sequence "surrender_start" {
	"anims/CIMILT1_SUR"
	fps 30
	rotate -90
}
$sequence "surrender_idle" {
	"anims/CIMILT1_SST"
	fps 30
	loop
	rotate -90
}


// HGrunt/Massn specific anims
$sequence "run" {
	"anims/_run"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 12 "common/npc_step4.wav" }
	{ event 1004 23 "common/npc_step2.wav" }
	{ event 1004 33 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 12 "common/npc_step4.wav" }
	{ event 1004 23 "common/npc_step2.wav" }
	{ event 1004 33 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 12 "common/npc_step4.wav" }
	{ event 1004 23 "common/npc_step2.wav" }
	{ event 1004 33 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 12 "common/npc_step4.wav" }
	{ event 1004 23 "common/npc_step2.wav" }
	{ event 1004 33 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/CIMILT1_IDA"
	fps 324
	rotate -90
	ACT_RELOAD 1
	{ event 2 0 }
}
$sequence "advance_signal" {
	"anims/CIMILT1_ATA"
	fps 30
	rotate -90
	ACT_SIGNAL1 1
	{ event 10 1 }
	frame 0 1
}
$sequence "victorydance" {
	"anims/CIMILT1_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "cower" {
	"anims/CIMILT1_STA"
	fps 1
	rotate -90
	ACT_COWER 1
	frame 0 0
}
$sequence "combatidle" {
	"anims/CIMILT1_ATA"
	fps 1
	rotate -90
	ACT_IDLE_ANGRY 1
	frame 0 0
}
$sequence "crouching_idle" {
	"anims/CIMILT1_ATA"
	fps 1
	rotate -90
	frame 0 0
}
$sequence "crouching_wait" {
	"anims/CIMILT1_ATA"
	fps 1
	loop
	rotate -90
	ACT_CROUCH 0
	frame 0 0
}
$sequence "throwgrenade" {
	"anims/CIMILT1_ATA"
	fps 1
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 7 0 }
	frame 0 0
}
$sequence "launchgrenade" {
	"anims/CIMILT1_ATA"
	fps 1
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 8 0 }
	frame 0 0
}
$sequence "drop_grenade" {
	"anims/CIMILT1_ATA"
	fps 1
	rotate -90
	ACT_SPECIAL_ATTACK1 1
	{ event 8 0 }
	frame 0 0
}
$sequence "crouching_mp5" {
	"anims/CIMILT1_ATA"
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
	{ event 4 30 }
	{ event 5001 30 "50" }
}
$sequence "standing_mp5" {
	"anims/CIMILT1_ATA"
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
	{ event 4 30 }
	{ event 5001 30 "50" }
}
$sequence "crouching_shotgun" {
	"anims/CIMILT1_ATA"
	fps 31
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "standing_shotgun" {
	"anims/CIMILT1_ATA"
	fps 31
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
