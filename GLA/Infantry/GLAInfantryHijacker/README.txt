Object GLAInfantryHijacker

  ; *** ART Parameters ***
  SelectPortrait         = SUHijacker_L
  ButtonImage            = SUHijacker
  
  ;UpgradeCameo1 = NONE
  ;UpgradeCameo2 = NONE
  ;UpgradeCameo3 = NONE
  ;UpgradeCameo4 = NONE
  ;UpgradeCameo5 = NONE

  Draw = W3DModelDraw ModuleTag_01
    OkToChangeModelColor = Yes

    DefaultConditionState
      Model = UIHJCK_SKN
      IdleAnimation = UIHJCK_SKL.UIHJCK_STA 0 25
      IdleAnimation = UIHJCK_SKL.UIHJCK_IDA
      IdleAnimation = UIHJCK_SKL.UIHJCK_IDB
      AnimationMode = ONCE
      TransitionKey = TRANS_Stand
    End
    AliasConditionState = REALLYDAMAGED

    ConditionState = MOVING
      Animation = UIHJCK_SKL.UIHJCK_RUN 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey = None
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = REALLYDAMAGED MOVING


    ConditionState = DYING
      Animation = UIHJCK_SKL.UIHJCK_DTA
      Animation = UIHJCK_SKL.UIHJCK_DTB
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = UIHJCK_SKL.UIHJCK_ADTE1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = UIHJCK_SKL.UIHJCK_ADTE2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = UIHJCK_SKL.UIHJCK_ADTE3
      AnimationMode = ONCE
      TransitionKey = None
    End

    ConditionState = SPECIAL_CHEERING
      Animation = UIHJCK_SKL.UIHJCK_CHA
      AnimationMode = LOOP
    End


    ConditionState = PARACHUTING
      Animation = UIHJCK_SKL.UIHJCK_PHG
      AnimationMode = LOOP
      Flags = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
      TransitionKey = TRANS_Chute
    End
    AliasConditionState = PARACHUTING REALLYDAMAGED
    AliasConditionState = PARACHUTING DYING
    TransitionState = TRANS_Falling TRANS_Chute
      Animation = UIHJCK_SKL.UIHJCK_POP
      AnimationMode = ONCE
      Flags = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
    End
    TransitionState = TRANS_Chute TRANS_Stand
      Animation = UIHJCK_SKL.UIHJCK_PTD
      AnimationMode = ONCE
    End


  End

  ; ***DESIGN parameters ***
  DisplayName      = OBJECT:Hijacker
  Side = GLA
  EditorSorting = INFANTRY
  TransportSlotCount = 1                 ;how many "slots" we take in a transport (0 == not transportable)
  
  

  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End

  VisionRange = 100
  ShroudClearingRange = 200
  Prerequisites
    Object = GLABarracks
    Object = GLAPalace
    Science = SCIENCE_Hijacker
  End

  BuildCost = 400
  BuildTime = 10.0          ;in seconds    




  ExperienceValue = 50 100 150 400    ;Experience point value at each level
  ExperienceRequired = 0 150 450 900  ;Experience points needed to gain each level
  IsTrainable = No                    ;Can gain experience
  CrushableLevel         = 0  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles
  CommandSet    = GLAInfantryHijackerCommandSet

  ; *** AUDIO Parameters ***
  VoiceSelect =    HijackerVoiceSelect
  VoiceMove =      HijackerVoiceMove
  VoiceGuard =      HijackerVoiceMove
  VoiceAttack =    HijackerVoiceAttack
  VoiceFear =      HijackerVoiceFear
  UnitSpecificSounds
    VoiceGarrison =  HijackerVoiceGarrison
    VoiceCreate           = HijackerVoiceCreate
    VoiceEnter            = HijackerVoiceEnter
    VoiceEnterHostile     = HijackerVoiceEnterHostile
    VoiceGetHealed      = HijackerVoiceMove
  End
  

  ; *** ENGINEERING Parameters ***
  RadarPriority = UNIT
  EnterGuard = Yes
  HijackGuard = Yes
  KindOf = PRELOAD SELECTABLE CAN_CAST_REFLECTIONS INFANTRY SALVAGER SCORE STEALTH_GARRISON
  ;STEALTH_GARRISON Added per Dustin, 12/14--ML


  Behavior = StealthUpdate ModuleTag_02
    StealthDelay                = 500                    ; half second delay before stealthy
    StealthForbiddenConditions  = MOVING ; only stealthy while stationary
    MoveThresholdSpeed          = 3
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes
  End

  Body = ActiveBody ModuleTag_03
    MaxHealth       = 100.0
    InitialHealth   = 100.0
  End

  Behavior = HijackerUpdate ModuleTag_04
    ParachuteName = AmericaParachute
  End

  Behavior = AIUpdateInterface ModuleTag_05
    AutoAcquireEnemiesWhenIdle = Yes
  End
  Behavior = CommandButtonHuntUpdate  ModuleTag_CBH01 ; allows use of command button hunt script with this unit. 
  End
  Locomotor = SET_NORMAL JarmenKellLocomotor

  Behavior = PhysicsBehavior ModuleTag_06
    Mass = 5.0
  End

  Behavior = ConvertToHijackedVehicleCrateCollide       ModuleTag_08
    RequiredKindOf = VEHICLE      ; This is my car now, infidel!
  End

  Behavior = SquishCollide ModuleTag_09
    ;nothing
  End


; --- begin Death modules ---
  Behavior = SlowDeathBehavior ModuleTag_Death01
    DeathTypes          = ALL -CRUSHED -SPLATTED -EXPLODED -BURNED -POISONED -POISONED_BETA -POISONED_GAMMA
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_HijackerDie
  End
  Behavior = SlowDeathBehavior ModuleTag_Death02
    DeathTypes          = NONE +CRUSHED +SPLATTED
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_GIDieCrushed
  End
  Behavior = SlowDeathBehavior ModuleTag_Death03
    DeathTypes          = NONE +EXPLODED
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_HijackerDie
    FlingForce          = 8
    FlingForceVariance  = 3
    FlingPitch          = 60
    FlingPitchVariance  = 10
  End
  Behavior = SlowDeathBehavior ModuleTag_Death04
    DeathTypes          = NONE +BURNED
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByFireGLA
    OCL                 = INITIAL OCL_FlamingInfantry
  End
  Behavior = SlowDeathBehavior ModuleTag_Death05
    DeathTypes          = NONE +POISONED
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinGLA
    OCL                 = INITIAL OCL_ToxicInfantry
  End
  Behavior = SlowDeathBehavior ModuleTag_Death06 ; don't forget to give it a new, unique module tag
    DeathTypes          = NONE +POISONED_BETA
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinGLA
    OCL                 = INITIAL OCL_ToxicInfantryBeta ;you'll have to create this OCL and make it use the blue guys instead of green ones
  End
  Behavior = SlowDeathBehavior ModuleTag_Death07
    DeathTypes          = NONE +POISONED_GAMMA
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinGLA
    OCL                 = INITIAL OCL_ToxicInfantryGamma
  End

; --- end Death modules ---

  Behavior = PoisonedBehavior ModuleTag_14
    PoisonDamageInterval = 100  ; Every this many msec I will retake the poison damage dealt me...
    PoisonDuration = 3000       ; ... for this long after last hit by poison damage
  End
 
  Geometry = CYLINDER
  GeometryMajorRadius = 10.0
  GeometryMinorRadius = 10.0
  GeometryHeight = 12.0
  GeometryIsSmall = Yes
  Shadow = SHADOW_DECAL
  ShadowSizeX = 14;
  ShadowSizeY = 14;
  ShadowTexture = ShadowI;
  BuildCompletion = APPEARS_AT_RALLY_POINT

End

;------------------------------------------------------------------------------
Locomotor JarmenKellLocomotor
  Surfaces = GROUND RUBBLE
  Speed = 30                 ; in dist/sec
  SpeedDamaged = 20          ; in dist/sec
  TurnRate = 500            ; in degrees/sec
  TurnRateDamaged = 500    ; in degrees/sec
  Acceleration = 100        ; in dist/(sec^2)
  AccelerationDamaged = 50 ; in dist/(sec^2)
  Braking = 100             ; in dist/(sec^2)
  MinTurnSpeed = 0          ; in dist/sec
  ZAxisBehavior = NO_Z_MOTIVE_FORCE
  Appearance = TWO_LEGS
  StickToGround = Yes       ; walking guys aren't allowed to catch huge (or even small) air.
  GroupMovementPriority = MOVES_BACK;   Moves in the back of a group, out of danger.
End
