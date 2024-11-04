$modelname "ColormappedDeathInfantry_Toxic.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/toxic"
}


$flags 0
$hbox 0 "CIBURN SPINE" -4.09 -6.12 -8.45 17.79 6.17 8.45
$hbox 0 "CIBURN HEAD" 0.00 -4.17 -3.52 12.15 3.35 3.30
$hbox 0 "CIBURN L UPPERA" 0.00 -3.35 -2.64 22.10 2.15 2.36
$hbox 0 "CIBURN L HAND" -1.42 -0.99 -3.46 6.98 1.40 3.26
$hbox 0 "CIBURN R UPPERA" 0.00 -3.62 -2.38 22.96 2.36 2.35
$hbox 0 "CIBURN R HAND" -0.77 -1.31 -3.12 7.17 1.38 2.73
$hbox 0 "CIBURN L THIGH" 0.00 -3.82 -4.13 35.91 4.72 3.13
$hbox 0 "CIBURN L FOOT" -0.66 -2.88 -3.48 4.16 11.46 3.09
$hbox 0 "CIBURN R THIGH" 0.00 -3.76 -3.28 35.92 4.63 4.04
$hbox 0 "CIBURN R FOOT" -0.55 -2.89 -2.76 4.16 11.48 3.04


$sequence "die" {
	"anims/CITOXDTH_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	X
}
