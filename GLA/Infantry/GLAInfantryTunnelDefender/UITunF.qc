$modelname "GLAInfantryTunnelDefender.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UITunF_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/UITunF_MissileLauncher"
	blank
}
$bodygroup "Toxin Tank" {
	blank
	studio "bodies/UITunF_ToxinTank"
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UITunF SPINE" -4.08 -6.44 -9.50 9.00 6.08 9.50
$hbox 2 "UITunF SPINE1" 0.00 -6.00 -9.50 9.56 6.00 9.50
$hbox 1 "UITunF HEAD" -1.84 -5.72 -4.91 11.69 6.34 5.72
$hbox 4 "UITUNF L UPPERA" 0.00 -4.41 -3.07 14.31 2.87 2.34
$hbox 4 "UITUNF L FOREAR" 0.00 -3.80 -3.20 10.00 3.30 2.20
$hbox 5 "UITUNF R UPPERA" 0.00 -4.26 -2.39 16.35 2.46 3.39
$hbox 5 "UITUNF R FOREAR" 0.00 -4.50 -2.50 10.00 3.00 3.50
$hbox 6 "UITUNF L THIGH" 0.00 -5.37 -3.57 35.91 4.65 4.20
$hbox 6 "UITUNF L FOOT" -0.22 -2.72 -1.50 4.10 10.00 2.87
$hbox 7 "UITUNF R THIGH" 0.00 -5.37 -2.79 35.91 4.73 4.37
$hbox 7 "UITUNF R FOOT" -0.21 -2.22 -1.58 4.10 10.00 2.81
$attachment 0 "MUZZLEFX01" 0 0 0
$attachment 1 "UITunF R HAND" 0 0 0
$attachment 2 "UITunF HEAD" 0 0 0
$attachment 3 "EXHAUST01" 0 0 0


// Idle
$sequence "DefaultConditionState STA" {
	"anims/UITunF_STA"
	fps 20
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/UITunF_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 4
}
$sequence "DefaultConditionState IDB" {
	"anims/UITunF_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDC" {
	"anims/UITunF_IDC"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Running
$sequence "MOVING RNA" {
	"anims/UITunF_RNA"
	fps 15
	loop
	rotate -90
}
$sequence "MOVING RNB" {
	"anims/UITunF_RNB"
	fps 25
	loop
	rotate -90
}


// Walking
$sequence "MOVING WKA" {
	"anims/UITunF_WKA"
	fps 16
	loop
	rotate -90
}
$sequence "MOVING WKB" {
	"anims/UITunF_WKB"
	fps 30
	loop
	rotate -90
}
$sequence "MOVING WKC" {
	"anims/UITunF_WKC"
	fps 30
	loop
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/UITunF_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 22 }
	X
}
$sequence "DYING DTB" {
	"anims/UITunF_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 103 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing ADTA1" {
	"anims/UITunF_ADTA1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING ADTA2" {
	"anims/UITunF_ADTA2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING ADTA3" {
	"anims/UITunF_ADTA3"
	fps 30
	rotate -90
}
$sequence "TRANS_Dying TRANS_Flailing ADTE1" {
	"anims/UITunF_ADTE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING ADTE2" {
	"anims/UITunF_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING ADTE3" {
	"anims/UITunF_ADTE3"
	fps 30
	rotate -90
}
$sequence "TRANS_Dying TRANS_Flailing ADTF1" {
	"anims/UITunF_ADTF1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING ADTF2" {
	"anims/UITunF_ADTF2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING ADTF3" {
	"anims/UITunF_ADTF3"
	fps 30
	rotate -90
}


// Firing
$sequence "FIRING_A" {
	"anims/UITunF_ATA"
	fps 30
	loop
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/UITunF_CHA"
	fps 30
	loop
	rotate -90
}


// !!!UNUSED!!!
$sequence "unused SUR" {
	"anims/UITunF_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/UITunF_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SWK" {
	"anims/UITunF_SWK"
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
	{ event 1004 4 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
}
$sequence "run2" {
	"anims/_run2"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 10 "common/npc_step2.wav" }
	{ event 1004 21 "common/npc_step4.wav" }
	{ event 1004 34 "common/npc_step2.wav" }
	{ event 1004 46 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_walk"
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 4 "common/npc_step2.wav" }
	{ event 1004 19 "common/npc_step4.wav" }
}
$sequence "walk2" {
	"anims/_walk2"
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 10 "common/npc_step2.wav" }
	{ event 1004 27 "common/npc_step4.wav" }
	{ event 1004 48 "common/npc_step2.wav" }
	{ event 1004 72 "common/npc_step4.wav" }
	{ event 1004 98 "common/npc_step2.wav" }
	{ event 1004 121 "common/npc_step4.wav" }
}
$sequence "walk3" {
	"anims/_walk3"
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 16 "common/npc_step4.wav" }
	{ event 1004 31 "common/npc_step2.wav" }
	{ event 1004 46 "common/npc_step4.wav" }
	{ event 1004 59 "common/npc_step2.wav" }
	{ event 1004 77 "common/npc_step4.wav" }
	{ event 1004 91 "common/npc_step2.wav" }
}
$sequence "reload" {
	"anims/UITunF_IDC"
	fps 534
	rotate -90
	ACT_RELOAD 1
}
$sequence "shoot1" {
	"anims/UITunF_ATA"
	fps 51
	rotate -90
	ACT_RANGE_ATTACK1 1
	{ event 1 0 }
	{ event 5001 0 "101" }
	{ event 5031 0 "101" }
}
$sequence "victorydance" {
	"anims/UITunF_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "flinch" {
	"anims/UITunF_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/UITunF_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/UITunF_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/UITunF_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/UITunF_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/UITunF_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
