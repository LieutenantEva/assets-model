$modelname "AmericaInfantryRanger.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$body studio "AIRNGR_SKN"


$flags 0
$eyeposition 0 0 73
$cbox 0 0 0 0 0 0
$hbox 0 "DUM - MVR" 0 0 0 0 0 0
$hbox 3 "AIRNGR" -3.98 -5.25 -0.98 5.38 5.59 11.86
$hbox 2 "AIRNGR SPINE1" 0.00 -4.33 -7.93 10.58 5.61 7.93
$hbox 1 "AIRNGR HEAD" 0.00 -6.05 -5.48 12.57 6.29 5.03
$hbox 4 "AIRNGR L UPPERA" -0.33 -3.49 -2.86 18.88 2.25 3.41
$hbox 4 "AIRNGR L HAND" -1.14 -1.09 -2.61 5.67 1.58 2.73
$hbox 5 "AIRNGR R UPPERA" -0.43 -3.61 -3.59 18.88 2.10 2.46
$hbox 5 "AIRNGR R HAND" -0.69 -0.91 -2.16 6.54 1.28 2.46
$hbox 6 "AIRNGR L THIGH" 0.00 -3.19 -3.30 34.14 4.46 3.19
$hbox 6 "AIRNGR L FOOT" 0.00 -3.20 -2.68 3.83 10.28 2.77
$hbox 7 "AIRNGR R THIGH" 0.00 -3.19 -3.24 34.14 4.33 3.81
$hbox 7 "AIRNGR R FOOT" -0.15 -3.47 -2.52 3.84 10.31 2.70
$hbox 0 "BONE-GUN" 0 0 0 0 0 0
$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "AIRNGR R HAND" 0 0 0
$attachment 2 "AIRNGR HEAD" 0 0 0


// --- Idle
$sequence "DefaultConditionState STA" {
	"anims\AIRNGR_STA"
	fps 35 loop rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims\AIRNGR_IDA"
	fps 30 loop rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims\AIRNGR_IDB"
	fps 30 loop rotate -90
	ACT_IDLE 2
}
$sequence "REALLYDAMAGED STB" {
	"anims\AIRngr_STB"
	fps 35 loop rotate -90
}
$sequence "REALLYDAMAGED IDC" {
	"anims\AIRngr_IDC"
	fps 30 loop rotate -90
}
$sequence "REALLYDAMAGED IDD" {
	"anims\AIRngr_IDD"
	fps 30 loop rotate -90
}
$sequence "TRANS_Stand TRANS_StandInjured SA2SB" {
	"anims\AIRNGR_SA2SB"
	fps 30 rotate -90
}


// --- attacking (Machine Gun)
$sequence "USING_WEAPON_A ATA" {
	"anims\AIRngr_ATA"
	fps 30 loop rotate -90
}
$sequence "USING_WEAPON_A REALLYDAMAGED ATA2" {
	"anims\AIRNGR_ATA2"
	fps 30 loop rotate -90
}
$sequence "TRANS_FiringA TRANS_FiringAInjured A2WAA" {
	"anims\AIRNGR_A2WAA"
	fps 30 rotate -90
}
$sequence "TRANS_Stand TRANS_FiringA ATAST" {
	"anims\AIRNGR_ATAST"
	fps 30 rotate -90
	ACT_RELOAD 1
	{ event 2 0 }
}
$sequence "TRANS_FiringA TRANS_Stand ATAED" {
	"anims\AIRNGR_ATAED"
	fps 30 rotate -90
}
$sequence "TRANS_StandInjured TRANS_FiringAInjured S2WAA" {
	"anims\AIRNGR_S2WAA"
	fps 30 rotate -90
}
$sequence "TRANS_FiringAInjured TRANS_StandInjured WAA2S" {
	"anims\AIRNGR_WAA2S"
	fps 30 rotate -90
}
$sequence "TRANS_Stand TRANS_Move STA2RNA" {
	"anims\AIRNGR_STA2RNA"
	fps 30 rotate -90
}


// --- attacking (Grenade Launcher)
$sequence "PREATTACK_B ATBA" {
	"anims\AIRngr_ATBA"
	fps 30 rotate -90
}
$sequence "FIRING_B ATBB" {
	"anims\AIRNGR_ATBB"
	fps 30 rotate -90
}
$sequence "TRANS_Stand TRANS_FiringB ATBST1" {
	"anims\AIRNGR_ATBST1"
	fps 30 rotate -90
}
$sequence "TRANS_FiringB TRANS_Stand ATBST2" {
	"anims\AIRNGR_ATBST2"
	fps 30 rotate -90
}
$sequence "PREATTACK_B REALLYDAMAGED ATB2A" {
	"anims\AIRNGR_ATB2A"
	fps 30 rotate -90
}
$sequence "FIRING_B REALLYDAMAGED ATB2B" {
	"anims\AIRNGR_ATB2B"
	fps 30 loop rotate -90
}
$sequence "TRANS_StandInjured TRANS_FiringBInjured ATB2ST1" {
	"anims\AIRNGR_ATB2ST1"
	fps 30 rotate -90
}
$sequence "TRANS_FiringBInjured TRANS_StandInjured ATB2ST2" {
	"anims\AIRNGR_ATB2ST2"
	fps 30 rotate -90
}


// -- cross-attack transitions
$sequence "TRANS_FiringA TRANS_FiringB ATA2AB" {
	"anims\AIRNGR_ATA2AB"
	fps 30 rotate -90
}
$sequence "TRANS_FiringB TRANS_FiringA ATA2AB" {
	"anims\AIRNGR_ATA2AB-reversed"
	fps 30 rotate -90
}


// --- moving
$sequence "MOVING RNA" {
	"anims\RNA"
	fps 30 loop rotate -90
	ACT_RUN 1
	LX
}
$sequence "MOVING REALLYDAMAGED RNB" {
	"anims\RNB"
	fps 30 loop rotate -90
	ACT_RUN_HURT 1
	LX
}


// --- dying anims
$sequence "DYING DTA" {
	"anims\AIRNGR_DTA"
	fps 30 rotate -90
	ACT_DIESIMPLE 1
	{ event 11 0 }
	{ event 2001 180 }
	X
}
$sequence "DYING DTB" {
	"anims\AIRNGR_DTB"
	fps 30 rotate -90
	ACT_DIESIMPLE 1
	{ event 11 0 }
	{ event 2001 66 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing ADTF1" {
	"anims\AIRNGR_ADTF1"
	fps 30 rotate -90
}
$sequence "DYING EXPLODED_FLAILING ADTF2" {
	"anims\AIRNGR_ADTF2"
	fps 30 loop rotate -90
}
$sequence "DYING EXPLODED_BOUNCING ADTF3" {
	"anims\AIRNGR_ADTF3"
	fps 30 rotate -90
}


// --- cheering
$sequence "SPECIAL_CHEERING CHA" {
	"anims\AIRNGR_CHA"
	fps 30 loop rotate -90
}
$sequence "SPECIAL_CHEERING REALLYDAMAGED CHB" {
	"anims\AIRNGR_CHB"
	fps 30 loop rotate -90
}


// ----- PARACHUTING ANIMATIONS
$sequence "FREEFALL PFL" {
	"anims\AIRNGR_PFL"
	fps 30 rotate -90
}
$sequence "PARACHUTING PHG" {
	"anims\AIRNGR_PHG"
	fps 30 loop rotate -90
}
$sequence "TRANS_Falling TRANS_Chute POP" {
	"anims\AIRNGR_POP"
	fps 30 rotate -90
}
$sequence "TRANS_Chute TRANS_Stand PTD" {
	"anims\AIRNGR_PTD"
	fps 30 rotate -90
}


// ------- Bldg-capture
$sequence "UNPACKING FDP1" {
	"anims\AIRNGR_FDP1"
	fps 30 rotate -90
}
$sequence "RAISING_FLAG FDP2" {
	"anims\AIRNGR_FDP2"
	fps 30 rotate -90
}
$sequence "PACKING FDP1" {
	"anims\AIRNGR_FDP1-reversed"
	fps 30 rotate -90
}
$sequence "TRANS_Raising TRANS_Packing FDP2" {
	"anims\AIRNGR_FDP2-reversed"
	fps 30 rotate -90
}


// --- RAPPELLING ANIMATIONS
$sequence "RAPPELLING RPL1" {
	"anims\AIRNGR_RPL1"
	fps 30 loop rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Rappelling TRANS_Stand RPL2" {
	"anims\AIRNGR_RPL2"
	fps 30 rotate -90
	ACT_LAND 1
}


// HGrunt/Massn specific anims
$sequence "advance_signal" {
	"anims\AIRNGR_ATAST"
	fps 30 rotate -90
	ACT_SIGNAL1 1
	{ event 10 1 }
	frame 24 24
}
$sequence "victorydance" {
	"anims\AIRNGR_CHA"
	fps 30 rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "cower" {
	"anims\AIRNGR_ATAST"
	fps 30 rotate -90
	ACT_COWER 1
	frame 24 24
}
$sequence "combatidle" {
	"anims\AIRNGR_ATAST"
	fps 30 loop rotate -90
	ACT_IDLE_ANGRY 1
	frame 24 24
}
$sequence "crouching_wait" {
	"anims\AIRNGR_ATAST"
	fps 30 loop rotate -90
	ACT_CROUCH 0
	frame 24 24
}
$sequence "throwgrenade" {
	"anims\AIRngr_ATBA"
	fps 30 rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 7 9 }
}
$sequence "launchgrenade" {
	"anims\AIRNGR_ATBB"
	fps 30 rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 8 0 }
}
$sequence "drop_grenade" {
	"anims\AIRNGR_FDP1"
	fps 60 rotate -90
	ACT_SPECIAL_ATTACK1 1
	{ event 9 100 }
}
$sequence "crouching_mp5" {
	"anims\AIRngr_ATA"
	fps 30 loop rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "50" }
}
$sequence "standing_mp5" {
	"anims\AIRngr_ATA"
	fps 30 loop rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "50" }
}
$sequence "crouching_shotgun" {
	"anims\AIRngr_ATA"
	fps 13 loop rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "standing_shotgun" {
	"anims\AIRngr_ATA"
	fps 13 loop rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "repel_shoot" {
	"anims\AIRNGR_RPL1"
	fps 30 loop rotate -90
	ACT_FLY 1
}
