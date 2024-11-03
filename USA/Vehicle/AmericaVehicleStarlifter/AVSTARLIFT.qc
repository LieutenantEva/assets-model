$modelname "AmericaVehicleStarlifter.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$body studio "bodies/AVSTARLIFT"
$texturegroup ConditionState
{
  { "avstarlift.bmp" }
  { "avstarlift_d.bmp" }
}
$texrendermode avstarlift.bmp masked
$texrendermode avstarlift_d.bmp masked


$flags 768
$hbox 0 "CHASSIS" -95.50 -29.50 -0.47 124.20 39.30 74.00
$hbox 0 "CHASSIS" -226.00 -29.50 29.50 -95.50 39.30 74.00
$hbox 0 "HOUSECOLOR01" -17.00 -154.00 -6.00 37.00 154.30 6.00
$hbox 0 "HOUSECOLOR01" 105.00 -96.00 -6.00 158.00 95.30 6.00
$hbox 0 "HOUSECOLOR01" -211.00 -66.00 -2.00 -170.00 66.00 21.00
$hbox 0 "HOUSECOLOR01" -218.00 62.00 -14.00 -161.00 66.00 76.00
$hbox 0 "HOUSECOLOR01" -218.00 -66.00 -14.00 -161.00 -62.00 76.00
$hbox 1 "CHASSIS" 124.20 -29.50 -0.47 166.00 39.30 74.00
$hbox 2 "ENGINE01" -67.93 -20.54 -17.87 48.55 20.01 20.69
$hbox 2 "ENGINE02" -60.01 -19.95 -17.87 56.74 20.60 20.69
$hbox 3 "ENGINE03" -60.01 -19.49 -17.87 56.74 21.05 20.69
$hbox 3 "ENGINE04" -67.49 -21.25 -17.87 49.25 19.29 20.69
$controller 0 "ENGINE01ROTATIO" YR 0 90
$controller 0 "ENGINE02ROTATIO" YR 0 90
$controller 0 "ENGINE03ROTATIO" YR 0 90
$controller 0 "ENGINE04ROTATIO" YR 0 90
$controller 1 "CARGORAMP" YR -45 0


$sequence "DefaultConditionState" {
	"anims/AVSTARLIFT-rotorsup"
	fps 30
	loop
	rotate -90
	ACT_IDLE 1
}
