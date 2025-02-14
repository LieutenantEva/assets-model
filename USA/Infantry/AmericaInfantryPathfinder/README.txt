Object AmericaInfantryPathfinder

    ; *** ART Parameters ***
  SelectPortrait         = SAPathfinder1_L
  ButtonImage            = SAPathfinder1
  
  UpgradeCameo1 = Upgrade_AmericaAdvancedTraining
  UpgradeCameo2 = Upgrade_AmericaChemicalSuits
  ;UpgradeCameo3 = NONE
  ;UpgradeCameo4 = NONE
  ;UpgradeCameo5 = NONE
  
  Draw = W3DModelDraw ModuleTag_01

    OkToChangeModelColor = Yes

    DefaultConditionState
      Model = AIPFDR_SKN
      IdleAnimation = AIPFDR_SKL.AIPFDR_STA 
      IdleAnimation = AIPFDR_SKL.AIPFDR_IDA
      AnimationMode = ONCE
      WeaponFireFXBone = PRIMARY Muzzle
      WeaponMuzzleFlash = PRIMARY MuzzleFX
      TransitionKey = TRANS_Standing
    End
    AliasConditionState = REALLYDAMAGED

    ConditionState = MOVING
      Animation = AIPFDR_SKL.AIPFDR_RNA 25
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey = TRANS_Standing
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = MOVING REALLYDAMAGED

    ConditionState  = FIRING_A 
      Animation     = AIPFDR_SKL.AIPFDR_ATB                 ; recoil in standing position
      AnimationMode = ONCE
      TransitionKey = TRANS_FiringA
    End
    AliasConditionState = FIRING_A MOVING
    AliasConditionState = FIRING_A MOVING REALLYDAMAGED
    AliasConditionState = FIRING_A REALLYDAMAGED

    ConditionState  = BETWEEN_FIRING_SHOTS_A
      Animation     = AIPFDR_SKL.AIPFDR_ATBST               ; motionless in standing position
      AnimationMode = ONCE
      WaitForStateToFinishIfPossible = TRANS_FiringA
    End
    AliasConditionState = BETWEEN_FIRING_SHOTS_A REALLYDAMAGED
    AliasConditionState = RELOADING_A
    AliasConditionState = RELOADING_A REALLYDAMAGED

    ConditionState = DYING
      Animation = AIPFDR_SKL.AIPFDR_DTA
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End
    
    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = AIPFDR_SKL.AIPFDR_ADTA1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = AIPFDR_SKL.AIPFDR_ADTA2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = AIPFDR_SKL.AIPFDR_ADTA3
      AnimationMode = ONCE
      TransitionKey = None
    End

    ConditionState = FREEFALL
      Animation = AIPFDR_SKL.AIPFDR_PFL
      AnimationMode = LOOP
      TransitionKey = TRANS_Falling
    End
    AliasConditionState = FREEFALL DYING

    ConditionState = PARACHUTING
      Animation = AIPFDR_SKL.AIPFDR_PHG
      AnimationMode = LOOP
      Flags = PRISTINE_BONE_POS_IN_FINAL_FRAME  
      ;our bone positions should come from the last frame, rather than the first
      TransitionKey = TRANS_Chute
    End
    AliasConditionState = PARACHUTING DYING


    TransitionState = TRANS_Falling TRANS_Chute
      Animation = AIPFDR_SKL.AIPFDR_POP
      AnimationMode = ONCE
      Flags = PRISTINE_BONE_POS_IN_FINAL_FRAME  
      ;our bone positions should come from the last frame, rather than the first
    End

    TransitionState = TRANS_Chute TRANS_Standing
      Animation = AIPFDR_SKL.AIPFDR_PTD
      AnimationMode = ONCE
    End
  End

  
  ; ***DESIGN parameters ***
  DisplayName      = OBJECT:Pathfinder
  Side = America
  EditorSorting = INFANTRY
  TransportSlotCount = 1                 ;how many "slots" we take in a transport (0 == not transportable)
  
  WeaponSet
    Conditions = None 
    Weapon = PRIMARY USAPathfinderSniperRifle
  End
  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End
  ArmorSet
    Conditions      = PLAYER_UPGRADE
    Armor           = ChemSuitHumanArmor
    DamageFX        = InfantryDamageFX
  End

  VisionRange = 200
  ShroudClearingRange = 400
  Prerequisites
    Object = AmericaBarracks
    Science = SCIENCE_Pathfinder
  End
  BuildCost = 600
  BuildTime = 10.0          ;in seconds  
  
  ExperienceValue = 40 40 60 80    ;Experience point value at each level
  ExperienceRequired = 0 50 100 200  ;Experience points needed to gain each level
  IsTrainable = Yes             ;Can gain experience
  CrushableLevel      = 0  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles
  CommandSet      = AmericaInfantryPathfinderCommandSet

  ; *** AUDIO Parameters ***
  VoiceSelect = PathfinderVoiceSelect
  VoiceMove = PathfinderVoiceMove
  VoiceGuard = PathfinderVoiceMove
  VoiceAttack = PathfinderVoiceAttack
  VoiceFear = PathfinderVoiceFear
  SoundStealthOn = StealthOn
  SoundStealthOff = StealthOff
  VoiceFear = PathfinderVoiceFear
  
  UnitSpecificSounds
    VoiceCreate          = PathfinderVoiceCreate
    VoiceGarrison = PathfinderVoiceGarrison
    VoiceEnter = PathfinderVoiceMove
    VoiceEnterHostile =  PathfinderVoiceMove
    VoiceGetHealed      = PathfinderVoiceMove
  End

  ; *** ENGINEERING Parameters ***
  Behavior                = ArmorUpgrade ModuleTag_Armor01
    TriggeredBy           = Upgrade_AmericaChemicalSuits
  End
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK ATTACK_NEEDS_LINE_OF_SIGHT CAN_CAST_REFLECTIONS INFANTRY STEALTH_GARRISON SCORE CANNOT_RETALIATE

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 120.0
    InitialHealth   = 120.0
  End

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    MoodAttackCheckRate        = 250
  End

  Behavior = AutoFindHealingUpdate   ModuleTag_04 ; This update will have the unit go to a healing station if injured. jba 
    ScanRate = 1000 ; once a second.
    ScanRange = 300 ;
    NeverHeal = 0.85 ;  don't heal if we are > 85% healthy.
    AlwaysHeal = 0.25 ; if we get below 25%, find healing right away.
  End

  Locomotor = SET_NORMAL ColonelBurtonGroundLocomotor

  Behavior = ExperienceScalarUpgrade ModuleTag_05
    TriggeredBy = Upgrade_AmericaAdvancedTraining
    AddXPScalar = 1.0 ;Increases experience gained by an additional 100%
  End

  Behavior = PhysicsBehavior ModuleTag_06
    Mass = 5.0
  End
  Behavior = StealthDetectorUpdate ModuleTag_08
    DetectionRate   = 500   ; how often to rescan for stealthed things in my sight (msec)
    ;DetectionRange = ??? ;Dustin, enable this for independant balancing!
    CanDetectWhileGarrisoned  = No ;Garrisoned means being in a structure that you units can shoot out of.
    CanDetectWhileContained   = No ;Contained means being in a transport or tunnel network.
  End
  Behavior = StealthUpdate ModuleTag_09
    StealthDelay                = 0           ; msec
    StealthForbiddenConditions  = MOVING ; stays stealthy while attacking
    FriendlyOpacityMin          = 30.0%
    FriendlyOpacityMax          = 80.0%
    PulseFrequency              = 500   ; msec
    MoveThresholdSpeed          = 3
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes
  End
 
  Behavior = SquishCollide ModuleTag_10
    ;nothing
  End


; --- begin Death modules ---
  Behavior = SlowDeathBehavior ModuleTag_Death01
    DeathTypes          = ALL -CRUSHED -SPLATTED -EXPLODED -BURNED -POISONED -POISONED_BETA -POISONED_GAMMA
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_PathfinderDie
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
    FX                  = INITIAL FX_PathfinderDie
    FlingForce          = 8
    FlingForceVariance  = 3
    FlingPitch          = 60
    FlingPitchVariance  = 10
  End
  Behavior = SlowDeathBehavior ModuleTag_Death04
    DeathTypes          = NONE +BURNED
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByFireUSA
    OCL                 = INITIAL OCL_FlamingInfantry
  End
  Behavior = SlowDeathBehavior ModuleTag_Death05
    DeathTypes          = NONE +POISONED
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinUSA
    OCL                 = INITIAL OCL_ToxicInfantry
  End
  Behavior = SlowDeathBehavior ModuleTag_Death06 ; don't forget to give it a new, unique module tag
    DeathTypes          = NONE +POISONED_BETA
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinUSA
    OCL                 = INITIAL OCL_ToxicInfantryBeta ;you'll have to create this OCL and make it use the blue guys instead of green ones
  End

  Behavior = SlowDeathBehavior ModuleTag_Death07
    DeathTypes          = NONE +POISONED_GAMMA
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinUSA
    OCL                 = INITIAL OCL_ToxicInfantryGamma
  End
; --- end Death modules ---

  Behavior = PoisonedBehavior ModuleTag_13
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
Locomotor ColonelBurtonGroundLocomotor
  Surfaces = GROUND RUBBLE
  Speed = 30                ; in dist/sec
  SpeedDamaged = 20         ; in dist/sec
  TurnRate = 500            ; in degrees/sec
  TurnRateDamaged = 500     ; in degrees/sec
  Acceleration = 100        ; in dist/(sec^2)
  AccelerationDamaged = 50 ; in dist/(sec^2)
  Braking = 100             ; in dist/(sec^2)
  MinTurnSpeed = 0          ; in dist/sec
  ZAxisBehavior = NO_Z_MOTIVE_FORCE
  Appearance = TWO_LEGS
  StickToGround = Yes       ; walking guys aren't allowed to catch huge (or even small) air.
  GroupMovementPriority = MOVES_BACK;   Moves in the back of a group, out of danger.
End

;------------------------------------------------------------------------------
Weapon USAPathfinderSniperRifle
  PrimaryDamage = 100.0
  PrimaryDamageRadius = 0.0
  AttackRange = 300.0
  DamageType = SNIPER
  DeathType = NORMAL
  WeaponSpeed = 999999.0          ; dist/sec (huge value == effectively instant)
  ProjectileObject = NONE
  FireFX = WeaponFX_GenericMachineGunFire                   ; so the ground lighting effects do not give away position while stealthed
  FireSound = PathfinderWeapon
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 2000               ; time between shots, msec
  ClipSize = 0                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 0              ; how long to reload a Clip, msec
  WeaponBonus = PLAYER_UPGRADE DAMAGE 125% ; AP weapon upgrade
End
