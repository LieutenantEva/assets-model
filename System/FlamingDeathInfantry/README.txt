Object FlamingInfantry

  ; *** ART Parameters ***
  Draw = W3DModelDraw ModuleTag_01

    DefaultConditionState
      Model = CIBURN_SKN
      Animation = CIBURN_SKL.CIBURN_RNA 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      ParticleSysBone = Bone_FX1 FireInfantrySmall
    End

    ConditionState = DYING
      Animation = CIBURN_SKL.CIBURN_FLA
      AnimationMode = ONCE
      Flags = START_FRAME_FIRST ; anything not listed will get the default above.  Random would be bad.
      ParticleSysBone = Bone_FX1 FireInfantrySmallSub1 ; 0 - 55 (frames and therefore %, but need to tweak msec duration)
      ParticleSysBone = Bone_FX2 FireInfantrySmallSub2 ; 56 - 122
      ParticleSysBone = Bone_FX9 FireInfantrySmallSub3 ; 123 - 134
      ParticleSysBone = Bone_FX3 FireInfantrySmallSub4 ; 135 - 179
      ParticleSysBone = Bone_FX5 FireInfantrySmallSub5 ; 180 - 185
      ParticleSysBone = Bone_FX6 FireInfantrySmallSub6 ; 186 - 235
      ParticleSysBone = Bone_FX5 FireInfantrySmallSub7 ; 236 - 243
      ParticleSysBone = Bone_FX8 FireInfantrySmallSub8 ; 244 - 246
      ParticleSysBone = Bone_FX7 FireInfantrySmallSub9 ; 247 - 292
      ParticleSysBone = Bone_FX8 FireInfantrySmallSub10; 293 - 388
      AnimationSpeedFactorRange = 0.85 1.15
    End  
  End

  ; ***DESIGN parameters ***
  Side = Civilian
  EditorSorting = SYSTEM
  TransportSlotCount = 1
  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = None
  End
  VisionRange = 150
  DisplayName = OBJECT:FlamingInfantry

  ; *** AUDIO Parameters ***

  ; *** ENGINEERING Parameters ***
  RadarPriority = NOT_ON_RADAR
  KindOf = CAN_CAST_REFLECTIONS INFANTRY

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 50.0
    InitialHealth   = 50.0
  End

  Behavior = WanderAIUpdate ModuleTag_03
  End
  Locomotor = SET_NORMAL PanicHumanLocomotor

  Behavior = PhysicsBehavior ModuleTag_04
    Mass = 5.0
  End

  Behavior = LifetimeUpdate ModuleTag_05
    MinLifetime = 3000 ; randomness for these means going out of sync of the animation and particles
    MaxLifetime = 3000
  End

  Behavior = SlowDeathBehavior ModuleTag_06
    SinkDelay = 4500
    SinkRate = 0.5     ; in Dist/Sec
    DestructionDelay = 9500
  End

 
  Behavior = SquishCollide ModuleTag_07
    ;nothing
  End


  Behavior = FXListDie ModuleTag_08
    DeathTypes = ALL -CRUSHED -SPLATTED
    DeathFX = FX_GIDie
  End
  Behavior = FXListDie ModuleTag_09
    DeathTypes = NONE +CRUSHED +SPLATTED
    DeathFX = FX_GIDieCrushed
  End

  Geometry = CYLINDER
  GeometryMajorRadius = 3.0
  GeometryMinorRadius = 3.0
  GeometryHeight = 12.0
  GeometryIsSmall = Yes

End
