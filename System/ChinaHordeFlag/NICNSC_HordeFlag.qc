$modelname "ChinaInfantryRedguard_HordeFlag.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/NICNSC_HordeFlag"
}


$flags 0


$sequence "idle" {
	"anims/_idle"
	fps 30
	rotate -90
	ACT_IDLE 1
}
