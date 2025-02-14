; Jason Bender sez:
; This unit is used in GLA04. It is part of a secondary objective. The player gets a medal for capturing him.
; This unit is never human-controllable!
;
Object ChinaAmbassador

    ; *** ART Parameters ***
  Draw = W3DModelDraw ModuleTag_01
    OkToChangeModelColor = Yes

    DefaultConditionState
      Model = NIAMBSDR_SKN
      IdleAnimation = NIAMBSDR_SKL.NIAMBSDR_STA
      IdleAnimation = NIAMBSDR_SKL.NIAMBSDR_STA
      IdleAnimation = NIAMBSDR_SKL.NIAMBSDR_STA
      IdleAnimation = NIAMBSDR_SKL.NIAMBSDR_STA
      IdleAnimation = NIAMBSDR_SKL.NIAMBSDR_STA
      IdleAnimation = NIAMBSDR_SKL.NIAMBSDR_STA
      IdleAnimation = NIAMBSDR_SKL.NIAMBSDR_STA
      IdleAnimation = NIAMBSDR_SKL.NIAMBSDR_IDA
      IdleAnimation = NIAMBSDR_SKL.NIAMBSDR_IDB
      AnimationMode = ONCE
      TransitionKey = TRANS_Stand
    End
        
    ConditionState = MOVING
      Animation = NIAMBSDR_SKL.NIAMBSDR_RNA ;***was using WKA but it doesn't exist so I changed it to kill the assert -- Kris 
      AnimationMode = LOOP
      Flags = RANDOMSTART
    End

    ConditionState = MOVING PANICKING
      Animation = NIAMBSDR_SKL.NIAMBSDR_RNA 
      AnimationMode = LOOP
      Flags = RANDOMSTART
    End

    ConditionState = DYING
      Animation = NIAMBSDR_SKL.NIAMBSDR_DTA
      Animation = NIAMBSDR_SKL.NIAMBSDR_DTB
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    ;TransitionState = TRANS_Dying TRANS_Flailing
    ;  Animation = NIAMBSDR_SKL.NIAMBSDR_ADTD1
    ;  AnimationMode = ONCE
    ;End

    ;ConditionState = DYING EXPLODED_FLAILING
    ;  Animation = NIAMBSDR_SKL.NIAMBSDR_ADTD2
    ;  AnimationMode = LOOP
    ;  TransitionKey = TRANS_Flailing
    ;End

    ;ConditionState = DYING EXPLODED_BOUNCING
    ;  Animation = NIAMBSDR_SKL.NIAMBSDR_ADTD3
    ;  AnimationMode = ONCE
    ;  TransitionKey = None
    ;End
  End

  ; ***DESIGN parameters ***
  Buildable           = No
  DisplayName         = OBJECT:Ambassador
  Side                = China
  EditorSorting       = INFANTRY
  TransportSlotCount  = 1                 ;how many "slots" we take in a transport (0 == not transportable)
  WeaponSet
    ; no weapons
  End
  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End
  VisionRange = 150
  ShroudClearingRange = 150

  ExperienceValue = 50 100 150 400    ;Experience point value at each level
  ExperienceRequired = 0 150 450 900  ;Experience points needed to gain each level
  IsTrainable = Yes             ;Can gain experience

  ; *** AUDIO Parameters ***

  ; *** ENGINEERING Parameters ***
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK CAN_CAST_REFLECTIONS INFANTRY SCORE

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 50.0
    InitialHealth   = 50.0
  End

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes
  End
  Locomotor = SET_NORMAL BasicHumanLocomotor
  Behavior = PhysicsBehavior ModuleTag_04
    Mass = 5.0
  End
  Behavior = SlowDeathBehavior ModuleTag_05
    SinkDelay = 3000
    SinkRate = 0.5     ; in Dist/Sec
    DestructionDelay = 8000
  End
 
  Behavior = SquishCollide ModuleTag_06
    ;nothing
  End

  Behavior = FXListDie ModuleTag_07
    DeathTypes = ALL -CRUSHED -SPLATTED
    DeathFX = FX_RedGuardDie
  End
  Behavior = FXListDie ModuleTag_08
    DeathTypes = NONE +CRUSHED +SPLATTED
    DeathFX = FX_GIDieCrushed
  End

  Behavior = PoisonedBehavior ModuleTag_09
    PoisonDamageInterval = 100  ; Every this many msec I will retake the poison damage dealt me...
    PoisonDuration = 3000       ; ... for this long after last hit by poison damage
  End
 
  Geometry = CYLINDER
  GeometryMajorRadius = 10.0
  GeometryMinorRadius = 10.0
  GeometryHeight = 12.0
  GeometryIsSmall = Yes
  Shadow = SHADOW_DECAL
  ShadowSizeX = 14
  ShadowSizeY = 14
  ShadowTexture = ShadowI
  BuildCompletion = APPEARS_AT_RALLY_POINT

End

;------------------------------------------------------------------------------
Locomotor BasicHumanLocomotor
  Surfaces = GROUND RUBBLE
  Speed = 20 ;30                ; in dist/sec
  SpeedDamaged = 10 ;30         ; in dist/sec
  TurnRate = 500            ; in degrees/sec
  TurnRateDamaged = 500    ; in degrees/sec
  Acceleration = 100        ; in dist/(sec^2)
  AccelerationDamaged = 50 ; in dist/(sec^2)
  Braking = 100             ; in dist/(sec^2)
  MinTurnSpeed = 0          ; in dist/sec
  ZAxisBehavior = NO_Z_MOTIVE_FORCE
  Appearance = TWO_LEGS
  StickToGround = Yes       ; walking guys aren't allowed to catch huge (or even small) air.
  GroupMovementPriority = MOVES_FRONT;   Moves in the front of a group, behind small arms, ahead of artillery
End
