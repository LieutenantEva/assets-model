$modelname "VehicleGibs_AVScrap.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/AVScrap"
	studio "bodies/AVScrap2"
	studio "bodies/AVScrap3"
	studio "bodies/AVScrap4"
	studio "bodies/AVScrap5"
}


$flags 512
$hbox 0 "CHASSIS" -8.00 -8.00 0.00 8.00 8.00 3.00


$sequence "idle" {
	"bodies/AVScrap"
	fps 1
	loop
	rotate -90
	ACT_IDLE 1
	frame 0 0
}
