$modelname "GLAInfantryRebel.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UIRGRD_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/UIRGRD_AssaultRifle"
	blank
}
$bodygroup "Toxin Tanks" {
	blank
	studio "bodies/UIRGRD_ToxinTanks"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "REPGRD" -6.780000 -8.880000 -2.890000 4.700000 8.710000 12.450000
$hbox 2 "REPGRD SPINE1" 0.00 -6.33 -9.24 10.70 6.38 9.10
$hbox 1 "REPGRD HEAD" 0.00 -4.36 -3.67 12.44 6.27 4.91
$hbox 4 "REPGRD L UPPERA" 0.00 -4.34 -2.87 22.76 2.92 2.48
$hbox 4 "REPGRD L HAND" -0.21 -0.99 -2.52 6.78 1.67 2.90
$hbox 5 "REPGRD R UPPERA" 0.00 -4.20 -2.37 22.73 2.50 3.40
$hbox 5 "REPGRD R HAND" 0.00 -0.66 -2.93 6.94 1.85 2.90
$hbox 6 "REPGRD L THIGH" 0.00 -3.44 -3.67 35.91 3.58 4.11
$hbox 6 "REPGRD L FOOT" -0.67 -2.82 -2.15 3.20 11.47 4.39
$hbox 7 "REPGRD R THIGH" 0.00 -3.29 -2.89 35.91 4.69 4.27
$hbox 7 "REPGRD R FOOT" -0.77 -2.33 -3.64 3.19 11.53 3.21
$attachment 0 "MUZZLEFX01" 0 0 0
$attachment 1 "REPGRD R HAND" 0 0 0
$attachment 2 "REPGRD HEAD" 0 0 0


// ---- standing
$sequence "DefaultConditionState STN" {
	"anims/UIRGrd_STN"
	fps 35
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/UIRGrd_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims/UIRGrd_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "REALLYDAMAGED STB" {
	"anims/UIRGrd_STB"
	fps 35
	loop
	rotate -90
}
$sequence "REALLYDAMAGED IDC" {
	"anims/UIRGrd_IDC"
	fps 30
	loop
	rotate -90
}
$sequence "REALLYDAMAGED IDD" {
	"anims/UIRGrd_IDD"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Standing TRANS_StandingHurt" {
	"anims/UIRGRD_STA2STB"
	fps 30
	rotate -90
}


// ---- moving
$sequence "MOVING" {
	"anims/UIRGRD_RNA"
	fps 15
	loop
	rotate -90
}
$sequence "MOVING REALLYDAMAGED" {
	"anims/UIRGRD_RNB"
	fps 25
	loop
	rotate -90
}


// ------- Bldg-capture
//$sequence "UNPACKING" {
//	"anims/FDPB1"
//	fps 30
//	loop
//	rotate -90
//}
$sequence "RAISING_FLAG" {
	"anims/FDP2"
	fps 30
	loop
	rotate -90
}
//$sequence "PACKING" {
//	"anims/FDP1-reversed"
//	fps 30
//	loop
//	rotate -90
//}
$sequence "TRANS_Raising TRANS_Packing" {
	"anims/FDP2-reversed"
	fps 30
	loop
	rotate -90
}


// ---- dying 
$sequence "DYING DTA" {
	"anims/UIRGrd_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 42 }
	X
}
$sequence "DYING DTB" {
	"anims/UIRGrd_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 11 1 }
	{ event 2001 32 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/UIRGrd_ADTE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/UIRGrd_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/UIRGrd_ADTE3"
	fps 30
	rotate -90
}


// --- cheering
$sequence "SPECIAL_CHEERING" {
	"anims/UIRGrd_CHA"
	fps 30
	loop
	rotate -90
}
$sequence "SPECIAL_CHEERING REALLYDAMAGED" {
	"anims/UIRGrd_CHB"
	fps 30
	loop
	rotate -90
}


// ---- firing
$sequence "USING_WEAPON_A ATA" {
	"anims/UIRGrd_ATA"
	fps 30
	loop
	rotate -90
}
$sequence "USING_WEAPON_A ATA3" {
	"anims/UIRGrd_ATA3"
	fps 30
	loop
	rotate -90
}
$sequence "USING_WEAPON_A REALLYDAMAGED" {
	"anims/UIRGrd_ATA2"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Firing TRANS_FiringHurt" {
	"anims/UIRGRD_ATA2ATA2"
	fps 30
	rotate -90
}
$sequence "TRANS_Standing TRANS_Firing" {
	"anims/UIRGrd_ATAST"
	fps 30
	rotate -90
}
$sequence "TRANS_Firing TRANS_Standing" {
	"anims/UIRGrd_ATAED"
	fps 30
	rotate -90
}
$sequence "TRANS_StandingHurt TRANS_FiringHurt" {
	"anims/UIRGrd_ATA2ED-reversed"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringHurt TRANS_StandingHurt" {
	"anims/UIRGrd_ATA2ED"
	fps 30
	rotate -90
}


// ----- PARACHUTING ANIMATIONS
//$sequence "FREEFALL" {
//	"anims/UIRGrd_PFL"
//	fps 30
//	rotate -90
//}
$sequence "PARACHUTING" {
	"anims/UIRGrd_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/UIRGrd_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/UIRGrd_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// !!!UNUSED!!!
$sequence "unused CAP" {
	"anims/UIRGRD_CAP"
	fps 30
	loop
	rotate -90
}
$sequence "unused CAPB" {
	"anims/UIRGRD_CAPB"
	fps 30
	loop
	rotate -90
}
$sequence "unused SUR" {
	"anims/UIRGRD_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SURB" {
	"anims/UIRGRD_SURB"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/UIRGRD_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SSTB" {
	"anims/UIRGRD_SSTB"
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
	{ event 1004 10 "common/npc_step2.wav" }
	{ event 1004 24 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_limprun"
	fps 30
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 2 "common/npc_step3.wav" }
	{ event 1004 16 "common/npc_step2.wav" }
	{ event 1004 29 "common/npc_step3.wav" }
	{ event 1004 43 "common/npc_step2.wav" }
}
$sequence "reload" {
	"anims/UIRGrd_ATAST"
	fps 30
	rotate -90
	ACT_RELOAD 1
	{ event 2 0 }
}
$sequence "advance_signal" {
	"anims/UIRGrd_CHB"
	fps 200
	rotate -90
	ACT_SIGNAL1 1
	{ event 10 1 }
}
$sequence "victorydance" {
	"anims/UIRGrd_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "cower" {
	"anims/UIRGrd_ATAED"
	fps 30
	rotate -90
	ACT_COWER 1
}
$sequence "combatidle" {
	"anims/UIRGrd_ATAST"
	fps 30
	rotate -90
	ACT_IDLE_ANGRY 1
}
$sequence "crouching_idle" {
	"anims/UIRGrd_ATAST"
	fps 30
	rotate -90
}
$sequence "crouching_wait" {
	"anims/UIRGrd_ATAED"
	fps 30
	loop
	rotate -90
	ACT_CROUCH 0
	frame 0 0
}
$sequence "throwgrenade" {
	"anims/UIRGrd_ATA3"
	fps 90
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 7 0 }
}
$sequence "launchgrenade" {
	"anims/UIRGrd_ATA3"
	fps 90
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 8 0 }
}
$sequence "drop_grenade" {
	"anims/UIRGRD_SUR"
	fps 300
	rotate -90
	ACT_SPECIAL_ATTACK1 1
	{ event 9 128 }
}
$sequence "crouching_mp5" {
	"anims/UIRGrd_ATA"
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
	{ event 5 52 }
	{ event 5001 52 "50" }
}
$sequence "standing_mp5" {
	"anims/UIRGrd_ATA"
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
	{ event 5 52 }
	{ event 5001 52 "50" }
}
$sequence "crouching_shotgun" {
	"anims/UIRGrd_ATA"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
	{ event 4 11 }
	{ event 5001 11 "51" }
	{ event 4 22 }
	{ event 5001 22 "51" }
	{ event 4 33 }
	{ event 5001 33 "51" }
	{ event 4 44 }
	{ event 5001 44 "51" }
}
$sequence "standing_shotgun" {
	"anims/UIRGrd_ATA"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
	{ event 4 11 }
	{ event 5001 11 "51" }
	{ event 4 22 }
	{ event 5001 22 "51" }
	{ event 4 33 }
	{ event 5001 33 "51" }
	{ event 4 44 }
	{ event 5001 44 "51" }
}
$sequence "repel_shoot" {
	"anims/UIRGrd_PHG"
	fps 30
	rotate -90
	ACT_FLY 1
}
