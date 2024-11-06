$modelname "ChinaInfantryRedguard.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/NICNSC_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/NICNSC_Rifle"
	studio "bodies/NICNSC_Minigun"
	blank
}
$texturegroup "Uniform"
{
	{ "Remap1_223_255_255.bmp" }
	{ "Remap2_223_255_255.bmp" }
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "NICNSC" -4.760000 -6.850000 0.000000 4.910000 7.350000 12.800000
$hbox 2 "NICNSC SPINE1" -1.000000 -3.640000 -7.500000 9.000000 5.150000 8.150000
$hbox 1 "NICNSC HEAD" -1.23 -4.56 -3.90 11.87 5.56 4.10
$hbox 4 "NICNSC L UPPERA" 0.00 -3.13 -3.21 21.29 2.16 3.24
$hbox 4 "NICNSC L HAND" -0.30 -1.59 -3.59 6.36 1.29 2.72
$hbox 5 "NICNSC R UPPERA" -0.43 -3.37 -3.31 21.29 2.29 2.96
$hbox 5 "NICNSC R HAND" -0.50 -1.93 -2.66 7.22 0.58 3.09
$hbox 6 "NICNSC L THIGH" 0.00 -4.31 -3.63 35.25 3.98 3.35
$hbox 6 "NICNSC L FOOT" 0.00 -3.44 -2.89 4.22 11.36 3.60
$hbox 7 "NICNSC R THIGH" 0.00 -4.30 -3.64 35.25 3.87 4.26
$hbox 7 "NICNSC R FOOT" -0.13 -3.88 -2.98 4.23 11.41 2.51
$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "NICNSC R HAND" 0 0 0
$attachment 2 "NICNSC HEAD" 0 0 0


// ------- Standing-Around Animations
$sequence "DefaultConditionState STA" {
	"anims/NICNSC_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 36
}
$sequence "DefaultConditionState IDA" {
	"anims/NICNSC_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/NICNSC_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "REALLYDAMAGED" {
	"anims/NICNSC_STB"
	fps 30
	loop
	rotate -90
}


// ------- Machine Gun Animations
$sequence "USING_WEAPON_A" {
	"anims/NICNSC_ATA"
	fps 30
	loop
	rotate -90
}
$sequence "USING_WEAPON_A REALLYDAMAGED" {
	"anims/NICNSC_ATC"
	fps 30
	loop
	rotate -90
}
$sequence "USING_WEAPON_B" {
	"anims/NICNSC_ATA2"
	fps 30
	loop
	rotate -90
}
$sequence "USING_WEAPON_B REALLYDAMAGED" {
	"anims/NICNSC_ATC2"
	fps 30
	loop
	rotate -90
}


// ------- Firing-related Transitions
$sequence "TRANS_Firing TRANS_FiringDamaged" {
	"anims/NICNSC_AA2AC"
	fps 30
	rotate -90
}
$sequence "TRANS_Stand TRANS_Firing" {
	"anims/NICNSC_SA2AA"
	fps 30
	rotate -90
}
$sequence "TRANS_Firing TRANS_Stand" {
	"anims/NICNSC_AA2SA"
	fps 30
	rotate -90
}
$sequence "TRANS_StandDamaged TRANS_FiringDamaged" {
	"anims/NICNSC_ATCST"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringDamaged TRANS_StandDamaged" {
	"anims/NICNSC_ATCED"
	fps 30
	rotate -90
}


// ------------- Damage Transitions --------------------
$sequence "TRANS_StandDamaged TRANS_RunDamaged" {
	"anims/NICNSC_STB2RNB"
	fps 30
	rotate -90
}
$sequence "TRANS_RunDamaged TRANS_StandDamaged" {
	"anims/NICNSC_RNB2STB"
	fps 30
	rotate -90
}
$sequence "TRANS_Stand TRANS_StandDamaged" {
	"anims/NICNSC_STA2STB"
	fps 30
	rotate -90
}


// ------- Bayonet Animations
$sequence "PREATTACK_C" {
	"anims/NICNSC_ATB1"
	fps 30
	rotate -90
}
$sequence "FIRING_C" {
	"anims/NICNSC_ATB2"
	fps 30
	rotate -90
}
$sequence "PREATTACK_C REALLYDAMAGED" {
	"anims/NICNSC_ATD1"
	fps 30
	rotate -90
}
$sequence "FIRING_C REALLYDAMAGED" {
	"anims/NICNSC_ATD2"
	fps 30
	rotate -90
}


// ------- Parachuting Animations
//$sequence "FREEFALL" {
//	"anims/NICNSC_POP"
//	fps 30
//	rotate -90
//}
$sequence "PARACHUTING" {
	"anims/NICNSC_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/NICNSC_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/NICNSC_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// ------- Movement Animations
$sequence "MOVING" {
	"anims/NICNSC_RNA"
	fps 30
	loop
	rotate -90
}
$sequence "MOVING REALLYDAMAGED" {
	"anims/NICNSC_RNB"
	fps 30
	loop
	rotate -90
}


// ------- Bldg-capture
$sequence "UNPACKING" {
	"anims/NICNSC_FDP1"
	fps 30
	rotate -90
}
$sequence "RAISING_FLAG" {
	"anims/NICNSC_FDP2"
	fps 30
	rotate -90
}
$sequence "PACKING" {
	"anims/NICNSC_FDP1-reversed"
	fps 30
	rotate -90
}
$sequence "TRANS_Raising TRANS_Packing" {
	"anims/NICNSC_FDP2-reversed"
	fps 30
	rotate -90
}


// ------- Dying Animations
$sequence "DYING DTA" {
	"anims/NICNSC_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 36 }
	X
}
$sequence "DYING DTB" {
	"anims/NICNSC_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 35 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/NICNSC_ATDE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/NICNSC_ATDE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/NICNSC_ATDE3"
	fps 30
	rotate -90
}


// --- cheering
$sequence "SPECIAL_CHEERING" {
	"anims/NICNSC_CHA"
	fps 30
	loop
	rotate -90
}
$sequence "SPECIAL_CHEERING REALLYDAMAGED" {
	"anims/NICNSC_CHB"
	fps 30
	loop
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused MAR" {
	"anims/NICNSC_MAR"
	fps 30
	loop
	rotate -90
}
$sequence "unused MARN" {
	"anims/NICNSC_MARN"
	fps 30
	loop
	rotate -90
}
$sequence "unused CAPST" {
	"anims/NICNSC_CAPST"
	fps 30
	loop
	rotate -90
}
$sequence "unused CAP" {
	"anims/NICNSC_CAP"
	fps 30
	loop
	rotate -90
}
$sequence "unused CAPB" {
	"anims/NICNSC_CAPB"
	fps 30
	loop
	rotate -90
}
$sequence "unused CAPED" {
	"anims/NICNSC_CAPED"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUR" {
	"anims/NICNSC_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/NICNSC_SST"
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
	{ event 1004 1 "common/npc_step2.wav" }
	{ event 1004 11 "common/npc_step4.wav" }
	{ event 1004 22 "common/npc_step2.wav" }
	{ event 1004 32 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_walk"
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 3 "common/npc_step2.wav" }
	{ event 1004 25 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_limprun"
	fps 30
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 3 "common/npc_step2.wav" }
	{ event 1004 16 "common/npc_step4.wav" }
	{ event 1004 28 "common/npc_step2.wav" }
	{ event 1004 40 "common/npc_step4.wav" }
	{ event 1004 53 "common/npc_step2.wav" }
	{ event 1004 64 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_limprun"
	fps 30
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 3 "common/npc_step2.wav" }
	{ event 1004 16 "common/npc_step4.wav" }
	{ event 1004 28 "common/npc_step2.wav" }
	{ event 1004 40 "common/npc_step4.wav" }
	{ event 1004 53 "common/npc_step2.wav" }
	{ event 1004 64 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/NICNSC_SA2AA"
	fps 30
	rotate -90
	ACT_RELOAD 1
	{ event 2 0 }
}
$sequence "kick" {
	"anims/NICNSC_ATB1"
	fps 26
	rotate -90
	ACT_MELEE_ATTACK1 1
	{ event 3 16 }
	{ event 2010 16 }
}
$sequence "advance_signal" {
	"anims/NICNSC_CHA"
	fps 191
	rotate -90
	ACT_SIGNAL1 1
	{ event 10 1 }
}
$sequence "victorydance" {
	"anims/NICNSC_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "cower" {
	"anims/NICNSC_AA2SA"
	fps 30
	rotate -90
	ACT_COWER 1
}
$sequence "combatidle" {
	"anims/NICNSC_SA2AA"
	fps 30
	rotate -90
	ACT_IDLE_ANGRY 1
}
$sequence "crouching_idle" {
	"anims/NICNSC_SA2AA"
	fps 30
	rotate -90
}
$sequence "crouching_wait" {
	"anims/NICNSC_AA2SA"
	fps 1
	rotate -90
	ACT_CROUCH 0
	frame 0 0
}
$sequence "throwgrenade" {
	"anims/NICNSC_ATA2"
	fps 32
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 7 0 }
}
$sequence "launchgrenade" {
	"anims/NICNSC_ATA2"
	fps 32
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 8 0 }
}
$sequence "drop_grenade" {
	"anims/NICNSC_FDP1"
	fps 96
	rotate -90
	ACT_SPECIAL_ATTACK1 1
	{ event 9 83 }
}
$sequence "crouching_mp5" {
	"anims/NICNSC_ATA"
	fps 32
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5 0 }
	{ event 6 0 }
	{ event 4 0 }
	{ event 5 0 }
	{ event 6 0 }
	{ event 5001 0 "50" }
}
$sequence "standing_mp5" {
	"anims/NICNSC_ATA"
	fps 32
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5 0 }
	{ event 6 0 }
	{ event 4 0 }
	{ event 5 0 }
	{ event 6 0 }
	{ event 5001 0 "50" }
}
$sequence "crouching_shotgun" {
	"anims/NICNSC_ATA"
	fps 32
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "standing_shotgun" {
	"anims/NICNSC_ATA"
	fps 32
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "repel_shoot" {
	"anims/NICNSC_PHG"
	fps 30
	rotate -90
	ACT_FLY 1
}
