$modelname "GLAInfantryPartisan_3.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UIPART_Body3"
}
$bodygroup "Primary Weapon" {
	studio "bodies/UIPART_3_AssaultRifle"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UIPRTSN3 SPINE" -6.00 -6.00 -8.00 7.00 7.00 8.00
$hbox 2 "UIPRTSN3 SPINE1" -2.00 -6.00 -8.00 10.00 7.00 8.00
$hbox 1 "UIPRTSN3 HEAD" -1.00 -6.00 -4.00 11.00 6.00 4.00
$hbox 4 "UIPRTSN3 L UPPE" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 4 "UIPRTSN3 L FORE" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 4 "UIPRTSN3 L HAND" -1.00 -2.00 -3.00 7.00 2.00 3.00
$hbox 5 "UIPRTSN3 R UPPE" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 5 "UIPRTSN3 R FORE" -1.00 -4.00 -4.00 12.00 3.00 3.00
$hbox 5 "UIPRTSN3 R HAND" -1.00 -2.00 -2.00 8.00 1.00 4.00
$hbox 6 "UIPRTSN3 L THIG" -1.00 -6.00 -5.00 35.00 5.00 2.00
$hbox 6 "UIPRTSN3 L FOOT" -2.00 -4.00 -3.00 4.00 11.00 3.00
$hbox 7 "UIPRTSN3 R THIG" -1.00 -6.00 -3.00 35.00 5.00 5.00
$hbox 7 "UIPRTSN3 R FOOT" -2.00 -4.00 -3.00 4.00 11.00 3.00
$attachment 0 "MUZZLEFX01" 0 0 0


// Idle
// FIXME: Animation cut off to decrease file size.
$sequence "DefaultConditionState STA" {
	"anims/3_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 7
}
$sequence "DefaultConditionState IDA" {
	"anims/UIPRTSN3_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/UIPRTSN3_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Run
$sequence "MOVING" {
	"anims/UIPRTSN3_RNA"
	fps 30
	loop
	rotate -90
}


// Attack
$sequence "FIRING_A" {
	"anims/UIPRTSN3_ATA"
	fps 30
	loop
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/UIPRTSN3_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 78 }
	X
}
$sequence "DYING DTB" {
	"anims/UIPRTSN3_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 43 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing ADTA1" {
	"anims/UIPRTSN3_ADTA1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING ADTA2" {
	"anims/UIPRTSN3_ADTA2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING ADTA3" {
	"anims/UIPRTSN3_ADTA3"
	fps 30
	rotate -90
}


// Cheer
$sequence "SPECIAL_CHEERING" {
	"anims/UIPRTSN3_CHA"
	fps 30
	loop
	rotate -90
}


// Parachute
$sequence "FREEFALL" {
	"anims/UIPRTSN3_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/UIPRTSN3_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/UIPRTSN3_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/UIPRTSN3_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// Prisoner of War
$sequence "surrender_start" {
	"anims/UIPRTSN3_SUR"
	fps 30
	rotate -90
}
$sequence "surrender_idle" {
	"anims/UIPRTSN3_SST"
	fps 30
	loop
	rotate -90
}


// HGrunt/Massn specific anims
$sequence "run" {
	"anims/_3_run"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 10 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_3_run"
	fps 15
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 10 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_3_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 10 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_3_run"
	fps 15
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 10 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/UIPRTSN3_IDB"
	fps 361
	rotate -90
	ACT_RELOAD 1
	{ event 2 0 }
}
$sequence "advance_signal" {
	"anims/UIPRTSN3_ATA"
	fps 30
	rotate -90
	ACT_SIGNAL1 1
	{ event 10 1 }
	frame 0 1
}
$sequence "victorydance" {
	"anims/UIPRTSN3_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "cower" {
	"anims/UIPRTSN3_STA"
	fps 1
	rotate -90
	ACT_COWER 1
	frame 0 0
}
$sequence "combatidle" {
	"anims/UIPRTSN3_ATA"
	fps 1
	rotate -90
	ACT_IDLE_ANGRY 1
	frame 0 0
}
$sequence "crouching_idle" {
	"anims/UIPRTSN3_ATA"
	fps 1
	rotate -90
	frame 0 0
}
$sequence "crouching_wait" {
	"anims/UIPRTSN3_ATA"
	fps 1
	loop
	rotate -90
	ACT_CROUCH 0
	frame 0 0
}
$sequence "throwgrenade" {
	"anims/UIPRTSN3_ATA"
	fps 1
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 7 0 }
	frame 0 0
}
$sequence "launchgrenade" {
	"anims/UIPRTSN3_ATA"
	fps 1
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 8 0 }
	frame 0 0
}
$sequence "drop_grenade" {
	"anims/UIPRTSN3_ATA"
	fps 1
	rotate -90
	ACT_SPECIAL_ATTACK1 1
	{ event 8 0 }
	frame 0 0
}
$sequence "crouching_mp5" {
	"anims/UIPRTSN3_ATA"
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
	{ event 5 32 }
	{ event 5001 32 "50" }
	{ event 6 34 }
	{ event 5001 34 "50" }
	{ event 4 36 }
	{ event 5001 36 "50" }
	{ event 5 38 }
	{ event 5001 38 "50" }
	{ event 6 40 }
	{ event 5001 40 "50" }
	{ event 4 42 }
	{ event 5001 42 "50" }
	{ event 5 44 }
	{ event 5001 44 "50" }
	{ event 6 46 }
	{ event 5001 46 "50" }
	{ event 4 48 }
	{ event 5001 48 "50" }
	{ event 5 50 }
	{ event 5001 50 "50" }
	{ event 6 52 }
	{ event 5001 52 "50" }
	{ event 4 54 }
	{ event 5001 54 "50" }
	{ event 5 56 }
	{ event 5001 56 "50" }
}
$sequence "standing_mp5" {
	"anims/UIPRTSN3_ATA"
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
	{ event 5 32 }
	{ event 5001 32 "50" }
	{ event 6 34 }
	{ event 5001 34 "50" }
	{ event 4 36 }
	{ event 5001 36 "50" }
	{ event 5 38 }
	{ event 5001 38 "50" }
	{ event 6 40 }
	{ event 5001 40 "50" }
	{ event 4 42 }
	{ event 5001 42 "50" }
	{ event 5 44 }
	{ event 5001 44 "50" }
	{ event 6 46 }
	{ event 5001 46 "50" }
	{ event 4 48 }
	{ event 5001 48 "50" }
	{ event 5 50 }
	{ event 5001 50 "50" }
	{ event 6 52 }
	{ event 5001 52 "50" }
	{ event 4 54 }
	{ event 5001 54 "50" }
	{ event 5 56 }
	{ event 5001 56 "50" }

}
$sequence "crouching_shotgun" {
	"anims/UIPRTSN3_ATA"
	fps 59
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "standing_shotgun" {
	"anims/UIPRTSN3_ATA"
	fps 59
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
