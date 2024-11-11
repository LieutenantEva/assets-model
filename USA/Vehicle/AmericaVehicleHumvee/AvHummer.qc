$modelname "AmericaVehicleHumvee.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AVHUMMER_Body"
	studio "bodies/AVHUMMER_Body_Damaged"
}
$bodygroup "Weapon 1" {
	blank
	studio "bodies/AVHUMMER_Gun1"
	studio "bodies/AVHUMMER_Gun1_Damaged"
}
$bodygroup "Weapon 2" {
	blank
	studio "bodies/AVHUMMER_Gun2"
	studio "bodies/AVHUMMER_Gun2_Damaged"
}


$flags 512
$hbox 0 "CHASSIS" -54.33 -34.00 18.00 67.14 34.00 42.00
$hbox 0 "HOUSECOLOR01" 67.00 -19.00 20.00 72.00 18.00 28.00
$hbox 0 "CHASSIS" -44.00 -34.00 42.00 31.00 34.00 55.00
$hbox 0 "TIRE01" -15.00 -7.00 -15.00 15.00 7.00 15.00
$hbox 0 "TIRE02" -15.00 -7.00 -15.00 15.00 7.00 15.00
$hbox 0 "TIRE03" -15.00 -7.00 -15.00 15.00 7.00 15.00
$hbox 0 "TIRE04" -15.00 -7.00 -15.00 15.00 7.00 15.00
$hbox 0 "TURRET" -15.00 -15.00 0.00 50.00 15.00 13.00
$hbox 0 "TURRETUP01" -17.00 -21.00 0.00 50.00 14.00 31.00
$attachment 0 "MUZZLEFX01" 0 0 0
$attachment 1 "MUZZLEFXUP01" 0 0 0
$attachment 2 "MUZZLEFXUP01" -7.862400 9.176300 13.497950
$controller 0 "TURRET" ZR 0 360
$controller 1 "TURRETUP01" ZR 0 360
$controller 4 "TIRE01" YR 0 360
$controller 4 "TIRE02" YR 0 360
$controller 4 "TIRE03" YR 0 360
$controller 4 "TIRE04" YR 0 360


$sequence "DefaultConditionState" {
	"bodies/AVHUMMER_Body"
	fps 1
	loop
	rotate -90
	ACT_IDLE 1
	frame 0 0
}
$sequence "REALLYDAMAGED" {
	"bodies/AVHUMMER_Body_Damaged"
	fps 1
	loop
	rotate -90
	frame 0 0
}
