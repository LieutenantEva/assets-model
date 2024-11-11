$modelname "AmericaVehicleHumvee_Gibs.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AVHUMMER_D2"
	studio "bodies/AVHUMMER_D3"
}


$flags 512


$sequence "DefaultConditionState" {
	"bodies/AVHUMMER_D2"
	fps 1
	loop
	rotate -90
	ACT_IDLE 1
	frame 0 0
}
