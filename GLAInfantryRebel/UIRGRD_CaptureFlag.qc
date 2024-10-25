$modelname "GLAInfantryRebel_CaptureFlag.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$body studio "bodies/UIRGRD_CaptureFlag"


$flags 0


$sequence "pose" {
	"bodies/UIRGRD_CaptureFlag"
	fps 1
	loop
	rotate -90
	frame 0 0
}


$origin 8.035182 0 0


$sequence "idle_raise" {
	"anims\FDP2"
	fps 1
	loop
	rotate -90
	frame 0 0
}


$sequence "raise" {
	"anims\FDP2"
	fps 30
	rotate -90
}


$sequence "idle_lower" {
	"anims\FDP2-reversed"
	fps 1
	loop
	rotate -90
	frame 0 0
	ACT_IDLE 1
}


$sequence "lower" {
	"anims\FDP2-reversed"
	fps 30
	rotate -90
}


$origin 0 0 0


$sequence "positioned_idle_raise" {
	"anims\FDP2"
	fps 1
	loop
	rotate -90
	frame 0 0
}


$sequence "positioned_raise" {
	"anims\FDP2"
	fps 30
	rotate -90
}


$sequence "positioned_idle_lower" {
	"anims\FDP2-reversed"
	fps 1
	loop
	rotate -90
	frame 0 0
}


$sequence "positioned_lower" {
	"anims\FDP2-reversed"
	fps 30
	rotate -90
}
