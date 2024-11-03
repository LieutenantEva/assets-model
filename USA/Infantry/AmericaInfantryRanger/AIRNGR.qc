$modelname "AmericaInfantryRanger.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AIRNGR_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/AIRNGR_AssaultRifle"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "AIRNGR" -4.870000 -5.250000 -0.980000 5.380000 5.590000 11.860000
$hbox 2 "AIRNGR SPINE1" 0.000000 -4.330000 -7.930000 9.560000 5.610000 6.930000
$hbox 1 "AIRNGR HEAD" -1.110000 -6.050000 -5.480000 12.570000 6.290000 5.030000
$hbox 4 "AIRNGR L UPPERA" -0.33 -3.49 -2.86 18.88 2.25 3.41
$hbox 4 "AIRNGR L HAND" -1.14 -1.09 -2.61 5.67 1.58 2.73
$hbox 5 "AIRNGR R UPPERA" -0.43 -3.61 -3.59 18.88 2.10 2.46
$hbox 5 "AIRNGR R HAND" -0.69 -0.91 -2.16 6.54 1.28 2.46
$hbox 6 "AIRNGR L THIGH" 0.00 -3.19 -3.30 34.14 4.46 3.19
$hbox 6 "AIRNGR L FOOT" 0.00 -3.20 -2.68 3.83 10.28 2.77
$hbox 7 "AIRNGR R THIGH" 0.00 -3.19 -3.24 34.14 4.33 3.81
$hbox 7 "AIRNGR R FOOT" -0.15 -3.47 -2.52 3.84 10.31 2.70
$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "AIRNGR R HAND" 0 0 0
$attachment 2 "AIRNGR HEAD" 0 0 0


// --- Idle
$sequence "DefaultConditionState STA" {
	"anims/AIRNGR_STA"
	fps 35
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/AIRNGR_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims/AIRNGR_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "REALLYDAMAGED STB" {
	"anims/AIRngr_STB"
	fps 35
	loop
	rotate -90
}
$sequence "REALLYDAMAGED IDC" {
	"anims/AIRngr_IDC"
	fps 30
	loop
	rotate -90
}
$sequence "REALLYDAMAGED IDD" {
	"anims/AIRngr_IDD"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Stand TRANS_StandInjured" {
	"anims/AIRNGR_SA2SB"
	fps 30
	rotate -90
}


// --- attacking (Machine Gun)
$sequence "USING_WEAPON_A" {
	"anims/AIRngr_ATA"
	fps 30
	loop
	rotate -90
}
$sequence "USING_WEAPON_A REALLYDAMAGED" {
	"anims/AIRNGR_ATA2"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_FiringA TRANS_FiringAInjured" {
	"anims/AIRNGR_A2WAA"
	fps 30
	rotate -90
}
$sequence "TRANS_Stand TRANS_FiringA" {
	"anims/AIRNGR_ATAST"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringA TRANS_Stand" {
	"anims/AIRNGR_ATAED"
	fps 30
	rotate -90
}
$sequence "TRANS_StandInjured TRANS_FiringAInjured" {
	"anims/AIRNGR_S2WAA"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringAInjured TRANS_StandInjured" {
	"anims/AIRNGR_WAA2S"
	fps 30
	rotate -90
}
$sequence "TRANS_Stand TRANS_Move" {
	"anims/AIRNGR_STA2RNA"
	fps 30
	rotate -90
}


// --- attacking (Grenade Launcher)
$sequence "PREATTACK_B" {
	"anims/AIRngr_ATBA"
	fps 30
	rotate -90
}
$sequence "FIRING_B" {
	"anims/AIRNGR_ATBB"
	fps 30
	rotate -90
}
$sequence "TRANS_Stand TRANS_FiringB" {
	"anims/AIRNGR_ATBST1"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringB TRANS_Stand" {
	"anims/AIRNGR_ATBST2"
	fps 30
	rotate -90
}
$sequence "PREATTACK_B REALLYDAMAGED" {
	"anims/AIRNGR_ATB2A"
	fps 30
	rotate -90
}
$sequence "FIRING_B REALLYDAMAGED" {
	"anims/AIRNGR_ATB2B"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_StandInjured TRANS_FiringBInjured" {
	"anims/AIRNGR_ATB2ST1"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringBInjured TRANS_StandInjured" {
	"anims/AIRNGR_ATB2ST2"
	fps 30
	rotate -90
}


// -- cross-attack transitions
$sequence "TRANS_FiringA TRANS_FiringB" {
	"anims/AIRNGR_ATA2AB"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringB TRANS_FiringA" {
	"anims/AIRNGR_ATA2AB-reversed"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringAInjured TRANS_FiringBInjured" {
	"anims/AIRNGR_AA22AB2"
	fps 30
	rotate -90
}


// --- moving
$sequence "MOVING" {
	"anims/AIRNGR_RNA"
	fps 30
	loop
	rotate -90
}
$sequence "MOVING REALLYDAMAGED" {
	"anims/AIRNGR_RNB"
	fps 30
	loop
	rotate -90
}


// --- dying anims
$sequence "DYING DTA" {
	"anims/AIRNGR_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 180 }
	X
}
$sequence "DYING DTB" {
	"anims/AIRNGR_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 66 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/AIRNGR_ADTF1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/AIRNGR_ADTF2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/AIRNGR_ADTF3"
	fps 30
	rotate -90
}


// --- cheering
$sequence "SPECIAL_CHEERING" {
	"anims/AIRNGR_CHA"
	fps 30
	loop
	rotate -90
}
$sequence "SPECIAL_CHEERING REALLYDAMAGED" {
	"anims/AIRNGR_CHB"
	fps 30
	loop
	rotate -90
}


// ----- PARACHUTING ANIMATIONS
$sequence "FREEFALL" {
	"anims/AIRNGR_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/AIRNGR_PHG"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/AIRNGR_POP"
	fps 30
	rotate -90
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/AIRNGR_PTD"
	fps 30
	rotate -90
}


// ------- Bldg-capture
$sequence "UNPACKING" {
	"anims/AIRNGR_FDP1"
	fps 30
	rotate -90
}
$sequence "RAISING_FLAG" {
	"anims/AIRNGR_FDP2"
	fps 30
	rotate -90
}
$sequence "PACKING" {
	"anims/AIRNGR_FDP1-reversed"
	fps 30
	rotate -90
}
$sequence "TRANS_Raising TRANS_Packing" {
	"anims/AIRNGR_FDP2-reversed"
	fps 30
	rotate -90
}


// --- RAPPELLING ANIMATIONS
$sequence "RAPPELLING" {
	"anims/AIRNGR_RPL1"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Rappelling TRANS_Stand" {
	"anims/AIRNGR_RPL2"
	fps 30
	rotate -90
	ACT_LAND 1
}


// !!!UNUSED!!!
$sequence "unused ENC" {
	"anims/AIRNGR_ENC"
	fps 30
	loop
	rotate -90
}
$sequence "unused CAP" {
	"anims/AIRNGR_CAP"
	fps 30
	loop
	rotate -90
}
$sequence "unused CAPB" {
	"anims/AIRNGR_CAPB"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUR" {
	"anims/AIRNGR_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SURB" {
	"anims/AIRNGR_SURB"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/AIRNGR_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SSTB" {
	"anims/AIRNGR_SSTB"
	fps 30
	loop
	rotate -90
}
$sequence "unused SWKB" {
	"anims/AIRNGR_SWKB"
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
	{ event 1004 16 "common/npc_step4.wav" }
	{ event 1004 30 "common/npc_step2.wav" }
	{ event 1004 44 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_limprun"
	fps 30
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 8 "common/npc_step2.wav" }
	{ event 1004 21 "common/npc_step3.wav" }
	{ event 1004 33 "common/npc_step2.wav" }
	{ event 1004 47 "common/npc_step3.wav" }
	{ event 1004 58 "common/npc_step2.wav" }
	{ event 1004 73 "common/npc_step3.wav" }
}
$sequence "reload" {
	"anims/AIRNGR_ATAST"
	fps 30
	rotate -90
	ACT_RELOAD 1
	{ event 2 0 }
}
$sequence "advance_signal" {
	"anims/AIRNGR_ENC"
	fps 100
	rotate -90
	ACT_SIGNAL1 1
	{ event 10 1 }
}
$sequence "victorydance" {
	"anims/AIRNGR_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "cower" {
	"anims/AIRNGR_ATAED"
	fps 30
	rotate -90
	ACT_COWER 1
}
$sequence "combatidle" {
	"anims/AIRNGR_ATAST"
	fps 30
	rotate -90
	ACT_IDLE_ANGRY 1
}
$sequence "crouching_idle" {
	"anims/AIRNGR_ATAST"
	fps 30
	rotate -90
}
$sequence "crouching_wait" {
	"anims/AIRNGR_ATAED"
	fps 30
	loop
	rotate -90
	ACT_CROUCH 0
	frame 0 0
}
$sequence "throwgrenade" {
	"anims/AIRngr_ATBA"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 7 9 }
}
$sequence "launchgrenade" {
	"anims/AIRNGR_ATBB"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 8 0 }
}
$sequence "drop_grenade" {
	"anims/AIRNGR_FDP1"
	fps 60
	rotate -90
	ACT_SPECIAL_ATTACK1 1
	{ event 9 83 }
}
$sequence "crouching_mp5" {
	"anims/AIRngr_ATA"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "50" }
	{ event 5 4 }
	{ event 5001 4 "50" }
}
$sequence "standing_mp5" {
	"anims/AIRngr_ATA"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "50" }
	{ event 5 4 }
	{ event 5001 4 "50" }
}
$sequence "crouching_shotgun" {
	"anims/AIRngr_ATA"
	fps 13
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "standing_shotgun" {
	"anims/AIRngr_ATA"
	fps 13
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "repel_shoot" {
	"anims/AIRNGR_RPL1"
	fps 30
	rotate -90
	ACT_FLY 1
}
