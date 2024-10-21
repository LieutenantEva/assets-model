$modelname "AmericaVehicleChinook_CargoNet.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$body studio "AVCHINOOK_CargoNet"
$texrendermode avchinooknet01.bmp masked


$flags 768


// Carrying a full wobbly net of stuff
$sequence "CARRYING" {
	"anims\A"
	fps 30
	loop
	rotate -90
	ACT_IDLE 1
}


// Lowering an empty net, pulling up with stuff
$sequence "DOCKING" {
	"anims/AVCHINOOK_A1-reversed"
	fps 30
	rotate -90
}


// Lowering a full net, letting stuff fall out, and pulling up an empty net
$sequence "DOCKING CARRYING" {
	"anims/AVCHINOOK_A1"
	fps 30
	rotate -90
}
