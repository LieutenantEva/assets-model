Object GLAInfantryRebel

  ; *** ART Parameters ***
  SelectPortrait         = SURebel_L
  ButtonImage            = SURebel

  UpgradeCameo1 = Upgrade_GLAAPBullets
  UpgradeCameo2 = Upgrade_GLACamouflage
  UpgradeCameo3 = Upgrade_InfantryCaptureBuilding
  UpgradeCameo4 = Upgrade_GLAInfantryRebelBoobyTrapAttack
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
      Model               = UIRGrd_SKN
      IdleAnimation       = UIRGrd_SKL.UIRGrd_STN 0 35
      IdleAnimation       = UIRGrd_SKL.UIRGrd_IDA 
      IdleAnimation       = UIRGrd_SKL.UIRGrd_IDB 
      AnimationMode       = ONCE
      WeaponFireFXBone    = PRIMARY Muzzle
      WeaponMuzzleFlash   = PRIMARY MuzzleFX
      TransitionKey       = TRANS_Standing
    End

    ConditionState        = REALLYDAMAGED
      IdleAnimation       = UIRGrd_SKL.UIRGrd_STB 0 35
      IdleAnimation       = UIRGrd_SKL.UIRGrd_IDC
      IdleAnimation       = UIRGrd_SKL.UIRGrd_IDD 
      AnimationMode       = ONCE
      TransitionKey       = TRANS_StandingHurt
    End

    ; ---- moving
    ConditionState        = MOVING
      Animation           = UIRGrd_SKL.UIRGrd_RNA 15
      AnimationMode       = LOOP
      TransitionKey       = TRANS_Walking
      ParticleSysBone     = None InfantryDustTrails
    End
    AliasConditionState   = MOVING ATTACKING

    ConditionState        = MOVING REALLYDAMAGED
      Animation           = UIRGrd_SKL.UIRGrd_RNB 25
      AnimationMode       = LOOP
      TransitionKey       = TRANS_WalkingHurt
      ParticleSysBone     = None InfantryDustTrails
    End
    AliasConditionState   = MOVING ATTACKING REALLYDAMAGED
    
    ; ---- dying 
    ConditionState        = DYING
      Animation           = UIRGrd_SKL.UIRGrd_DTA 
      Animation           = UIRGrd_SKL.UIRGrd_DTB 
      AnimationMode       = ONCE
      TransitionKey       = TRANS_Dying
    End

    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = UIRGrd_SKL.UIRGrd_ADTE1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = UIRGrd_SKL.UIRGrd_ADTE2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = UIRGrd_SKL.UIRGrd_ADTE3
      AnimationMode = ONCE
      TransitionKey = None
    End
    
    ConditionState = SPECIAL_CHEERING
      Animation = UIRGrd_SKL.UIRGrd_IDB
    End

    ; ---- firing
    ConditionState = USING_WEAPON_A
      Animation = UIRGrd_SKL.UIRGrd_ATA
      AnimationMode = LOOP
      TransitionKey = TRANS_Firing
    End

    ConditionState = USING_WEAPON_A REALLYDAMAGED
      Animation = UIRGrd_SKL.UIRGrd_ATA2
      AnimationMode = LOOP
      TransitionKey = TRANS_FiringHurt
    End

    TransitionState = TRANS_Standing TRANS_Firing
      Animation = UIRGrd_SKL.UIRGrd_ATAST
      AnimationMode = ONCE
    End

    TransitionState = TRANS_Firing TRANS_Standing
      Animation = UIRGrd_SKL.UIRGrd_ATAED
      AnimationMode = ONCE
    End

    TransitionState = TRANS_StandingHurt TRANS_FiringHurt
      Animation = UIRGrd_SKL.UIRGrd_ATA2ED
      AnimationMode = ONCE_BACKWARDS
    End

    TransitionState = TRANS_FiringHurt TRANS_StandingHurt
      Animation = UIRGrd_SKL.UIRGrd_ATA2ED
      AnimationMode = ONCE
    End

    TransitionState = TRANS_Standing TRANS_StandingHurt
      Animation = UIRGrd_SKL.UIRGrd_ATA2ED
      AnimationMode = ONCE
    End

    

    ; ------- Bldg-capture

    ConditionState = UNPACKING
      Model             = UIRGrd_F_SKN
      Animation         = UIRGrd_F_SKL.UIRGrd_F_FDP1
      AnimationMode     = ONCE
    End
    AliasConditionState = UNPACKING REALLYDAMAGED

    ConditionState = RAISING_FLAG
      Model             = UIRGrd_F_SKN
      Animation         = UIRGrd_F_SKL.UIRGrd_F_FDP2
      AnimationMode     = ONCE
      TransitionKey     = TRANS_Raising
    End
    AliasConditionState = RAISING_FLAG REALLYDAMAGED

    ConditionState = PACKING
      Model             = UIRGrd_F_SKN
      Animation         = UIRGrd_F_SKL.UIRGrd_F_FDP1
      AnimationMode     = ONCE_BACKWARDS
      Flags             = START_FRAME_LAST
      TransitionKey     = TRANS_Packing
    End
    AliasConditionState = PACKING REALLYDAMAGED

    TransitionState = TRANS_Raising TRANS_Packing
      Model             = UIRGrd_F_SKN
      Animation         = UIRGrd_F_SKL.UIRGrd_F_FDP2
      AnimationMode     = ONCE_BACKWARDS
      Flags             = START_FRAME_LAST
    End

  End

  ; ***DESIGN parameters ***
  DisplayName         = OBJECT:Rebel
  Side                = GLA
  EditorSorting       = INFANTRY
  TransportSlotCount  = 1                 ;how many "slots" we take in a transport (0 == not transportable)
 
  WeaponSet
    Conditions = None 
    Weapon = PRIMARY GLARebelMachineGun
  End
  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End
  VisionRange         = 150
  ShroudClearingRange = 300
  Prerequisites
    Object = GLABarracks
  End
  BuildCost = 150
  BuildTime = 5.0          ;in seconds  

  ExperienceValue     = 15 15 30 40     ;Experience point value at each level
  ExperienceRequired  = 0 40 60 120     ;Experience points needed to gain each level
  IsTrainable         = Yes             ;Can gain experience
  CrushableLevel      = 0  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles
  CommandSet          = GLAInfantryRebelCommandSet

  ; *** AUDIO Parameters ***
  VoiceSelect = RebelVoiceSelect
  VoiceMove = RebelVoiceMove
  VoiceGuard = RebelVoiceMove
  VoiceAttack = RebelVoiceAttack
  SoundStealthOn = StealthOn
  SoundStealthOff = StealthOff
  VoiceFear = RebelVoiceFear
  VoiceTaskComplete = RebelVoiceCaptureComplete
  UnitSpecificSounds
    VoiceCreate = RebelVoiceCreate
    VoiceSubdue = RebelVoiceSubdue
    VoiceGarrison = RebelVoiceGarrison
    VoiceEnter = RebelVoiceMove
    VoiceEnterHostile = RebelVoiceMove
    VoiceGetHealed      = RebelVoiceMove
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

  Locomotor = SET_NORMAL BasicHumanLocomotor

  Behavior = PhysicsBehavior ModuleTag_05
    Mass = 5.0
  End
  Behavior = StealthUpdate ModuleTag_07
    StealthDelay                = 2500 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY
    MoveThresholdSpeed          = 3
    InnateStealth               = No ;Requires upgrade first
    OrderIdleEnemiesToAttackMeUponReveal  = Yes
  End

  Behavior = WeaponBonusUpgrade ModuleTag_09
    TriggeredBy = Upgrade_GLAAPBullets
  End
  Behavior = StealthUpgrade ModuleTag_10
    TriggeredBy = Upgrade_GLACamouflage
  End

 
  Behavior = SquishCollide ModuleTag_11
    ;nothing
  End


; --- begin Death modules ---
  Behavior = SlowDeathBehavior ModuleTag_Death01
    DeathTypes          = ALL -CRUSHED -SPLATTED -EXPLODED -BURNED -POISONED -POISONED_BETA -POISONED_GAMMA
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_RebelDie
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
    FX                  = INITIAL FX_RebelDie
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

  Behavior = SpecialAbility ModuleTag_17
    SpecialPowerTemplate      = SpecialAbilityRebelCaptureBuilding
    UpdateModuleStartsAttack  = Yes
    StartsPaused              = Yes
    InitiateSound         = RebelVoiceCapture
  End
  Behavior = SpecialAbilityUpdate ModuleTag_18
    SpecialPowerTemplate  = SpecialAbilityRebelCaptureBuilding
    StartAbilityRange  = 5.0
    UnpackTime            = 3000  ; (changing this will scale anim speed)
    PreparationTime       = 20000 ; time to complete hack once prepared (changing this will scale anim speed)
    PackTime              = 2000  ; (changing this will scale anim speed)
    DoCaptureFX           = Yes
    AwardXPForTriggering  = 12
    ;SkillPointsForTriggering = ???  -- Dustin, fill me out if you want different balance values.
  End

  Behavior = UnpauseSpecialPowerUpgrade ModuleTag_19
    SpecialPowerTemplate = SpecialAbilityRebelCaptureBuilding
    TriggeredBy = Upgrade_InfantryCaptureBuilding
  End

  Behavior = SpecialAbility ModuleTag_20
    SpecialPowerTemplate = SpecialAbilityBoobyTrap
    UpdateModuleStartsAttack = Yes
    StartsPaused              = Yes
    InitiateSound = RebelVoiceBoobyTrapInstall
  End
  Behavior = SpecialAbilityUpdate ModuleTag_21
    SpecialPowerTemplate = SpecialAbilityBoobyTrap
    StartAbilityRange = 5.0
    PreparationTime = 0
    SpecialObject = BoobyTrap
    MaxSpecialObjects = 100
    SpecialObjectsPersistWhenOwnerDies = Yes
    SpecialObjectsPersistent = Yes          ;Charges are persistent till lifetime expires or owner detonates them.
; Not implemented    UniqueSpecialObjectTargets = Yes        ;This prevents multiple charges placed on the same object.
  End

  Behavior = UnpauseSpecialPowerUpgrade ModuleTag_22
    SpecialPowerTemplate = SpecialAbilityBoobyTrap
    TriggeredBy = Upgrade_GLAInfantryRebelBoobyTrapAttack
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

;------------------------------------------------------------------------------
Weapon GLARebelMachineGun
  PrimaryDamage         = 5.0
  PrimaryDamageRadius   = 0.0       ; 0 primary radius means "hits only intended victim"
  AttackRange           = 100.0
  DamageType            = SMALL_ARMS
  DeathType             = NORMAL
  WeaponSpeed           = 999999.0          ; dist/sec (huge value == effectively instant)
  ProjectileObject      = NONE
  FireFX                = WeaponFX_GenericMachineGunFire
  VeterancyFireFX       = HEROIC WeaponFX_GenericMachineGunFireWithRedTracers ; Heroic rebels get different FireFX
  FireSound             = RebelWeapon
  RadiusDamageAffects   = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots     = 100               ; time between shots, msec
  ClipSize              = 3                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime        = 700              ; how long to reload a Clip, msec
  WeaponBonus           = PLAYER_UPGRADE DAMAGE 125% ; AP weapon upgrade
End
