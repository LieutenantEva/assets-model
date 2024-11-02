$modelname "AmericaInfantryBiohazardTech.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AITECH_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/AITECH_BioGun"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UITECH SPINE" -4.09 -5.62 -7.25 8.37 6.03 7.20
$hbox 2 "UITECH SPINE1" 0.00 -5.56 -8.52 9.99 6.21 8.28
$hbox 1 "UITECH HEAD" -1.00 -4.50 -4.00 12.00 5.00 4.00
$hbox 4 "UITECH L UPPERA" 0.00 -3.40 -3.30 13.84 2.57 2.67
$hbox 4 "UITECH L FOREAR" 0.00 -2.26 -2.01 10.49 1.79 2.31
$hbox 4 "UITECH L HAND" -1.00 -2.00 -4.00 7.00 2.00 3.00
$hbox 5 "UITECH R UPPERA" 0.00 -2.99 -2.57 14.92 3.03 3.29
$hbox 5 "UITECH R FOREAR" 0.00 -2.10 -2.57 10.95 1.67 1.77
$hbox 5 "UITECH R HAND" -1.00 -2.00 -3.00 8.00 2.00 4.00
$hbox 6 "UITECH L THIGH" 0.00 -5.09 -3.77 35.07 4.77 2.60
$hbox 6 "UITECH L FOOT" -1.00 -3.00 -4.00 4.00 12.60 3.00
$hbox 7 "UITECH R THIGH" 0.00 -4.32 -3.11 35.07 4.66 3.79
$hbox 7 "UITECH R FOOT" -1.00 -3.00 -2.50 4.00 12.60 4.00
$attachment 0 "BIOGUNFX" 0 0 0
$attachment 1 "UITECH R HAND" 0 0 0
$attachment 2 "UITECH HEAD" 0 0 0
$attachment 3 "BIOGUNFX" -38.20 0 0
$attachment 4 "BIOGUNFX" -64.40 0 0


// NORMAL STANDING
$sequence "DefaultConditionState STA" {
	"anims/STA"
	fps 21
	loop
	rotate -90
	ACT_IDLE 50
}
$sequence "DefaultConditionState IDA" {
	"anims/AITECH_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 3
}
$sequence "DefaultConditionState IDB" {
	"anims/IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// NORMAL ATTACK
$sequence "FIRING_A" {
	"anims/AITECH_ATA"
	fps 30
	loop
	rotate -90
}


// Running
$sequence "MOVING" {
	"anims/AITECH_WKA"
	fps 15
	loop
	rotate -90
}
$sequence "MOVING FIRING_A" {
	"anims/AITECH_WKB"
	fps 15
	loop
	rotate -90
	LX
}


// Death
$sequence "DYING DTA" {
	"anims/AITECH_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 69 }
	X
}
$sequence "DYING DTB" {
	"anims/AITECH_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 84 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/AITECH_ADTD1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/AITECH_ADTD2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/AITECH_ADTD3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/AITECH_CHA"
	fps 30
	loop
	rotate -90
}


// PARACHUTING ANIMATIONS
$sequence "FREEFALL" {
	"anims/AITECH_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/AITECH_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/AITECH_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/AITECH_PDN"
	fps 30
	rotate -90
	ACT_LAND 1
}


// !!!UNUSED!!!
$sequence "unused SUR" {
	"anims/AITECH_SUR"
	fps 30
	loop
	rotate -90
}
$sequence "unused SST" {
	"anims/AITECH_SST"
	fps 30
	loop
	rotate -90
}
$sequence "unused SWK" {
	"anims/AITECH_SWK"
	fps 30
	loop
	rotate -90
}


// Basic monster sequences
$sequence "run" {
	"anims/WKA"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 14 "common/npc_step2.wav" }
	{ event 1004 33 "common/npc_step3.wav" }
}
$sequence "walk" {
	"anims/WKA"
	fps 30
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 14 "common/npc_step2.wav" }
	{ event 1004 33 "common/npc_step3.wav" }
}
$sequence "reload" {
	"anims/AITECH_IDA"
	fps 87
	rotate -90
	ACT_RELOAD 1
}
$sequence "victorydance" {
	"anims/AITECH_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "shoot" {
	"anims/AITECH_ATA"
	fps 30
	rotate -90
	ACT_RANGE_ATTACK1 1
    { event 1 0 }
    { event 5001 0 "21" }
    { event 1 2 }
    { event 5001 2 "21" }
    { event 1 4 }
    { event 5001 4 "21" }
    { event 1 6 }
    { event 5001 6 "21" }
    { event 1 8 }
    { event 5001 8 "21" }
    { event 1 10 }
    { event 5001 10 "21" }
    { event 1 12 }
    { event 5001 12 "21" }
    { event 1 14 }
    { event 5001 14 "21" }
    { event 1 16 }
    { event 5001 16 "21" }
    { event 1 18 }
    { event 5001 18 "21" }
    { event 1 20 }
    { event 5001 20 "21" }
    { event 1 22 }
    { event 5001 22 "21" }
    { event 1 24 }
    { event 5001 24 "21" }
    { event 1 26 }
    { event 5001 26 "21" }
    { event 1 28 }
    { event 5001 28 "21" }
    { event 1 30 }
    { event 5001 30 "21" }
    { event 1 32 }
    { event 5001 32 "21" }
    { event 1 34 }
    { event 5001 34 "21" }
    { event 1 36 }
    { event 5001 36 "21" }
    { event 1 38 }
    { event 5001 38 "21" }
    { event 1 40 }
    { event 5001 40 "21" }
    { event 1 42 }
    { event 5001 42 "21" }
    { event 1 44 }
    { event 5001 44 "21" }
    { event 1 46 }
    { event 5001 46 "21" }
    { event 1 48 }
    { event 5001 48 "21" }
    { event 1 50 }
    { event 5001 50 "21" }
    { event 1 52 }
    { event 5001 52 "21" }
    { event 1 54 }
    { event 5001 54 "21" }
    { event 1 56 }
    { event 5001 56 "21" }
    { event 1 58 }
    { event 5001 58 "21" }
    { event 1 60 }
    { event 5001 60 "21" }
    { event 1 62 }
    { event 5001 62 "21" }
    { event 1 64 }
    { event 5001 64 "21" }
    { event 1 66 }
    { event 5001 66 "21" }
    { event 1 68 }
    { event 5001 68 "21" }
    { event 1 70 }
    { event 5001 70 "21" }
    { event 1 72 }
    { event 5001 72 "21" }
    { event 1 74 }
    { event 5001 74 "21" }
    { event 1 76 }
    { event 5001 76 "21" }
    { event 1 78 }
    { event 5001 78 "21" }
    { event 1 80 }
    { event 5001 80 "21" }
    { event 1 82 }
    { event 5001 82 "21" }
    { event 1 84 }
    { event 5001 84 "21" }
    { event 1 86 }
    { event 5001 86 "21" }
    { event 1 88 }
    { event 5001 88 "21" }
    { event 1 90 }
    { event 5001 90 "21" }
    { event 1 92 }
    { event 5001 92 "21" }
    { event 1 94 }
    { event 5001 94 "21" }
    { event 1 96 }
    { event 5001 96 "21" }
    { event 1 98 }
    { event 5001 98 "21" }
    { event 1 100 }
    { event 5001 100 "21" }
    { event 1 102 }
    { event 5001 102 "21" }
    { event 1 104 }
    { event 5001 104 "21" }
    { event 1 106 }
    { event 5001 106 "21" }
    { event 1 108 }
    { event 5001 108 "21" }
    { event 1 110 }
    { event 5001 110 "21" }
    { event 1 112 }
    { event 5001 112 "21" }
    { event 1 114 }
    { event 5001 114 "21" }
    { event 1 116 }
    { event 5001 116 "21" }
    { event 1 118 }
    { event 5001 118 "21" }
    { event 1 120 }
    { event 5001 120 "21" }
    { event 1 122 }
    { event 5001 122 "21" }
    { event 1 124 }
    { event 5001 124 "21" }
    { event 1 126 }
    { event 5001 126 "21" }
    { event 1 128 }
    { event 5001 128 "21" }
    { event 1 130 }
    { event 5001 130 "21" }
}
$sequence "flinch" {
	"anims/STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
