$modelname "VehicleGibs_gxmammoth_d.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/gxmammoth_d01"
	studio "bodies/gxmammoth_d02"
	studio "bodies/gxmammoth_d03"
	studio "bodies/gxmammoth_d04"
	studio "bodies/gxmammoth_d05"
	studio "bodies/gxmammoth_d06"
	studio "bodies/gxmammoth_d07"
	studio "bodies/gxmammoth_d08"
	studio "bodies/gxmammoth_d09"
	studio "bodies/gxmammoth_d10"
	studio "bodies/gxmammoth_d11"
	studio "bodies/gxmammoth_d12"
}


$flags 512
$hbox 0 "root" -8.00 -8.00 -8.00 8.00 8.00 8.00


$sequence "idle" {
	"bodies/gxmammoth_d01"
	fps 1
	loop
	rotate -90
	ACT_IDLE 1
	frame 0 0
}
