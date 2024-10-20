$modelname "AmericaInfantryRanger_CaptureFlag.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$body studio "AIRNGR_CaptureFlag"


$flags 0


$sequence "idle_raise" {
	"anims\FDP2"
	fps 1 rotate -90
	frame 0 0
}


$sequence "raise" {
	"anims\FDP2"
	fps 30 rotate -90
}


$sequence "idle_lower" {
	"anims\FDP2-reversed"
	fps 1 rotate -90
	frame 0 0
}


$sequence "lower" {
	"anims\FDP2-reversed"
	fps 30 rotate -90
}
