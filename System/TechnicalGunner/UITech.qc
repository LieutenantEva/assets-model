$modelname "TechnicalGunner.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UITech_Body"
	blank
}
$bodygroup "Mount Gun Pole" {
	studio "bodies/UITech_GunPole"
	blank
}
$bodygroup "Mount Gun" {
	studio "bodies/UITECH_MachineGun"
	studio "bodies/UITech_CannonGun"
	studio "bodies/UITech_RocketGun"
	blank
}


$flags 0
$eyeposition 0 0 73
$hbox 3 "UITECH" -6.780000 -8.880000 -2.890000 4.700000 8.710000 12.450000
$hbox 2 "UITECH SPINE1" 0.00 -6.33 -9.24 10.70 6.38 9.10
$hbox 1 "UITECH HEAD" 0.00 -4.36 -3.67 12.44 6.27 4.91
$hbox 4 "UITECH L UPPERA" 0.00 -4.34 -2.87 22.76 2.92 2.48
$hbox 4 "UITECH L HAND" -0.21 -0.99 -2.52 6.78 1.67 2.90
$hbox 5 "UITECH R UPPERA" 0.00 -4.20 -2.37 22.73 2.50 3.40
$hbox 5 "UITECH R HAND" 0.00 -0.66 -2.93 6.94 1.85 2.90
$hbox 6 "UITECH L THIGH" 0.00 -3.44 -3.67 35.91 3.58 4.11
$hbox 6 "UITECH L FOOT" -0.67 -2.82 -2.15 3.20 11.47 4.39
$hbox 7 "UITECH R THIGH" 0.00 -3.29 -2.89 35.91 4.69 4.27
$hbox 7 "UITECH R FOOT" -0.77 -2.33 -3.64 3.19 11.53 3.21
$attachment 0 "MUZZLE01" 0 0 0
$attachment 1 "MUZZLE02" 0 0 0
$attachment 2 "MUZZLE03" 0 0 0
$controller 0 "DUM-TURMANMVR" ZR 0 360
$controller 1 "DUM-TUR" YR 60 -60


// Turret sequences //
$sequence "idle_off" {
	"anims/UITech_STA"
	fps 30
	loop
	rotate 90
}
$sequence "fire" {
	"anims/UITech_ATA"
	fps 30
	rotate 90
	ACT_RANGE_ATTACK1 1
	{ event 5001 0 "21" }
	{ event 5001 2 "21" }
	{ event 5001 4 "31" }
	{ event 5001 6 "21" }
	{ event 5001 8 "21" }
	{ event 5001 10 "31" }
	{ event 5001 12 "21" }
	{ event 5001 14 "21" }
	{ event 5001 16 "31" }
	{ event 5001 18 "21" }
	{ event 5001 20 "21" }
	{ event 5001 22 "31" }
	{ event 5001 24 "21" }
	{ event 5001 26 "21" }
	{ event 5001 28 "31" }
	{ event 5001 30 "21" }
	{ event 5001 32 "21" }
	{ event 5001 34 "31" }
	{ event 5001 36 "21" }
	{ event 5001 38 "21" }
	{ event 5001 40 "31" }
	{ event 5001 42 "21" }
	{ event 5001 44 "21" }
	{ event 5001 46 "31" }
	{ event 5001 48 "21" }
	{ event 5001 50 "21" }
	{ event 5001 52 "31" }
	{ event 5001 54 "21" }
	{ event 5001 56 "21" }
	{ event 5001 58 "31" }
	{ event 5001 60 "21" }
	{ event 5001 62 "21" }
	{ event 5001 64 "31" }
	{ event 5001 66 "21" }
	{ event 5001 68 "21" }
	{ event 5001 70 "31" }
	{ event 5001 72 "21" }
	{ event 5001 74 "21" }
	{ event 5001 76 "31" }
	{ event 5001 78 "21" }
	{ event 5001 80 "21" }
	{ event 5001 82 "31" }
	{ event 5001 84 "21" }
	{ event 5001 86 "21" }
	{ event 5001 88 "31" }
}
$sequence "spin" {
	"anims/UITech_MVB"
	fps 30
	loop
	rotate 90
	ACT_COMBAT_IDLE 1
}
$sequence "deploy" {
	"anims/UITech_IDA"
	fps 101
	rotate 90
	ACT_ARM 1
}
$sequence "retire" {
	"anims/UITech_IDB"
	fps 92.18
	rotate 90
	ACT_DISARM 1
}
$sequence "die" {
	"anims/DTC3"
	fps 30
	rotate 90
	ACT_DIESIMPLE 1
	X
}
$sequence "left" {
	"anims/UITech_TNA"
	fps 30
	loop
	rotate 90
	ACT_TURN_LEFT 1
}
$sequence "right" {
	"anims/UITech_TNC"
	fps 30
	loop
	rotate 90
	ACT_TURN_RIGHT 1
}
// End of turret sequences //


// Idle
$sequence "DefaultConditionState STA" {
	"anims/UITech_STA"
	fps 30
	loop
	rotate 90
	ACT_IDLE 7
}
$sequence "DefaultConditionState IDA" {
	"anims/UITech_IDA"
	fps 30
	loop
	rotate 90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/UITech_IDB"
	fps 30
	loop
	rotate 90
	ACT_IDLE 2
}


// Move
$sequence "MOVING" {
	"anims/UITech_MVB"
	fps 30
	loop
	rotate 90
}


// Rotate
$sequence "TURRET_ROTATE" {
	"anims/UITech_TNA"
	fps 30
	loop
	rotate 90
}


// Attack
$sequence "FIRING_A" {
	"anims/UITech_ATA"
	fps 30
	loop
	rotate 90
}


// Death
$sequence "TRANS_Dying TRANS_Flailing DTA1" {
	"anims/DTA1"
	fps 30
	rotate 90
}
$sequence "DYING EXPLODED_FLAILING DTA2" {
	"anims/DTA2"
	fps 30
	loop
	rotate 90
}
$sequence "DYING EXPLODED_BOUNCING DTA3" {
	"anims/DTA3"
	fps 30
	rotate 90
}
$sequence "TRANS_Dying TRANS_Flailing DTB1" {
	"anims/DTB1"
	fps 30
	rotate 90
}
$sequence "DYING EXPLODED_FLAILING DTB2" {
	"anims/DTB2"
	fps 30
	loop
	rotate 90
}
$sequence "DYING EXPLODED_BOUNCING DTB3" {
	"anims/DTB3"
	fps 30
	rotate 90
}
$sequence "TRANS_Dying TRANS_Flailing DTC1" {
	"anims/DTC1"
	fps 30
	rotate 90
}
$sequence "DYING EXPLODED_FLAILING DTC2" {
	"anims/DTC2"
	fps 30
	loop
	rotate 90
}
$sequence "DYING EXPLODED_BOUNCING DTC3" {
	"anims/DTC3"
	fps 30
	rotate 90
}


// !!!UNUSED!!!
$sequence "unused MVA" {
	"anims/UITech_MVA"
	fps 30
	loop
	rotate 90
}
$sequence "unused TNB" {
	"anims/UITech_TNB"
	fps 30
	loop
	rotate 90
}
$sequence "unused TNC" {
	"anims/UITech_TNC"
	fps 30
	loop
	rotate 90
}
$sequence "unused TND" {
	"anims/UITech_TND"
	fps 30
	loop
	rotate 90
}
