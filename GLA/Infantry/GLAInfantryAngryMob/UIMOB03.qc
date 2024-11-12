$modelname "GLAInfantryAngryMob_3.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$renamebone "UIMOB_ROOT" "UIMOB03_ROOT"
$bodygroup "body" {
	studio "bodies/UIMOB_Body3"
}
$bodygroup "Primary Weapon" {
	studio "bodies/UIMOB_AK47"
	studio "bodies/UIMOB_Pistol"
	blank
}
$bodygroup "Throwable Weapon" {
	blank
	studio "bodies/UIMOB_Rock"
	studio "bodies/UIMOB_Molotov"
}
$texturegroup "Uniform"
{
	{ "Remap1_224_255_255.bmp" }
	{ "Remap2_224_255_255.bmp" }
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UIMOB03 SPINE" -6.00 -4.00 -8.00 8.00 5.00 8.00
$hbox 2 "UIMOB03 SPINE1" 0.00 -4.00 -9.00 10.00 5.00 9.00
$hbox 1 "UIMOB03 HEAD" -1.00 -4.00 -4.00 13.00 7.00 4.00
$hbox 4 "UIMOB03 L UPPER" 0.00 -6.00 -3.00 11.00 3.00 3.00
$hbox 4 "UIMOB03 L FOREA" 0.00 -3.00 -3.00 11.00 3.00 3.00
$hbox 4 "UIMOB03 L HAND" 0.00 -2.00 -3.00 8.00 2.00 3.00
$hbox 5 "UIMOB03 R UPPER" 0.00 -6.00 -3.00 11.00 3.00 3.00
$hbox 5 "UIMOB03 R FOREA" 0.00 -3.00 -3.00 11.00 3.00 2.00
$hbox 5 "UIMOB03 R HAND" 0.00 -2.00 -3.00 7.00 2.00 3.00
$hbox 6 "UIMOB03 L THIGH" -1.00 -4.00 -4.00 34.00 4.00 4.00
$hbox 6 "UIMOB03 L FOOT" -2.00 -5.00 -3.00 4.00 10.00 3.00
$hbox 7 "UIMOB03 R THIGH" -1.00 -4.00 -4.00 34.00 4.00 4.00
$hbox 7 "UIMOB03 R FOOT" -2.00 -5.00 -3.00 4.00 10.00 3.00
$attachment 0 "MUZZLEAK01" 0 0 0
$attachment 1 "MUZZLE01" 0 0 0


$sequence "pose" {
	"bodies/UIMOB_Body3"
	fps 1
	loop
	rotate -90
	frame 0 0
}


// WHILE CARRYING PISTOL
//---------------------------------------------------------
//Idle with Pistol Holstered
$sequence "DefaultConditionState IDA1" {
	"anims/UIMOB03_IDA1"
	fps 30
	loop
	rotate -90
}
$sequence "DefaultConditionState IDA2" {
	"anims/UIMOB03_IDA2"
	fps 30
	loop
	rotate -90
}
$sequence "DefaultConditionState CHA" {
	"anims/UIMOB03_CHA"
	fps 30
	loop
	rotate -90
}
// TODO: It's too damn big!
//$sequence "DefaultConditionState STA" {
//	"anims/UIMOB03_STA"
//	fps 30
//	loop
//	rotate -90
//}
// TRANSITION FROM PISTOL TO AK47
$sequence "TRANS_STAND_A TRANS_STAND_AK" {
	"anims/UIMOB03_TA-D"
	fps 30
	rotate -90
}
// WHILE CARRYING AK47 
//---------------------------------------------------------
//Idle with AK Slung
$sequence "WEAPONSET_PLAYER_UPGRADE IDD1" {
	"anims/UIMOB03_IDD1"
	fps 30
	loop
	rotate -90
	ACT_IDLE 7
}
$sequence "WEAPONSET_PLAYER_UPGRADE IDD2" {
	"anims/UIMOB03_IDD2"
	fps 30
	loop
	rotate -90
	ACT_IDLE 7
}
$sequence "WEAPONSET_PLAYER_UPGRADE CHD" {
	"anims/UIMOB03_CHD"
	fps 30
	loop
	rotate -90
	ACT_IDLE 7
}
$sequence "WEAPONSET_PLAYER_UPGRADE STD" {
	"anims/3_STD"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Run
$sequence "MOVING" {
	"anims/UIMOB03_RNA"
	fps 30
	loop
	rotate -90
}
$sequence "MOVING WEAPONSET_PLAYER_UPGRADE" {
	"anims/UIMOB03_RND"
	fps 30
	loop
	rotate -90
}


// Drawing pistol
//start firing
$sequence "PREATTACK_A" {
	"anims/UIMOB03_ATA1_ST"
	fps 30
	rotate -90
}
// Firing pistol
//looping firing
$sequence "FIRING_A" {
	"anims/UIMOB03_ATA1_LP"
	fps 30
	loop
	rotate -90
}
//end firing
$sequence "RELOADING_A" {
	"anims/UIMOB03_ATA1_ED"
	fps 30
	rotate -90
}
// This transition allows him to put his gun away when he's finished attacking.
$sequence "TRANS_FIRING_A TRANS_STAND_A" {
	"anims/UIMOB03_ATA1_ED"
	fps 30
	rotate -90
}


// Drawing AK47
//start firing
$sequence "PREATTACK_B WEAPONSET_PLAYER_UPGRADE" {
	"anims/UIMOB03_ATD_ST"
	fps 30
	rotate -90
}
// Firing Gun
//looping firing
$sequence "FIRING_B WEAPONSET_PLAYER_UPGRADE" {
	"anims/UIMOB03_ATD_LP"
	fps 30
	loop
	rotate -90
}
//end firing
$sequence "RELOADING_B WEAPONSET_PLAYER_UPGRADE" {
	"anims/UIMOB03_ATD_ED"
	fps 30
	rotate -90
}
// This transition allows him to put his gun away when he's finished attacking.
//end firing
$sequence "TRANS_FIRING_AK TRANS_STAND_AK" {
	"anims/UIMOB03_ATD_ED"
	fps 30
	rotate -90
}


// Death
$sequence "DYING DA1" {
	"anims/UIMOB03_DA1"
	fps 30
	rotate -90
	{ event 2001 45 }
	X
}
$sequence "DYING DA2" {
	"anims/UIMOB03_DA2"
	fps 30
	rotate -90
	{ event 2001 80 }
	X
}
$sequence "DYING WEAPONSET_PLAYER_UPGRADE DD1" {
	"anims/UIMOB03_DD1"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 45 }
	X
}
$sequence "DYING WEAPONSET_PLAYER_UPGRADE DD2" {
	"anims/UIMOB03_DD2"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 80 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing A_ADTD1" {
	"anims/UIMOB03_A_ADTD1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING A_ADTD2" {
	"anims/UIMOB03_A_ADTD2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING A_ADTD3" {
	"anims/UIMOB03_A_ADTD3"
	fps 30
	rotate -90
}
$sequence "TRANS_Dying TRANS_Flailing D_ADTD1" {
	"anims/UIMOB03_D_ADTD1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING D_ADTD2" {
	"anims/UIMOB03_D_ADTD2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING D_ADTD3" {
	"anims/UIMOB03_D_ADTD3"
	fps 30
	rotate -90
}


// Cheer
$sequence "SPECIAL_CHEERING" {
	"anims/UIMOB03_CHA"
	fps 30
	loop
	rotate -90
}
$sequence "SPECIAL_CHEERING WEAPONSET_PLAYER_UPGRADE" {
	"anims/UIMOB03_CHD"
	fps 30
	loop
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused ATA2_ST" {
	"anims/UIMOB03_ATA2_ST"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATA2_LP" {
	"anims/UIMOB03_ATA2_LP"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATA2_ED" {
	"anims/UIMOB03_ATA2_ED"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATCA_ST" {
	"anims/UIMOB03_ATCA_ST"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATCA_LP" {
	"anims/UIMOB03_ATCA_LP"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATCA_ED" {
	"anims/UIMOB03_ATCA_ED"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATCA_BF" {
	"anims/UIMOB03_ATCA_BF"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATCA_AF" {
	"anims/UIMOB03_ATCA_AF"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATCD_ST" {
	"anims/UIMOB03_ATCD_ST"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATCD_LP" {
	"anims/UIMOB03_ATCD_LP"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATCD_ED" {
	"anims/UIMOB03_ATCD_ED"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATCD_BF" {
	"anims/UIMOB03_ATCD_BF"
	fps 30
	loop
	rotate -90
}
$sequence "unused ATCD_AF" {
	"anims/UIMOB03_ATCD_AF"
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
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 15 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_3_run"
	fps 15
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 15 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_3_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 15 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_3_run"
	fps 15
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 15 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/UIMOB03_ATD_ST"
	fps 31
	rotate -90
	ACT_RELOAD 1
	{ event 2 0 }
}
$sequence "advance_signal" {
	"anims/UIMOB03_ATCD_LP"
	fps 121
	rotate -90
	ACT_SIGNAL1 1
	{ event 10 1 }
}
$sequence "victorydance" {
	"anims/UIMOB03_CHD"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
	{ event 4 85 }
	{ event 5001 85 "50" }
	{ event 5 87 }
	{ event 5001 87 "50" }
	{ event 6 89 }
	{ event 5001 89 "50" }
	{ event 4 91 }
	{ event 5001 91 "50" }
	{ event 5 93 }
	{ event 5001 93 "50" }
	{ event 6 95 }
	{ event 5001 95 "50" }
	{ event 4 97 }
	{ event 5001 97 "50" }
	{ event 5 99 }
	{ event 5001 99 "50" }
	{ event 6 101 }
	{ event 5001 101 "50" }
	{ event 4 103 }
	{ event 5001 103 "50" }
	{ event 5 105 }
	{ event 5001 105 "50" }
	{ event 6 107 }
	{ event 5001 107 "50" }
	{ event 4 109 }
	{ event 5001 109 "50" }
	{ event 5 111 }
	{ event 5001 111 "50" }
	{ event 6 113 }
	{ event 5001 113 "50" }
	{ event 4 115 }
	{ event 5001 115 "50" }
	{ event 5 117 }
	{ event 5001 117 "50" }
	{ event 6 119 }
	{ event 5001 119 "50" }
	{ event 4 121 }
	{ event 5001 121 "50" }
	{ event 5 123 }
	{ event 5001 123 "50" }
	{ event 6 125 }
	{ event 5001 125 "50" }
	{ event 4 127 }
	{ event 5001 127 "50" }
	{ event 5 129 }
	{ event 5001 129 "50" }
	{ event 6 131 }
	{ event 5001 131 "50" }
	{ event 4 133 }
	{ event 5001 133 "50" }
	{ event 5 135 }
	{ event 5001 135 "50" }
	{ event 6 137 }
	{ event 5001 137 "50" }
	{ event 4 139 }
	{ event 5001 139 "50" }
	{ event 5 141 }
	{ event 5001 141 "50" }
	{ event 6 143 }
	{ event 5001 143 "50" }
	{ event 4 145 }
	{ event 5001 145 "50" }
	{ event 5 147 }
	{ event 5001 147 "50" }
	{ event 6 149 }
	{ event 5001 149 "50" }
}
$sequence "cower" {
	"anims/UIMOB03_ATD_ED"
	fps 30
	rotate -90
	ACT_COWER 1
}
$sequence "combatidle" {
	"anims/UIMOB03_ATD_ST"
	fps 31
	rotate -90
	ACT_IDLE_ANGRY 1
}
$sequence "crouching_idle" {
	"anims/UIMOB03_ATD_ST"
	fps 31
	rotate -90
}
$sequence "crouching_wait" {
	"anims/UIMOB03_ATD_ED"
	fps 1
	loop
	rotate -90
	ACT_CROUCH 0
	frame 0 0
}
$sequence "throwgrenade" {
	"anims/UIMOB03_ATCD_LP"
	fps 60.50
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 7 61 }
}
$sequence "launchgrenade" {
	"anims/UIMOB03_ATCD_LP"
	fps 60.50
	rotate -90
	ACT_RANGE_ATTACK2 1
	{ event 8 61 }
}
$sequence "drop_grenade" {
	"anims/UIMOB03_IDA2"
	fps 227
	rotate -90
	ACT_SPECIAL_ATTACK1 1
	{ event 9 226 }
}
$sequence "crouching_mp5" {
	"anims/UIMOB03_ATD_LP"
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
	{ event 6 58 }
	{ event 5001 58 "50" }
}
$sequence "standing_mp5" {
	"anims/UIMOB03_ATD_LP"
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
	{ event 6 58 }
	{ event 5001 58 "50" }
}
$sequence "crouching_shotgun" {
	"anims/UIMOB03_ATD_LP"
	fps 60
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
$sequence "standing_shotgun" {
	"anims/UIMOB03_ATD_LP"
	fps 60
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 4 0 }
	{ event 5001 0 "51" }
}
