Object ChinaInfantryBlackLotus

  ; *** ART Parameters ***
  SelectPortrait         = SNBlkLotus_L2
  ButtonImage            = SNBlkLotus2
  
  ;UpgradeCameo1 = NONE
  ;UpgradeCameo2 = NONE
  ;UpgradeCameo3 = NONE
  ;UpgradeCameo4 = NONE
  ;UpgradeCameo5 = NONE
  
  Draw = W3DModelDraw ModuleTag_01

    OkToChangeModelColor = Yes
    
    ; --- idle
    DefaultConditionState
      Model             = NIHERO_SKN
      IdleAnimation     = NIHERO_SKL.NIHERO_STA 0 17
      IdleAnimation     = NIHERO_SKL.NIHero_IDA
      IdleAnimation     = NIHERO_SKL.NIHero_IDB
      AnimationMode     = ONCE
      TransitionKey     = TRANS_Stand
    End

    ConditionState      = REALLYDAMAGED
      IdleAnimation     = NIHERO_SKL.NIHERO_ISTA 0 30
      IdleAnimation     = NIHERO_SKL.NIHero_IIDA
      AnimationMode     = ONCE
      TransitionKey     = TRANS_StandInjured
    End

    TransitionState     = TRANS_Stand TRANS_StandInjured
      Animation         = NIHero_SKL.NIHero_ISTAHIT
      AnimationMode     = ONCE
    End

    ; --- moving
    ConditionState      = MOVING
      Animation         = NIHero_SKL.NIHero_RNA
      AnimationMode     = LOOP
      Flags             = RANDOMSTART
      TransitionKey     = None
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = MOVING UNPACKING

    ConditionState      = MOVING REALLYDAMAGED
      Animation         = NIHero_SKL.NIHero_IRNA
      AnimationMode     = LOOP
      Flags             = RANDOMSTART
      TransitionKey     = None
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = MOVING UNPACKING REALLYDAMAGED

    ; --- packing states
    ConditionState      = UNPACKING
      ;Preparing to attack (unpacking gear)
      Animation         = NIHero_SKL.NIHero_ATA1
      AnimationMode     = ONCE
    End
    AliasConditionState = UNPACKING FIRING_A

    ConditionState      = FIRING_A
      ;Processing attack (hacking)
      Animation         = NIHero_SKL.NIHero_ATA2
      AnimationMode     = LOOP
      TransitionKey     = TRANS_FiringA
    End

    ConditionState      = PACKING
      ;Completing attack (packing gear)
      Animation         = NIHero_SKL.NIHero_ATA3
      AnimationMode     = ONCE
    End
    AliasConditionState = FIRING_A PACKING 

    TransitionState     = TRANS_FiringA TRANS_FiringAInjured
      Animation         = NIHero_SKL.NIHero_IATAHIT
      AnimationMode     = ONCE
    End

    ; --- injured-packing states
    ConditionState      = UNPACKING REALLYDAMAGED
      ;Preparing to attack (unpacking gear)
      Animation         = NIHero_SKL.NIHero_IATA1
      AnimationMode     = ONCE
    End
    AliasConditionState = UNPACKING FIRING_A REALLYDAMAGED

    ConditionState      = FIRING_A REALLYDAMAGED
      ;Processing attack (hacking)
      Animation         = NIHero_SKL.NIHero_IATA2
      AnimationMode     = LOOP
      TransitionKey     = TRANS_FiringAInjured
    End

    ConditionState      = PACKING REALLYDAMAGED
      ;Completing attack (packing gear)
      Animation         = NIHero_SKL.NIHero_IATA3
      AnimationMode     = ONCE
    End
    AliasConditionState = FIRING_A PACKING REALLYDAMAGED

    ; --- packing-dying states
; code doesn't really support this. Oh well.
;    ConditionState      = DYING RAISING_FLAG
;      Animation         = NIHero_SKL.NIHero_IDTA
;      Animation         = NIHero_SKL.NIHero_IDTB
;      AnimationMode     = ONCE
;    End
;    AliasConditionState = DYING RAISING_FLAG EXPLODED_FLAILING EXPLODED_BOUNCING

    ; --- normal-dying states
    ConditionState      = DYING
      Animation         = NIHero_SKL.NIHero_DTA
      Animation         = NIHero_SKL.NIHero_DTB
      AnimationMode     = ONCE
      TransitionKey     = TRANS_Dying
    End

    TransitionState     = TRANS_Dying TRANS_Flailing
      Animation         = NIHero_SKL.NIHero_ADTF1
      AnimationMode     = ONCE
    End

    ConditionState      = DYING EXPLODED_FLAILING
      Animation         = NIHero_SKL.NIHero_ADTF2
      AnimationMode     = LOOP
      TransitionKey     = TRANS_Flailing
    End

    ConditionState      = DYING EXPLODED_BOUNCING
      Animation         = NIHero_SKL.NIHero_ADTF3
      AnimationMode     = ONCE
      TransitionKey     = None
    End

    ; --- cheering states
    ConditionState      = SPECIAL_CHEERING
      Animation         = NIHERO_SKL.NIHERO_CHA
      AnimationMode     = ONCE
    End

    ConditionState      = SPECIAL_CHEERING REALLYDAMAGED
      Animation         = NIHERO_SKL.NIHERO_ICHA
      AnimationMode     = ONCE
    End

    ; --- falling states
    ConditionState      = FREEFALL
      Animation         = NIHero_SKL.NIHero_PFL
      AnimationMode     = LOOP
      TransitionKey     = TRANS_Falling
    End
    AliasConditionState = FREEFALL REALLYDAMAGED
    AliasConditionState = FREEFALL DYING

    ConditionState      = PARACHUTING
      Animation         = NIHero_SKL.NIHero_PHG
      AnimationMode     = LOOP
      TransitionKey     = TRANS_Chute
    End
    AliasConditionState = PARACHUTING REALLYDAMAGED
    AliasConditionState = PARACHUTING DYING

    TransitionState     = TRANS_Falling TRANS_Chute
      Animation         = NIHero_SKL.NIHero_POP
      AnimationMode     = ONCE
      Flags             = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
    End

    TransitionState     = TRANS_Chute TRANS_Stand
      Animation         = NIHero_SKL.NIHero_PTD
      AnimationMode     = ONCE
    End

    TransitionState     = TRANS_Chute TRANS_StandInjured
      Animation         = NIHero_SKL.NIHero_PTD
      AnimationMode     = ONCE
    End

  End

  ; ***DESIGN parameters ***
  DisplayName         = OBJECT:BlackLotus
  Side                = China
  EditorSorting       = INFANTRY
  TransportSlotCount  = 1                 ;how many "slots" we take in a transport (0 == not transportable)
  WeaponSet
    Conditions        = None 
    Weapon            = PRIMARY None
  End
  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End
  VisionRange         = 300
  ShroudClearingRange = 400
  Prerequisites
    Object = ChinaBarracks
    Object = ChinaPropagandaCenter
  End
  BuildCost             = 1500
  BuildTime             = 20.0          ;in seconds    
  MaxSimultaneousOfType = 1
  CommandSet            = ChinaInfantryBlackLotusCommandSet

  ExperienceValue       = 50 100 150 400    ;Experience point value at each level
  ExperienceRequired    = 0 150 450 900  ;Experience points needed to gain each level
  IsTrainable           = Yes             ;Can gain experience
  CrushableLevel        = 2  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles
  CommandSet            = ChinaInfantryBlackLotusCommandSet

  ; *** AUDIO Parameters ***
  VoiceSelect = BlackLotusVoiceSelect
  VoiceMove = BlackLotusVoiceMove
  VoiceAttack = NoSound ;BlackLotusVoiceAttack
  VoiceGuard = BlackLotusVoiceMove
  VoiceFear = BlackLotusVoiceFear
  VoiceTaskComplete = BlackLotusVoiceCaptureComplete
  SoundStealthOn = StealthOn
  SoundStealthOff = StealthOff
  
  UnitSpecificSounds
    VoiceCreate          = BlackLotusVoiceCreate
    VoiceGarrison = BlackLotusVoiceMove
    VoiceEnter = BlackLotusVoiceMove
    VoiceEnterHostile = BlackLotusVoiceMove
    VoiceStealCashComplete = BlackLotusVoiceCashComplete
    VoiceDisableVehicleComplete = BlackLotusVoiceDisableComplete
    VoiceCaptureBuildingComplete = BlackLotusVoiceCaptureComplete
    VoiceGetHealed      = BlackLotusVoiceMove
  End

  ; *** ENGINEERING Parameters ***
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK CAN_CAST_REFLECTIONS INFANTRY SCORE HERO CANNOT_RETALIATE

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 200.0
    InitialHealth   = 200.0
  End

  Behavior = CommandButtonHuntUpdate  ModuleTag_03 ; allows use of command button hunt script with this unit. 
  End

  Behavior = AIUpdateInterface ModuleTag_04
    AutoAcquireEnemiesWhenIdle = No
  End
  Locomotor = SET_NORMAL BlackLotusLocomotor
  Locomotor = SET_FREEFALL FreeFallLocomotor
  Behavior = PhysicsBehavior ModuleTag_05
    Mass = 5.0
  End
  Behavior = StealthUpdate ModuleTag_07
    StealthDelay                = 2500 ; msec
    StealthForbiddenConditions  = USING_ABILITY
    HintDetectableConditions    = USING_ABILITY
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes
    EnemyDetectionEvaEvent      = EnemyBlackLotusDetected
    OwnDetectionEvaEvent        = OwnBlackLotusDetected
  End

  Behavior = StealthDetectorUpdate ModuleTag_44
    DetectionRate   = 500   ; how often to rescan for stealthed things in my sight (msec)
    ;DetectionRange = ??? ;Dustin, enable this for independant balancing!
    CanDetectWhileGarrisoned  = No ;Garrisoned means being in a structure that you units can shoot out of.
    CanDetectWhileContained   = No ;Contained means being in a transport or tunnel network.
  End

  Behavior = SpecialAbility ModuleTag_08
    SpecialPowerTemplate = SpecialAbilityBlackLotusCaptureBuilding
    UpdateModuleStartsAttack = Yes
    InitiateSound         = BlackLotusVoiceHackBuilding
  End
  Behavior = SpecialAbilityUpdate ModuleTag_09
    SpecialPowerTemplate  = SpecialAbilityBlackLotusCaptureBuilding
    StartAbilityRange     = 150.0
    UnpackTime            = 6730 ;animation time is 6730 (changing this will scale anim speed)
    PackTime              = 2800 ;animation time is 5800 (changing this will scale anim speed)
    PreparationTime       = 6000 ;time to complete hack once prepared (unpacked)
    SpecialObject         = BinaryDataStream
    DoCaptureFX           = Yes
    PackSound             = BlackLotusPack
    UnpackSound           = BlackLotusUnpack
    TriggerSound          = BlackLotusTrigger
    PrepSoundLoop         = BlackLotusPrepLoop
    AwardXPForTriggering  = 20
    ;SkillPointsForTriggering = ???  -- Dustin, fill me out if you want different balance values.
  End
  Behavior = SpecialAbility ModuleTag_10
    SpecialPowerTemplate      = SpecialAbilityBlackLotusDisableVehicleHack
    UpdateModuleStartsAttack  = Yes
    InitiateSound           = BlackLotusVoiceHackVehicle
  End
  Behavior = SpecialAbilityUpdate ModuleTag_11
    SpecialPowerTemplate    = SpecialAbilityBlackLotusDisableVehicleHack
    StartAbilityRange       = 150.0
    UnpackTime              = 2000 ;6730 ;animation time is 6730 (changing this will scale anim speed)
    PackTime                = 1000 ;2800 ;animation time is 5800 (changing this will scale anim speed)
    PreparationTime         = 2000 ;time to complete hack once prepared (unpacked)
    EffectDuration          = 15000 ;duration vehicle is disabled  (30 seconds)
    DisableFXParticleSystem = DisabledEffectBinaryShower0
    SpecialObject           = BinaryDataStream
    PackSound               = BlackLotusPack
    UnpackSound             = BlackLotusUnpack
    TriggerSound            = BlackLotusTrigger
    PrepSoundLoop           = BlackLotusPrepLoop
    AwardXPForTriggering    = 0
    ;SkillPointsForTriggering = ???  -- Dustin, fill me out if you want different balance values.
  End
  Behavior = SpecialAbility ModuleTag_12
    SpecialPowerTemplate      = SpecialAbilityBlackLotusStealCashHack
    UpdateModuleStartsAttack  = Yes
    InitiateSound         = BlackLotusVoiceHackCash
  End
  Behavior = SpecialAbilityUpdate ModuleTag_13
    SpecialPowerTemplate  = SpecialAbilityBlackLotusStealCashHack
    StartAbilityRange     = 150.0
    UnpackTime            = 6730 ;animation time is 6730 (changing this will scale anim speed)
    PackTime              = 5800 ;animation time is 5800 (changing this will scale anim speed)
    PreparationTime       = 6000 ;time to complete hack once prepared (unpacked)
    EffectValue           = 1000 ;amount of cash stolen
    SpecialObject         = BinaryDataStream
    PackSound             = BlackLotusPack
    UnpackSound           = BlackLotusUnpack
    TriggerSound          = BlackLotusTrigger
    PrepSoundLoop         = BlackLotusPrepLoop
    AwardXPForTriggering  = 20
    ;SkillPointsForTriggering = ???  -- Dustin, fill me out if you want different balance values.
  End
 
  ;Hero units can't be squished!
  ;Behavior = SquishCollide ModuleTag_14
  ;  ;nothing
  ;End


; --- begin Death modules ---
  Behavior = SlowDeathBehavior ModuleTag_Death01
    DeathTypes          = ALL -CRUSHED -SPLATTED -EXPLODED -BURNED -POISONED -POISONED_BETA -POISONED_GAMMA
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_BlackLotusDie
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
    FX                  = INITIAL FX_BlackLotusDie
    FlingForce          = 8
    FlingForceVariance  = 3
    FlingPitch          = 60
    FlingPitchVariance  = 10
  End
  Behavior = SlowDeathBehavior ModuleTag_Death04
    DeathTypes          = NONE +BURNED
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByFireFemale
    OCL                 = INITIAL OCL_FlamingInfantry
  End
  Behavior = SlowDeathBehavior ModuleTag_Death05
    DeathTypes          = NONE +POISONED
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinFemale
    OCL                 = INITIAL OCL_ToxicInfantry
  End
  Behavior = SlowDeathBehavior ModuleTag_Death06 ; don't forget to give it a new, unique module tag
    DeathTypes          = NONE +POISONED_BETA
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinFemale
    OCL                 = INITIAL OCL_ToxicInfantryBeta ;you'll have to create this OCL and make it use the blue guys instead of green ones
  End

  Behavior = SlowDeathBehavior ModuleTag_Death07
    DeathTypes          = NONE +POISONED_GAMMA
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinFemale
    OCL                 = INITIAL OCL_ToxicInfantryGamma
  End
; --- end Death modules ---

  Behavior = PoisonedBehavior ModuleTag_17
    PoisonDamageInterval  = 100  ; Every this many msec I will retake the poison damage dealt me...
    PoisonDuration        = 3000       ; ... for this long after last hit by poison damage
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
Locomotor BlackLotusLocomotor
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
