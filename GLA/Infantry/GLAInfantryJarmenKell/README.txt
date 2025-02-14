Object GLAInfantryJarmenKell

  ; *** ART Parameters ***
  SelectPortrait         = SUJermanKell1_L  ;NOTE: Asset spelling mistake
  ButtonImage            = SUJermanKell1
  
  UpgradeCameo1 = Upgrade_GLAAPBullets
  ;UpgradeCameo2 = NONE
  ;UpgradeCameo3 = NONE
  ;UpgradeCameo4 = NONE
  ;UpgradeCameo5 = NONE
  
  Draw = W3DModelDraw ModuleTag_01
    OkToChangeModelColor = Yes

    ; --- idle
    DefaultConditionState
      Model             = UIHERO_SKN
      IdleAnimation     = UIHERO_SKL.UIHERO_STA 0 21
      IdleAnimation     = UIHERO_SKL.UIHERO_IDA
      IdleAnimation     = UIHERO_SKL.UIHERO_IDB
      AnimationMode     = ONCE
      WeaponFireFXBone  = PRIMARY Muzzle
      WeaponMuzzleFlash = PRIMARY MuzzleFX
      TransitionKey     = TRANS_Stand
    End

    ConditionState      = REALLYDAMAGED
      IdleAnimation     = UIHERO_SKL.UIHERO_ISTA 0 30
      IdleAnimation     = UIHERO_SKL.UIHERO_IIDA
      IdleAnimation     = UIHERO_SKL.UIHERO_IIDB
      AnimationMode     = ONCE
      TransitionKey     = TRANS_StandInjured
    End

    TransitionState     = TRANS_Stand TRANS_StandInjured
      Animation         = UIHERO_SKL.UIHERO_ISTAHIT
      AnimationMode     = ONCE
    End

    ; --- attack

    ConditionState      = FIRING_A 
      Animation         = UIHERO_SKL.UIHERO_ATA 
      AnimationMode     = ONCE
      TransitionKey     = TRANS_FiringA
      AnimationSpeedFactorRange = 1.5 1.5
    End

    ConditionState      = BETWEEN_FIRING_SHOTS_A
      Animation         = UIHERO_SKL.UIHERO_STA
      AnimationMode     = ONCE
      WaitForStateToFinishIfPossible = TRANS_FiringA
    End
    AliasConditionState = RELOADING_A
  
    ConditionState      = FIRING_A REALLYDAMAGED
      Animation         = UIHERO_SKL.UIHERO_IATA2
      AnimationMode     = ONCE
      TransitionKey     = TRANS_FiringAInjured
      AnimationSpeedFactorRange = 1.5 1.5
    End

    ConditionState      = BETWEEN_FIRING_SHOTS_A REALLYDAMAGED
      Animation         = UIHERO_SKL.UIHERO_IATA2
      AnimationMode     = MANUAL
      Flags             = START_FRAME_LAST
      WaitForStateToFinishIfPossible = TRANS_FiringAInjured
    End
    AliasConditionState = RELOADING_A REALLYDAMAGED

    TransitionState     = TRANS_FiringA TRANS_FiringAInjured
      Animation         = UIHERO_SKL.UIHERO_IATAHIT
      AnimationMode     = ONCE
    End

    ; --- moving
    ConditionState      = MOVING
      Animation         = UIHERO_SKL.UIHERO_RNA2 30
      AnimationMode     = LOOP
      Flags             = RANDOMSTART
      TransitionKey     = None
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = MOVING FIRING_A
    AliasConditionState = MOVING BETWEEN_FIRING_SHOTS_A
    AliasConditionState = MOVING RELOADING_A
    AliasConditionState = MOVING DOCKING
    AliasConditionState = MOVING DOCKING_BEGINNING
    AliasConditionState = MOVING DOCKING_ACTIVE

    ConditionState      = MOVING REALLYDAMAGED
      Animation         = UIHERO_SKL.UIHERO_IRNA 30
      AnimationMode     = LOOP
      Flags             = RANDOMSTART
      TransitionKey     = None
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = MOVING FIRING_A REALLYDAMAGED
    AliasConditionState = MOVING BETWEEN_FIRING_SHOTS_A REALLYDAMAGED
    AliasConditionState = MOVING RELOADING_A REALLYDAMAGED
    
    ; --- cheering
    ConditionState      = SPECIAL_CHEERING
      Animation         = UIHERO_SKL.UIHERO_CHA
      AnimationMode     = LOOP
    End

    ConditionState      = SPECIAL_CHEERING REALLYDAMAGED
      Animation         = UIHERO_SKL.UIHERO_ICHA
      AnimationMode     = LOOP
    End
    
    ; --- dying
    ConditionState      = DYING
      Animation         = UIHERO_SKL.UIHERO_DTA
      Animation         = UIHERO_SKL.UIHERO_DTB
      Animation         = UIHERO_SKL.UIHERO_IDTA
      Animation         = UIHERO_SKL.UIHERO_IDTB
      AnimationMode     = ONCE
      TransitionKey     = TRANS_Dying
    End

    TransitionState     = TRANS_Dying TRANS_Flailing
      Animation         = UIHERO_SKL.UIHERO_ADTG21
      AnimationMode     = ONCE
    End

    ConditionState      = DYING EXPLODED_FLAILING
      Animation         = UIHERO_SKL.UIHERO_ADTG22
      AnimationMode     = LOOP
      TransitionKey     = TRANS_Flailing
    End

    ConditionState      = DYING EXPLODED_BOUNCING
      Animation         = UIHERO_SKL.UIHERO_ADTG23
      AnimationMode     = ONCE
      TransitionKey     = None
    End
    
    ; --- falling
    ConditionState      = FREEFALL
      Animation         = UIHERO_SKL.UIHERO_PFL
      AnimationMode     = LOOP
      TransitionKey     = TRANS_Falling
    End
    AliasConditionState = FREEFALL REALLYDAMAGED
    AliasConditionState = FREEFALL DYING

    ConditionState      = PARACHUTING
      Animation         = UIHERO_SKL.UIHERO_PHG
      AnimationMode     = LOOP
      Flags             = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
      TransitionKey     = TRANS_Chute
    End
    AliasConditionState = PARACHUTING REALLYDAMAGED
    AliasConditionState = PARACHUTING DYING

    TransitionState     = TRANS_Falling TRANS_Chute
      Animation         = UIHERO_SKL.UIHERO_POP
      AnimationMode     = ONCE
      Flags             = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
    End

    TransitionState     = TRANS_Chute TRANS_Stand
      Animation         = UIHERO_SKL.UIHERO_PTD
      AnimationMode     = ONCE
    End

    TransitionState     = TRANS_Chute TRANS_StandInjured
      Animation         = UIHERO_SKL.UIHERO_PTD
      AnimationMode     = ONCE
    End
    
  End

  ; ***DESIGN parameters ***
  DisplayName           = OBJECT:JarmenKell
  Side                  = GLA
  EditorSorting         = INFANTRY
  TransportSlotCount    = 1                 ;how many "slots" we take in a transport (0 == not transportable)
  MaxSimultaneousOfType = 1
 
  WeaponSet
    Conditions = None 
    Weapon = PRIMARY GLAJarmenKellRifle
    Weapon = SECONDARY GLAJarmenKellVehiclePilotSniperRifle
    AutoChooseSources = SECONDARY NONE
  End

  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End
  VisionRange         = 200
  ShroudClearingRange = 400
  Prerequisites
    Object = GLABarracks
    Object = GLAPalace
  End
  BuildCost = 1500
  BuildTime = 20.0          ;in seconds  

  ExperienceValue     = 50 50 100 150    ;Experience point value at each level
  ExperienceRequired  = 0 100 200 400  ;Experience points needed to gain each level
  IsTrainable         = Yes             ;Can gain experience
  CrushableLevel      = 2  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles
  CommandSet          = GLAInfantryJarmenKellCommandSet

  ; *** AUDIO Parameters ***
  VoiceSelect = JarmenKellVoiceSelect
  VoiceMove = JarmenKellVoiceMove
  VoiceGuard = JarmenKellVoiceMove
  VoiceAttack = JarmenKellVoiceAttack
  VoiceFear = JarmenKellVoiceFear
  SoundStealthOn = StealthOn
  SoundStealthOff = StealthOff
  
  UnitSpecificSounds
    VoiceCreate          = JarmenKellVoiceCreate
    VoiceSnipePilot      = JarmenKellVoiceSnipe
    VoiceGarrison = JarmenKellVoiceGarrison
    VoiceEnter = JarmenKellVoiceMove
    VoiceEnterHostile = JarmenKellVoiceMove
    VoiceGetHealed      = JarmenKellVoiceMove
  End


  ; *** ENGINEERING Parameters ***
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK ATTACK_NEEDS_LINE_OF_SIGHT CAN_CAST_REFLECTIONS INFANTRY SALVAGER STEALTH_GARRISON SCORE HERO CANNOT_RETALIATE

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 200.0
    InitialHealth   = 200.0
  End

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes
  End
  Locomotor = SET_NORMAL JarmenKellLocomotor

  Behavior = PhysicsBehavior ModuleTag_04
    Mass = 5.0
  End
  Behavior = StealthUpdate ModuleTag_06
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes
    EnemyDetectionEvaEvent      = EnemyJarmenKellDetected
    OwnDetectionEvaEvent        = OwnJarmenKellDetected
  End

  Behavior = CommandButtonHuntUpdate  ModuleTag_07 ; allows use of command button hunt script with this unit. 
  End

  Behavior = WeaponBonusUpgrade ModuleTag_08
    TriggeredBy = Upgrade_GLAAPBullets
  End
 
  ;Hero units can't be squished!
  ;Behavior = SquishCollide ModuleTag_09
  ;  ;nothing
  ;End


; --- begin Death modules ---
  Behavior = SlowDeathBehavior ModuleTag_Death01
    DeathTypes          = ALL -CRUSHED -SPLATTED -EXPLODED -BURNED -POISONED -POISONED_BETA -POISONED_GAMMA
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_JarmenKellDie
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
    FX                  = INITIAL FX_JarmenKellDie
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

;------------------------------------------------------------------------------
Weapon GLAJarmenKellRifle
  PrimaryDamage = 180.0
  PrimaryDamageRadius = 0.0
  AttackRange = 225.0
  DamageType = SNIPER
  DeathType = NORMAL
  WeaponSpeed = 999999.0          ; dist/sec (huge value == effectively instant)
  ProjectileObject = NONE
  FireFX = WeaponFX_GenericMachineGunFire
  FireSound = JarmenKellWeapon
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 1000               ; time between shots, msec
  ClipSize = 0                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 0              ; how long to reload a Clip, msec
  WeaponBonus = PLAYER_UPGRADE DAMAGE 125% ; AP weapon upgrade
End

;------------------------------------------------------------------------------
Weapon GLAJarmenKellVehiclePilotSniperRifle
  PrimaryDamage = 1.0
  PrimaryDamageRadius = 0.0
  AttackRange = 225.0
  DamageType = KILL_PILOT
  DeathType = NORMAL
  WeaponSpeed = 999999.0          ; dist/sec (huge value == effectively instant)
  ProjectileObject = NONE
  FireFX                = WeaponFX_GenericMachineGunFire
  VeterancyFireFX       = HEROIC WeaponFX_GenericMachineGunFireWithRedTracers
  FireSound = JarmenKellWeaponSnipe
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 0           ; time between shots, msec
  ClipSize = 1                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 30000          ; how long to reload a Clip, msec
  AutoReloadsClip = Yes
End
