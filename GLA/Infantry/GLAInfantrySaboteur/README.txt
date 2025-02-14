Object GLAInfantrySaboteur

  ; *** ART Parameters ***
  SelectPortrait         = SUSaboteur_L
  ButtonImage            = SUSaboteur

  ;UpgradeCameo1 = NONE
  ;UpgradeCameo2 = NONE
  ;UpgradeCameo3 = NONE
  ;UpgradeCameo4 = NONE
  ;UpgradeCameo5 = NONE

  Draw = W3DModelDraw ModuleTag_01

    OkToChangeModelColor = Yes
    
    ; this says "we don't use these condition states at all, so completely
    ; ignore them for purposes of matchmaking"... this is useful to help
    ; reduce the number of AliasConditionState clauses you must add in
    ; order to avoid ambiguity in some cases.
    IgnoreConditionStates = PREATTACK_A FIRING_A BETWEEN_FIRING_SHOTS_A RELOADING_A

    ; ---- standing
    DefaultConditionState
      Model = UISabotr_SKN
      IdleAnimation = UIWRKR_SKL.UIWRKR_STA 0 9
      IdleAnimation = UIWRKR_SKL.UIWRKR_IDA
      AnimationMode = ONCE
      TransitionKey = TRANS_Stand
    End

    ConditionState  = MOVING
      Animation     = UIWRKR_SKL.UIWRKR_RNA 16
      AnimationMode = LOOP
      Flags         = RANDOMSTART
      TransitionKey = TRANS_Moving
      ParticleSysBone = None InfantryDustTrails
    End

    ConditionState = DYING
      Animation = UIWRKR_SKL.UIWRKR_DTA
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = UIWRKR_SKL.UIWRKR_ADTE1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = UIWRKR_SKL.UIWRKR_ADTE2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = UIWRKR_SKL.UIWRKR_ADTE3
      AnimationMode = ONCE
      TransitionKey = None
    End

    ConditionState  = SPECIAL_CHEERING
      Animation     = UIWRKR_SKL.UIWRKR_CHA
      AnimationMode = ONCE
    End
    
  End

  ; ***DESIGN parameters ***
  DisplayName         = OBJECT:Saboteur
  Side                = GLA
  EditorSorting       = INFANTRY
  TransportSlotCount  = 1                 ;how many "slots" we take in a transport (0 == not transportable)
 
  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End
  VisionRange         = 150
  ShroudClearingRange = 300
  Prerequisites
    Object = GLAArmsDealer
  End
  BuildCost = 800
  BuildTime = 15.0          ;in seconds  

  ExperienceValue     = 15 15 30 40     ;Experience point value at each level
  IsTrainable         = No             ;Can gain experience
  CrushableLevel      = 0  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles
  CommandSet          = GLAInfantrySaboteurCommandSet

  ; *** AUDIO Parameters ***
  VoiceSelect = SaboteurVoiceSelect
  VoiceMove = SaboteurVoiceMove
  VoiceGuard = SaboteurVoiceMove
  VoiceAttack = SaboteurVoiceAttack
  SoundStealthOn = StealthOn
  SoundStealthOff = StealthOff
  VoiceFear = SaboteurVoiceFear
  VoiceTaskComplete = NoSound
  UnitSpecificSounds
    VoiceCreate = SaboteurVoiceCreate
    VoiceSubdue = SaboteurVoiceMove
    VoiceGarrison = SaboteurVoiceMove
    VoiceEnter = SaboteurVoiceMove
    VoiceEnterHostile = SaboteurVoiceAttack
    VoiceGetHealed      = SaboteurVoiceMove
  End

  ; *** ENGINEERING Parameters ***
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK ATTACK_NEEDS_LINE_OF_SIGHT CAN_CAST_REFLECTIONS INFANTRY SALVAGER SCORE 

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 120.0
    InitialHealth   = 120.0
  End

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes
  End

  Behavior = CommandButtonHuntUpdate  ModuleTag_04 ; allows use of command button hunt script with this unit. 
  End

  Locomotor = SET_NORMAL SaboteurGroundLocomotor SaboteurCliffLocomotor

  Behavior = PhysicsBehavior ModuleTag_05
    Mass = 5.0
  End
  Behavior = StealthUpdate ModuleTag_07
    StealthDelay                = 2500 ; msec
    StealthForbiddenConditions  = None
    InnateStealth               = Yes ;Requires upgrade first
    OrderIdleEnemiesToAttackMeUponReveal  = Yes
  End

  Behavior = SquishCollide ModuleTag_11
    ;nothing
  End

  Behavior = SabotagePowerPlantCrateCollide       SabotageTag_01
    BuildingPickup = Yes
    SabotagePowerDuration = 30000
  End
  ;Behavior = SabotageSupplyDropzoneCrateCollide   SabotageTag_02
  ;  BuildingPickup  = Yes
  ;  StealCashAmount = 800
  ;End
  Behavior = SabotageSuperweaponCrateCollide      SabotageTag_03
    BuildingPickup = Yes
  End
  Behavior = SabotageCommandCenterCrateCollide    SabotageTag_04
    BuildingPickup = Yes
  End
  Behavior = SabotageSupplyCenterCrateCollide     SabotageTag_05
    BuildingPickup  = Yes
    StealCashAmount = 1000
  End
  Behavior = SabotageMilitaryFactoryCrateCollide  SabotageTag_06
    BuildingPickup = Yes
    SabotageDuration = 30000
  End
  Behavior = SabotageFakeBuildingCrateCollide     SabotageTag_07
    BuildingPickup = Yes
  End
  Behavior = SabotageInternetCenterCrateCollide   SabotageTag_08
    BuildingPickup = Yes
    SabotageDuration = 15000
  End

; --- begin Death modules ---
  Behavior = SlowDeathBehavior ModuleTag_Death01
    DeathTypes          = ALL -CRUSHED -SPLATTED -EXPLODED -BURNED -POISONED -POISONED_BETA -POISONED_GAMMA
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_SaboteurDie
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
    FX                  = INITIAL FX_SaboteurDie
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

  Behavior = PoisonedBehavior ModuleTag_16
    PoisonDamageInterval = 100  ; Every this many msec I will retake the poison damage dealt me...
    PoisonDuration = 3000       ; ... for this long after last hit by poison damage
  End

;  Behavior = SpecialAbility ModuleTag_17
;    SpecialPowerTemplate      = SpecialAbilityRebelCaptureBuilding
;    UpdateModuleStartsAttack  = Yes
;    StartsPaused              = Yes
;    InitiateSound         = RebelVoiceCapture
;  End
;  Behavior = SpecialAbilityUpdate ModuleTag_18
;    SpecialPowerTemplate  = SpecialAbilityRebelCaptureBuilding
;    StartAbilityRange  = 5.0
;    UnpackTime            = 3000  ; (changing this will scale anim speed)
;    PreparationTime       = 20000 ; time to complete hack once prepared (changing this will scale anim speed)
;    PackTime              = 2000  ; (changing this will scale anim speed)
;    DoCaptureFX           = Yes
;    AwardXPForTriggering  = 12
;    ;SkillPointsForTriggering = ???  -- Dustin, fill me out if you want different balance values.
;  End

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
Locomotor SaboteurGroundLocomotor
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
