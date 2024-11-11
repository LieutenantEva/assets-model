$modelname "ChinaHordeFlag.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/NICNSC_HordeFlag"
}
$texturegroup ConditionState
{
  { "zhca_pmnflag.bmp" }
  { "pmnflaga.bmp" }
}


$flags 0


$sequence "idle" {
	"anims/_idle"
	fps 30
	rotate -90
	ACT_IDLE 1
}
