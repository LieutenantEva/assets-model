$modelname "ColormappedDeathInfantry_Toxic_Terrorist.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/toxic_terrorist"
}


$flags 0
$hbox 0 "UITRST PELVIS" -3.64 -10.37 -7.27 4.10 6.73 5.39
$hbox 0 "UITRST SPINE1" -10.38 -12.50 -9.74 13.14 12.98 7.86
$hbox 0 "UITRST HEAD" 0.00 -5.49 -4.54 12.43 6.02 4.30
$hbox 0 "UITRST L UPPERA" 0.00 -3.53 -2.97 15.36 2.90 2.94
$hbox 0 "UITRST L FOREAR" 0.00 -2.37 -0.79 11.23 1.74 1.84
$hbox 0 "UITRST L HAND" 0.00 -1.18 -6.37 6.78 0.57 3.13
$hbox 0 "UITRST R UPPERA" 0.00 -3.72 -2.74 15.72 2.65 2.64
$hbox 0 "UITRST R FOREAR" 0.00 -5.76 -1.29 13.27 2.12 2.23
$hbox 0 "UITRST R HAND" 0.00 -1.02 -2.64 6.62 0.35 4.05
$hbox 0 "UITRST L THIGH" 0.00 -3.20 -4.32 34.92 3.92 3.82
$hbox 0 "UITRST L FOOT" -0.93 -4.01 -3.49 4.10 12.56 3.76
$hbox 0 "UITRST R THIGH" 0.00 -3.17 -2.81 34.91 4.00 4.60
$hbox 0 "UITRST R FOOT" -0.07 -3.51 -3.86 4.10 12.59 3.87


$sequence "die" {
	"anims/UITRST_DGRN"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
}
