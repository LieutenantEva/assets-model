$modelname "ColormappedDeathInfantry_Flaming.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/flaming"
}


$flags 0
$hbox 0 "CIBURN SPINE" -4.09 -4.88 -5.54 8.37 4.07 5.19
$hbox 0 "CIBURN SPINE1" 0.00 -6.13 -7.58 9.17 6.05 7.97
$hbox 0 "CIBURN HEAD" -1.36 -4.13 -3.52 12.15 4.92 3.30
$hbox 0 "CIBURN L UPPERA" 0.00 -3.35 -2.64 14.10 2.15 2.36
$hbox 0 "CIBURN L FOREAR" 0.00 -1.06 -1.08 10.49 1.30 1.29
$hbox 0 "CIBURN R UPPERA" 0.00 -3.62 -2.37 13.96 2.36 2.35
$hbox 0 "CIBURN R FOREAR" 0.00 -0.96 -1.36 10.87 2.13 1.26
$hbox 0 "CIBURN L THIGH" 0.00 -3.82 -4.13 35.15 4.72 3.13
$hbox 0 "CIBURN L FOOT" -0.66 -2.88 -3.48 4.10 5.72 1.76
$hbox 0 "CIBURN R THIGH" 0.00 -3.76 -3.28 35.15 4.63 4.04
$hbox 0 "CIBURN R FOOT" -0.55 -2.89 -1.54 4.10 5.72 3.04


$sequence "idle" {
	"anims/CIBURN_idle"
	fps 30
	loop
	rotate -90
	ACT_IDLE 1
}


$sequence "run" {
	"anims/CIBURN_run"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 6 "common/npc_step2.wav" }
	{ event 1004 16 "common/npc_step4.wav" }
	{ event 1004 26 "common/npc_step2.wav" }
	{ event 1004 36 "common/npc_step4.wav" }
	{ event 1004 46 "common/npc_step2.wav" }
	{ event 1004 61 "common/npc_step4.wav" }
}


$sequence "die" {
	"anims/CIBURN_FLA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	X
}
