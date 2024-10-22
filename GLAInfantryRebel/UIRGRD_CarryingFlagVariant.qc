$modelname "GLAInfantryRebel_CarryingFlagVariant.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/UIRGRD_F_SKN"
	studio "bodies/UIRGRDTOXF_SKN"
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


$sequence "pose" {
	"bodies/UIRGRD_F_SKN"
	fps 30
	loop
	rotate -90
	ACT_IDLE 1
}


// ------- Bldg-capture
$sequence "UNPACKING" {
	"anims\UIRGRD_F_FDP1"
	fps 30
	loop
	rotate -90
}
$sequence "RAISING_FLAG" {
	"anims\UIRGRD_F_FDP2"
	fps 30
	loop
	rotate -90
}
$sequence "PACKING" {
	"anims\UIRGRD_F_FDPB1-reversed"
	fps 30
	loop
	rotate -90
}
$sequence "TRANS_Raising TRANS_Packing" {
	"anims\UIRGRD_F_FDPB2-reversed"
	fps 30
	loop
	rotate -90
}
