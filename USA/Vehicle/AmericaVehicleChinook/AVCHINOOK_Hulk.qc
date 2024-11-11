$modelname "AmericaVehicleChinook_Hulk.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$body studio "bodies/AVCHINOOK_D1"
$texrendermode avcomanche_p.bmp masked


$flags 768
$hbox 0 "CHASSIS" -104.58 -31.70 -24.92 78.00 8.34 24.92
$hbox 0 "CHASSIS" 78.00 -31.70 -17.65 100.12 -11.50 17.65
$hbox 1 "CHASSIS" 78.00 -11.50 -17.65 91.80 2.80 17.65
$hbox 2 "CHASSIS" -50.79 34.40 -21.9 -104.58 8.34 21.60
$hbox 2 "PROPELLER02" -7.54 -7.90 -0.00 7.57 6.48 4.00
$hbox 3 "CHASSIS" 74.80 23.98 -11.00 41.10 5.00 11.00
$hbox 3 "PROPELLER01" -7.67 -6.54 -0.26 7.66 8.05 4.26


$sequence "DefaultConditionState" {
	"bodies/AVCHINOOK_D1"
	fps 1
	loop
	rotate -90
	ACT_IDLE 1
	frame 0 0
}
