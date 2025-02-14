Object ToxicInfantry
  ; *** ART Parameters ***
  Draw = W3DModelDraw ModuleTag_01

    DefaultConditionState
      Model = CITOXDTH_SKN
      Animation = CITOXDTH_SKL.CITOXDTH_DTA
      AnimationSpeedFactorRange = 0.9 1.3
      AnimationMode = ONCE
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
  DisplayName = OBJECT:ToxicInfantry

  ; *** AUDIO Parameters ***

  ; *** ENGINEERING Parameters ***
  RadarPriority = NOT_ON_RADAR
  KindOf = CAN_CAST_REFLECTIONS INFANTRY

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 50.0
    InitialHealth   = 50.0
  End

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

;------------------------------------------------------------------------------
ObjectReskin ToxicInfantry_TerroristOnly ToxicInfantry
  ; *** ART Parameters ***
  Draw = W3DModelDraw ModuleTag_01

    DefaultConditionState
      Model = UITRST_SKNG
      Animation = UITRST_SKL.UITrst_DGRN
      AnimationSpeedFactorRange = 0.9 1.3
      AnimationMode = ONCE
    End
  End
End

;------------------------------------------------------------------------------
ObjectReskin ToxicInfantryBeta_TerroristOnly ToxicInfantry
  ; *** ART Parameters ***
  Draw = W3DModelDraw ModuleTag_01

    DefaultConditionState
      Model = UITRST_SKNB
      Animation = UITRST_SKL.UITrst_DBLU
      AnimationSpeedFactorRange = 0.9 1.3
      AnimationMode = ONCE
     End
  End
End

;------------------------------------------------------------------------------
ObjectReskin ToxicInfantryGamma_TerroristOnly ToxicInfantry
  ; *** ART Parameters ***
  Draw = W3DModelDraw ModuleTag_01

    DefaultConditionState
      Model = UITRST_SKNP
      Animation = UITRST_SKL.UITrst_DBLU
      AnimationSpeedFactorRange = 0.9 1.3
      AnimationMode = ONCE
     End
  End
End
