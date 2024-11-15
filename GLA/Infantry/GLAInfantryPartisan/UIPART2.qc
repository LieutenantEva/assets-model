$modelname "GLAInfantryPartisan_2.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UIPART_Body2"
}
$bodygroup "Primary Weapon" {
	studio "bodies/UIPART_2_Gun"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UIPRTSN2 SPINE" -6.00 -6.00 -8.00 7.00 7.00 8.00
$hbox 2 "UIPRTSN2 SPINE1" -2.00 -6.00 -8.00 10.00 7.00 8.00
$hbox 1 "UIPRTSN2 HEAD" -1.00 -6.00 -4.00 11.00 6.00 4.00
$hbox 4 "UIPRTSN2 L UPPE" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 4 "UIPRTSN2 L FORE" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 4 "UIPRTSN2 L HAND" -1.00 -2.00 -3.00 7.00 2.00 3.00
$hbox 5 "UIPRTSN2 R UPPE" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 5 "UIPRTSN2 R FORE" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 5 "UIPRTSN2 R HAND" -1.00 -2.00 -2.00 8.00 1.00 4.00
$hbox 6 "UIPRTSN2 L THIG" -1.00 -6.00 -5.00 35.00 5.00 2.00
$hbox 6 "UIPRTSN2 L FOOT" -2.00 -4.00 -3.00 4.00 11.00 3.00
$hbox 7 "UIPRTSN2 R THIG" -1.00 -6.00 -3.00 35.00 5.00 5.00
$hbox 7 "UIPRTSN2 R FOOT" -2.00 -4.00 -3.00 4.00 11.00 3.00
$attachment 0 "MUZZLEFX01" 0 0 0


// Idle
$sequence "DefaultConditionState STA" {
	"anims/2_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 7
}
$sequence "DefaultConditionState IDA" {
	"anims/UIPART2_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/UIPART2_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Run
$sequence "MOVING" {
	"anims/UIPART2_RNA"
	fps 30
	loop
	rotate -90
}


// Attack
$sequence "FIRING_A" {
	"anims/UIPART2_ATA"
	fps 30
	loop
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/UIPART2_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 79 }
	X
}
$sequence "DYING DTB" {
	"anims/UIPART2_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 43 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing ADTC1" {
	"anims/UIPART2_ADTC1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING ADTC2" {
	"anims/UIPART2_ADTC2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING ADTC3" {
	"anims/UIPART2_ADTC3"
	fps 30
	rotate -90
}


// Cheer
$sequence "SPECIAL_CHEERING" {
	"anims/UIPART2_CHA"
	fps 30
	loop
	rotate -90
}


// Parachute
$sequence "FREEFALL" {
	"anims/UIPART2_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/UIPART2_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/UIPART2_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/UIPART2_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// Prisoner of War
$sequence "surrender_start" {
	"anims/UIPART2_SUR"
	fps 30
	rotate -90
}
$sequence "surrender_idle" {
	"anims/UIPART2_SST"
	fps 30
	loop
	rotate -90
}


// HGrunt/Massn specific anims
$sequence "run" {
	"anims/_2_run"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 26 "common/npc_step2.wav" }
	{ event 1004 38 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_2_run"
	fps 15
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 26 "common/npc_step2.wav" }
	{ event 1004 38 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_2_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 26 "common/npc_step2.wav" }
	{ event 1004 38 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_2_run"
	fps 15
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 2 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 26 "common/npc_step2.wav" }
	{ event 1004 38 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/UIPART2_IDA"
	fps 161
	rotate -90
	ACT_RELOAD 1
	{ event 2 0 }
}
$sequence "advance_signal" {
	"anims/UIPART2_ATA"
	fps 30
	rotate -90
	ACT_SIGNAL1 1
	{ event 10 1 }
	frame 0 1
}
$sequence "victorydance" {
	"anims/UIPART2_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "cower" {
	"anims/UIPART2_STA"
	fps 1
	rotate -90
	ACT_COWER 1
	frame 0 0
}
$sequence "combatidle" {
	"anims/UIPART2_ATA"
	fps 1
	rotate -90
	ACT_IDLE_ANGRY 1
	frame 0 0
}
$sequence "crouching_idle" {
	"anims/UIPART2_ATA"
	fps 1
	rotate -90
	frame 0 0
}
$sequence "crouching_wait" {
	"anims/UIPART2_ATA"
	fps 1
	loop
	rotate -90
	ACT_CROUCH 0
	frame 0 0
}
$sequence "throwgrenade" {
	"anims/UIPART2_ATA"
	fps 1
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 7 0 }
	frame 0 0
}
$sequence "launchgrenade" {
	"anims/UIPART2_ATA"
	fps 1
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 8 0 }
	frame 0 0
}
$sequence "drop_grenade" {
	"anims/UIPART2_ATA"
	fps 1
	rotate -90
	ACT_SPECIAL_ATTACK1 1
	{ event 8 0 }
	frame 0 0
}
$sequence "crouching_mp5" {
	"anims/UIPART2_ATA"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "50" }
	{ event 5 0 }
	{ event 5001 0 "50" }
	{ event 6 0 }
	{ event 5001 0 "50" }
}
$sequence "standing_mp5" {
	"anims/UIPART2_ATA"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "50" }
	{ event 5 0 }
	{ event 5001 0 "50" }
	{ event 6 0 }
	{ event 5001 0 "50" }
}
$sequence "crouching_shotgun" {
	"anims/UIPART2_ATA"
	fps 28
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "standing_shotgun" {
	"anims/UIPART2_ATA"
	fps 28
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
