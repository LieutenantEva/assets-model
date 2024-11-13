$modelname "ChinaInfantryAgent.mdl"
$cd "."
$cdtexture "./textures"
$cliptotextures
$scale 5.0


$keepallbones
$bodygroup "body" {
	studio "bodies/NIAGNT_Body"
}
$bodygroup "Primary Weapon" {
	studio "bodies/NIAGNT_WireCutter"
	blank
}
$bodygroup "Secondary Weapon" {
	studio "bodies/NIAGNT_Bribe"
	blank
}
$texrendermode z_niagentcash.bmp masked


$flags 0
$eyeposition 0 0 73
$hbox 3 "NIAGNT SPINE" -6.00 -6.00 -9.00 8.00 6.00 9.00
$hbox 2 "NIAGNT SPINE1" -2.00 -6.00 -9.00 10.00 6.00 9.00
$hbox 1 "NIAGNT HEAD" -2.00 -5.00 -4.00 11.00 5.00 4.00
$hbox 4 "NIAGNT L UPPERA" -1.00 -4.00 -3.00 15.00 4.00 3.00
$hbox 4 "NIAGNT L FOREAR" 0.00 -4.00 -3.00 11.00 4.00 3.00
$hbox 4 "NIAGNT L HAND" -1.00 -2.00 -4.00 7.00 2.00 3.00
$hbox 5 "NIAGNT R UPPERA" -1.00 -4.00 -3.00 15.00 4.00 3.00
$hbox 5 "NIAGNT R FOREAR" 0.00 -4.00 -3.00 11.00 4.00 3.00
$hbox 5 "NIAGNT R HAND" -1.00 -2.00 -3.00 8.00 2.00 4.00
$hbox 6 "NIAGNT L THIGH" 0.00 -5.00 -4.00 36.00 5.00 3.00
$hbox 6 "NIAGNT L FOOT" -1.00 -3.00 -4.00 4.00 13.00 3.00
$hbox 7 "NIAGNT R THIGH" 0.00 -5.00 -3.00 36.00 5.00 4.00
$hbox 7 "NIAGNT R FOOT" -1.00 -3.00 -3.00 4.00 13.00 4.00


$sequence "pose" {
	"bodies/NIAGNT_Body"
	fps 1
	loop
	rotate -90
	frame 0 0
}


// Idle
$sequence "DefaultConditionState STA" {
	"anims/NIAGNT_STA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 26
}
$sequence "DefaultConditionState IDA" {
	"anims/NIAGNT_IDA"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}
$sequence "DefaultConditionState IDB" {
	"anims/NIAGNT_IDB"
	fps 30
	loop
	rotate -90
	ACT_IDLE 2
}


// Attack
$sequence "FIRING_A" {
	"anims/NIAGNT_ATA"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringA TRANS_Stand" {
	"anims/NIAGNT_ATA2"
	fps 30
	rotate -90
}
$sequence "FIRING_B" {
	"anims/NIAGNT_ATB"
	fps 30
	rotate -90
}
$sequence "TRANS_FiringB TRANS_Stand" {
	"anims/NIAGNT_ATB2"
	fps 30
	rotate -90
}


// Run
$sequence "MOVING" {
	"anims/NIAGNT_RNA"
	fps 30
	loop
	rotate -90
}


// Death
$sequence "DYING DTA" {
	"anims/NIAGNT_DTA"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 62 }
	X
}
$sequence "DYING DTB" {
	"anims/NIAGNT_DTB"
	fps 30
	rotate -90
	ACT_DIESIMPLE 1
	{ event 2001 37 }
	X
}
$sequence "TRANS_Dying TRANS_Flailing" {
	"anims/NIAGNT_ADTE1"
	fps 30
	rotate -90
}
$sequence "DYING EXPLODED_FLAILING" {
	"anims/NIAGNT_ADTE2"
	fps 30
	loop
	rotate -90
}
$sequence "DYING EXPLODED_BOUNCING" {
	"anims/NIAGNT_ADTE3"
	fps 30
	rotate -90
}


// Cheering
$sequence "SPECIAL_CHEERING" {
	"anims/NIAGNT_CHA"
	fps 30
	loop
	rotate -90
}


// Parachute
$sequence "FREEFALL" {
	"anims/NIAGNT_PFL"
	fps 30
	rotate -90
}
$sequence "PARACHUTING" {
	"anims/NIAGNT_PHG"
	fps 30
	loop
	rotate -90
	ACT_GLIDE 1
}
$sequence "TRANS_Falling TRANS_Chute" {
	"anims/NIAGNT_POP"
	fps 30
	rotate -90
	ACT_HOVER 1
}
$sequence "TRANS_Chute TRANS_Stand" {
	"anims/NIAGNT_PTD"
	fps 30
	rotate -90
	ACT_LAND 1
}


// Prisoner of War
$sequence "surrender_start" {
	"anims/NIAGNT_SUR"
	fps 30
	rotate -90
}
$sequence "surrender_idle" {
	"anims/NIAGNT_SST"
	fps 30
	loop
	rotate -90
}


// Zombie sequences
$sequence "run" {
	"anims/_run"
	fps 30
	loop
	rotate -90
	ACT_RUN 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 28 "common/npc_step2.wav" }
	{ event 1004 42 "common/npc_step4.wav" }
}
$sequence "walk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 28 "common/npc_step2.wav" }
	{ event 1004 42 "common/npc_step4.wav" }
}
$sequence "limprun" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_RUN_HURT 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 28 "common/npc_step2.wav" }
	{ event 1004 42 "common/npc_step4.wav" }
}
$sequence "limpwalk" {
	"anims/_run"
	fps 15
	loop
	rotate -90
	ACT_WALK_HURT 1
	LX
	{ event 1004 0 "common/npc_step2.wav" }
	{ event 1004 14 "common/npc_step4.wav" }
	{ event 1004 28 "common/npc_step2.wav" }
	{ event 1004 42 "common/npc_step4.wav" }
}
$sequence "reload" {
	"anims/NIAGNT_STA"
	fps 1
	rotate -90
	ACT_RELOAD 1
	frame 0 0
}
$sequence "victorydance" {
	"anims/NIAGNT_CHA"
	fps 30
	rotate -90
	ACT_VICTORY_DANCE 1
}
$sequence "wirecutting" {
	"anims/_attacka"
	fps 30
	rotate -90
	ACT_MELEE_ATTACK1 1
	{ event 1 75 }
	{ event 2 116 }
	{ event 1 162 }
}
$sequence "bribing" {
	"anims/_attackb"
	fps 30
	rotate -90
	ACT_MELEE_ATTACK1 1
    { event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
    { event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
	{ event 3 212 }
}
$sequence "flinch" {
	"anims/NIAGNT_STA"
	fps 30
	rotate -90
	ACT_SMALL_FLINCH 1
	frame 0 0
}
$sequence "bigflinch" {
	"anims/NIAGNT_STA"
	fps 30
	rotate -90
	ACT_BIG_FLINCH 1
	frame 0 0
}
$sequence "laflinch" {
	"anims/NIAGNT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTARM 1
	frame 0 0
}
$sequence "raflinch" {
	"anims/NIAGNT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTARM 1
	frame 0 0
}
$sequence "llflinch" {
	"anims/NIAGNT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_LEFTLEG 1
	frame 0 0
}
$sequence "rlflinch" {
	"anims/NIAGNT_STA"
	fps 30
	rotate -90
	ACT_FLINCH_RIGHTLEG 1
	frame 0 0
}
