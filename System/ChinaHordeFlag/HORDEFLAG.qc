$modelname "ChinaHordeFlag.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/HordeFlag"
}
$texturegroup ConditionState
{
  { "pmnflaga.bmp" }
  { "zhca_pmnflag.bmp" }
}


$flags 0


$sequence "idle" {
	"anims/HordeFlag"
	fps 30
	rotate -90
	ACT_IDLE 1
}
