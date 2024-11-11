$modelname "AmericaVehicleHumvee_Hulk.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AVHUMMER_D1"
}
$texturegroup ConditionState
{
  { "avhummer_d.bmp" }
  { "avhummer_d1.bmp" }
}


$flags 512
$hbox 0 "CHASSIS" -54.33 -34.00 18.00 67.14 34.00 42.00
$hbox 0 "CHASSIS" -44.00 -34.00 42.00 31.00 34.00 55.00


$sequence "DefaultConditionState" {
	"bodies/AVHUMMER_D1"
	fps 1
	loop
	rotate -90
	ACT_IDLE 1
	frame 0 0
}
