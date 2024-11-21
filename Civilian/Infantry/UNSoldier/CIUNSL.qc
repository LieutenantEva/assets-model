$modelname "UNSoldier.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/CIUNSL_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/CIUNSL_AssaultRifle"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "CIUN" -6.00 -8.00 -2.00 6.00 8.00 12.00
$hbox 2 "CIUN SPINE1" -2.00 -6.00 -8.00 10.00 6.00 8.00
$hbox 1 "CIUN HEAD" -2.00 -6.00 -5.00 13.00 5.00 5.00
$hbox 4 "CIUN L UPPERARM" -1.00 -3.00 -3.00 22.00 3.00 3.00
$hbox 4 "CIUN L HAND" -2.00 -1.00 -3.00 6.00 1.00 3.00
$hbox 5 "CIUN R UPPERARM" -1.00 -3.00 -3.00 22.00 3.00 3.00
$hbox 5 "CIUN R HAND" -2.00 -1.00 -3.00 6.00 1.00 3.00
$hbox 6 "CIUN L THIGH" 0.00 -4.00 -4.00 36.00 4.00 3.00
$hbox 6 "CIUN L FOOT" -1.00 -3.00 -3.00 4.00 10.00 3.00
$hbox 7 "CIUN R THIGH" 0.00 -4.00 -3.00 36.00 4.00 4.00
$hbox 7 "CIUN R FOOT" -1.00 -3.00 -3.00 4.00 10.00 3.00
$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "CIUN R HAND" 0 0 0
$attachment 2 "CIUN HEAD" 0 0 0


// Idle
$sequence "DefaultConditionState STA" {
	"anims/CIUNSL_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 22
}
$sequence "DefaultConditionState ID1" {
	"anims/CIUNSL_ID1"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState ID2" {
	"anims/CIUNSL_ID2"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Attack
$sequence "FIRING_A" {
	"anims/CIUNSL_ATA1_LP"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Stand TRANS_FiringA" {
	"anims/CIUNSL_ATA1_ST"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringA TRANS_Stand" {
	"anims/CIUNSL_ATA1_ED"
	fps 30
	rotate -90
}


// Move
$sequence "MOVING" {
	"anims/CIUNSL_RNA"
	fps 30
	loop
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/CIUNSL_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 52 }
	X
}
$sequence "DYING DTB" {
	"anims/CIUNSL_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 111 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/CIUNSL_ADTA1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/CIUNSL_ADTA2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/CIUNSL_ADTA3"
	fps 30
	rotate -90
}


// Parachute
$sequence "FREEFALL" {
	"anims/CIUNSL_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/CIUNSL_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/CIUNSL_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/CIUNSL_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// !!!UNUSED!!!
$sequence "unused CHA" {
	"anims/CIUNSL_CHA"
	fps 30
	loop
	rotate -90
}
$sequence "unused DTC" {
	"anims/CIUNSL_DTC"
	fps 30
	loop
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 45 }
	X
}
$sequence "unused DTD" {
	"anims/CIUNSL_DTD"
	fps 30
	loop
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 123 }
	X
}
$sequence "unused ADTE1" {
	"anims/CIUNSL_ADTE1"
	fps 30
	loop
	rotate -90
}
$sequence "unused ADTE2" {
	"anims/CIUNSL_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "unused ADTE3" {
	"anims/CIUNSL_ADTE3"
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
	{ event 1004 3 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 3 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 3 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 3 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/CIUNSL_ATA1_ST"
	fps 35
	rotate -90
	ACT_RELOAD 1
	{ event 2 0 }
}
$sequence "advance_signal" {
	"anims/CIUNSL_ATA1_LP"
	fps 30
	rotate -90
	ACT_SIGNAL1 1
	{ event 10 1 }
	frame 0 2
}
$sequence "victorydance" {
	"anims/CIUNSL_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "cower" {
	"anims/CIUNSL_ATA1_ED"
	fps 30
	rotate -90
	ACT_COWER 1
}
$sequence "combatidle" {
	"anims/CIUNSL_ATA1_ST"
	fps 30
	rotate -90
	ACT_IDLE_ANGRY 1
}
$sequence "crouching_idle" {
	"anims/CIUNSL_ATA1_ST"
	fps 30
	rotate -90
}
$sequence "crouching_wait" {
	"anims/CIUNSL_ATA1_LP"
	fps 1
	loop
	rotate -90
	ACT_CROUCH 0
	frame 0 0
}
$sequence "throwgrenade" {
	"anims/CIUNSL_ATA1_LP"
	fps 1
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 7 0 }
	frame 0 0
}
$sequence "launchgrenade" {
	"anims/CIUNSL_ATA1_LP"
	fps 1
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 8 0 }
	frame 0 0
}
$sequence "drop_grenade" {
	"anims/CIUNSL_ATA1_LP"
	fps 1
	rotate -90
	ACT_SPECIAL_ATTACK1 1
	{ event 9 0 }
	frame 0 0
}
$sequence "crouching_mp5" {
	"anims/CIUNSL_ATA1_LP"
	fps 30.50
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "50" }
	{ event 5 2 }
	{ event 5001 2 "50" }
	{ event 6 4 }
	{ event 5001 4 "50" }
	{ event 4 31 }
	{ event 5001 31 "50" }
	{ event 5 33 }
	{ event 5001 33 "50" }
	{ event 6 35 }
	{ event 5001 35 "50" }
}
$sequence "standing_mp5" {
	"anims/CIUNSL_ATA1_LP"
	fps 30.50
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "50" }
	{ event 5 2 }
	{ event 5001 2 "50" }
	{ event 6 4 }
	{ event 5001 4 "50" }
	{ event 4 31 }
	{ event 5001 31 "50" }
	{ event 5 33 }
	{ event 5001 33 "50" }
	{ event 6 35 }
}
$sequence "crouching_shotgun" {
	"anims/CIUNSL_ATA1_LP"
	fps 61
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "standing_shotgun" {
	"anims/CIUNSL_ATA1_LP"
	fps 61
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "repel_shoot" {
	"anims/CIUNSL_PHG"
	fps 30
	rotate -90
	ACT_FLY 1
}
