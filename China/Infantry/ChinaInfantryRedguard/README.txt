Object ChinaInfantryRedguard

  ; *** ART Parameters ***
  SelectPortrait         = SNRedGuard_L  
  ButtonImage            = SNRedGuard_L
  
  UpgradeCameo1 = Upgrade_Nationalism
  UpgradeCameo2 = Upgrade_InfantryCaptureBuilding
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

    ; ------- Standing-Around Animations
 
    DefaultConditionState
      Model               = NICNSC_SKN
      IdleAnimation       = NICNSC_SKL.NICNSC_STA 0 35
      IdleAnimation       = NICNSC_SKL.NICNSC_IDA
      IdleAnimation       = NICNSC_SKL.NICNSC_IDB
      AnimationMode       = ONCE
      WeaponFireFXBone    = PRIMARY Muzzle
      WeaponMuzzleFlash   = PRIMARY MuzzleFX
      TransitionKey       = TRANS_Stand
    End

    ConditionState        = REALLYDAMAGED
      IdleAnimation       = NICNSC_SKL.NICNSC_STB
      AnimationMode       = ONCE
      TransitionKey       = TRANS_StandDamaged
    End

    ; ------- Machine Gun Animations

    ConditionState      = USING_WEAPON_A 
      Animation         = NICNSC_SKL.NICNSC_ATA
      AnimationMode     = LOOP
      TransitionKey     = TRANS_Firing
    End

    ConditionState      = USING_WEAPON_A REALLYDAMAGED
      Animation         = NICNSC_SKL.NICNSC_ATC
      AnimationMode     = LOOP
      TransitionKey     = TRANS_FiringDamaged
    End


    ; ------- Firing-related Transitions

    TransitionState   = TRANS_Firing TRANS_FiringDamaged
      Animation       = NICNSC_SKL.NICNSC_AA2AC
      AnimationMode   = ONCE
    End

    TransitionState   = TRANS_Stand TRANS_Firing
      Animation       = NICNSC_SKL.NICNSC_SA2AA
      AnimationMode   = ONCE
    End

    TransitionState   = TRANS_Firing TRANS_Stand
      Animation       = NICNSC_SKL.NICNSC_AA2SA
      AnimationMode   = ONCE
    End

    TransitionState   = TRANS_StandDamaged TRANS_FiringDamaged
      Animation       = NICNSC_SKL.NICNSC_ATCST
      AnimationMode   = ONCE
    End

    TransitionState   = TRANS_FiringDamaged TRANS_StandDamaged
      Animation       = NICNSC_SKL.NICNSC_ATCED
      AnimationMode   = ONCE
    End


    ; ------------- Damage Transitions --------------------
    TransitionState = TRANS_StandDamaged TRANS_RunDamaged
      Animation       = NICNSC_SKL.NICNSC_AA2AC
      AnimationMode   = ONCE
      AnimationSpeedFactorRange = 2 2
    End
    TransitionState = TRANS_RunDamaged TRANS_StandDamaged 
      Animation       = NICNSC_SKL.NICNSC_AA2AC
      AnimationMode   = ONCE_BACKWARDS
      AnimationSpeedFactorRange = 2 2
      Flags           = START_FRAME_LAST
    End
    TransitionState = TRANS_Stand TRANS_StandDamaged 
      Animation       = NICNSC_SKL.NICNSC_AA2SA
      AnimationMode   = ONCE_BACKWARDS
      AnimationSpeedFactorRange = 4 5
      Flags           = START_FRAME_LAST
    End




    ; ------- Bayonet Animations

    ConditionState    = PREATTACK_C 
      Animation       = NICNSC_SKL.NICNSC_ATB1
      AnimationMode   = ONCE
      TransitionKey   = TRANS_Stab
    End
    AliasConditionState = PREATTACK_C MOVING
    AliasConditionState = PREATTACK_C FIRING_C
    AliasConditionState = PREATTACK_C BETWEEN_FIRING_SHOTS_C

    ConditionState      = FIRING_C
      Animation         = NICNSC_SKL.NICNSC_ATB2
      AnimationMode     = ONCE
      ; this is basically a trick: this guy has a nontrivial animation for firing,
      ; and a long recycle time between shots. we want him to finish his fire animation
      ; (unless he's ordered to do something else), so this is just a handy trick that
      ; says, "if the previous state had this transition key, allow it to finish before
      ; switching to us, if possible".
      WaitForStateToFinishIfPossible = TRANS_Stab
    End
    AliasConditionState = BETWEEN_FIRING_SHOTS_C
    AliasConditionState = RELOADING_C

    ; ------- Parachuting Animations

    ConditionState    = FREEFALL
      Animation       = NICNSC_SKL.NICNSC_POP
      AnimationMode   = MANUAL
      Flags           = START_FRAME_FIRST
      TransitionKey   = TRANS_Falling
    End
    AliasConditionState = FREEFALL REALLYDAMAGED
    AliasConditionState = FREEFALL DYING

    ConditionState    = PARACHUTING
      Animation       = NICNSC_SKL.NICNSC_PHG
      AnimationMode   = LOOP
      Flags           = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
      TransitionKey   = TRANS_Chute
    End
    AliasConditionState = PARACHUTING REALLYDAMAGED
    AliasConditionState = PARACHUTING DYING

    TransitionState   = TRANS_Falling TRANS_Chute
      Animation       = NICNSC_SKL.NICNSC_POP
      AnimationMode   = ONCE
      Flags           = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
    End

    TransitionState   = TRANS_Chute TRANS_Stand
      Animation       = NICNSC_SKL.NICNSC_PTD
      AnimationMode   = ONCE
    End

    ; ------- Movement Animations

    ConditionState      = MOVING
      Animation         = NICNSC_SKL.NICNSC_RNA 26
      AnimationMode     = LOOP
      Flags             = RANDOMSTART
      TransitionKey     = None
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = MOVING ATTACKING

    ConditionState = MOVING REALLYDAMAGED
      Animation         = NICNSC_SKL.NICNSC_RNB 28
      AnimationMode     = LOOP
      Flags             = RANDOMSTART
      TransitionKey     = TRANS_RunDamaged
      TransitionKey     = None
    End
    AliasConditionState = MOVING ATTACKING REALLYDAMAGED

    ; ------- Bldg-capture

    ConditionState      = UNPACKING
      Model             = NICNSC_F_SKN
      Animation         = NICNSC_F_SKL.NICNSC_F_FDP1
      AnimationMode     = ONCE
    End
    AliasConditionState = UNPACKING REALLYDAMAGED

    ConditionState      = RAISING_FLAG
      Model             = NICNSC_F_SKN
      Animation         = NICNSC_F_SKL.NICNSC_F_FDP2
      AnimationMode     = ONCE
      TransitionKey     = TRANS_Raising
    End
    AliasConditionState = RAISING_FLAG REALLYDAMAGED

    ConditionState      = PACKING
      Model             = NICNSC_F_SKN
      Animation         = NICNSC_F_SKL.NICNSC_F_FDP1
      AnimationMode     = ONCE_BACKWARDS
      Flags             = START_FRAME_LAST
      TransitionKey     = TRANS_Packing
    End
    AliasConditionState = PACKING REALLYDAMAGED

    TransitionState     = TRANS_Raising TRANS_Packing
      Model             = NICNSC_F_SKN
      Animation         = NICNSC_F_SKL.NICNSC_F_FDP2
      AnimationMode     = ONCE_BACKWARDS
      Flags             = START_FRAME_LAST
    End

    ; ------- Dying Animations

    ConditionState      = DYING
      Animation         = NICNSC_SKL.NICNSC_DTA
      Animation         = NICNSC_SKL.NICNSC_DTB
      AnimationMode     = ONCE
      TransitionKey     = TRANS_Dying
    End

    TransitionState     = TRANS_Dying TRANS_Flailing
      Animation         = NICNSC_SKL.NICNSC_ATDE1
      AnimationMode     = ONCE
    End

    ConditionState      = DYING EXPLODED_FLAILING
      Animation         = NICNSC_SKL.NICNSC_ATDE2
      AnimationMode     = LOOP
      TransitionKey     = TRANS_Flailing
    End

    ConditionState      = DYING EXPLODED_BOUNCING
      Animation         = NICNSC_SKL.NICNSC_ATDE3
      AnimationMode     = ONCE
      TransitionKey     = None
    End

    ; ------- Misc Animations

    ConditionState      = SPECIAL_CHEERING
      Animation         = NICNSC_SKL.NICNSC_CHA
      AnimationMode     = LOOP
    End

  End

  ; ***DESIGN parameters ***
  DisplayName         = OBJECT:Redguard
  Side                = China
  EditorSorting       = INFANTRY
  TransportSlotCount  = 1                 ;how many "slots" we take in a transport (0 == not transportable)
  WeaponSet
    Conditions = None 
    Weapon = PRIMARY RedguardMachineGun
  End
  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End
  VisionRange = 100
  ShroudClearingRange = 200
  Prerequisites
    Object = ChinaBarracks
  End
  BuildCost     = 300
  BuildTime     = 10.0          ;in seconds      

  ExperienceValue = 5 5 10 20   ;Experience point value at each level
  ExperienceRequired = 0 20 40 80  ;Experience points needed to gain each level
  IsTrainable = Yes             ;Can gain experience
  CrushableLevel         = 0  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles
  CommandSet    = ChinaInfantryRedguardCommandSet

  ; *** AUDIO Parameters ***
  VoiceSelect = RedGuardVoiceSelect
  VoiceMove = RedGuardVoiceMove
  VoiceGuard = RedGuardVoiceMove
  VoiceAttack = RedGuardVoiceAttack
  VoiceGroupSelect = BattleCrySound
  VoiceFear = RedGuardVoiceFear
  VoiceTaskComplete = RedGuardVoiceCaptureComplete
  UnitSpecificSounds
    VoiceMelee      = RedGuardVoiceAttackBayonet
    VoiceGarrison   = RedGuardVoiceGarrison
    VoiceCreate     = RedGuardVoiceCreate
    VoiceSubdue     = RedGuardVoiceSubdue
    VoiceEnter      = RedGuardVoiceMove
    VoiceEnterHostile = RedGuardVoiceMove
    VoiceGetHealed      = RedGuardVoiceMove
  End

  ; *** ENGINEERING Parameters ***
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK ATTACK_NEEDS_LINE_OF_SIGHT CAN_CAST_REFLECTIONS INFANTRY SCORE PARACHUTABLE

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 120.0
    InitialHealth   = 120.0
  End

  Behavior = VeterancyGainCreate ModuleTag_03
    StartingLevel = VETERAN
    ScienceRequired = SCIENCE_RedGuardTraining
  End

  Behavior = AIUpdateInterface ModuleTag_04
    AutoAcquireEnemiesWhenIdle = Yes
  End

  Behavior = CommandButtonHuntUpdate  ModuleTag_05 ; allows use of command button hunt script with this unit. 
  End

  Locomotor = SET_NORMAL RedguardLocomotor

  Behavior = HordeUpdate ModuleTag_06
    RubOffRadius = 60    ; if I am this close to a real hordesman, I will get to be an honorary hordesman
    UpdateRate = 1000    ; how often to recheck horde status (msec)
    Radius = 30          ; how close other units must be to us to count towards our horde-ness (~30 feet or so)
    KindOf = INFANTRY    ; what KindOf's must match to count towards horde-ness
    AlliesOnly = Yes     ; do we only count allies towards horde status? 
    ExactMatch = No      ; do we only count units of our exact same type towards horde status? (overrides kindof)
    Count = 5            ; how many units must be within Radius to grant us horde-ness
    Action = HORDE       ; when horde-ing, grant us the HORDE bonus
  End
  Behavior = PhysicsBehavior ModuleTag_07
    Mass = 5.0
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
    FX                  = INITIAL FX_RedGuardDie
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
    FX                  = INITIAL FX_RedGuardDie
    FlingForce          = 8
    FlingForceVariance  = 3
    FlingPitch          = 60
    FlingPitchVariance  = 10
  End
  Behavior = SlowDeathBehavior ModuleTag_Death04
    DeathTypes          = NONE +BURNED
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByFireChina
    OCL                 = INITIAL OCL_FlamingInfantry
  End
  Behavior = SlowDeathBehavior ModuleTag_Death05
    DeathTypes          = NONE +POISONED
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinChina
    OCL                 = INITIAL OCL_ToxicInfantry
  End
  Behavior = SlowDeathBehavior ModuleTag_Death06 ; don't forget to give it a new, unique module tag
    DeathTypes          = NONE +POISONED_BETA
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinChina
    OCL                 = INITIAL OCL_ToxicInfantryBeta ;you'll have to create this OCL and make it use the blue guys instead of green ones
  End

  Behavior = SlowDeathBehavior ModuleTag_Death07
    DeathTypes          = NONE +POISONED_GAMMA
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinChina
    OCL                 = INITIAL OCL_ToxicInfantryGamma
  End
; --- end Death modules ---

  Behavior = PoisonedBehavior ModuleTag_15
    PoisonDamageInterval = 100  ; Every this many msec I will retake the poison damage dealt me...
    PoisonDuration = 3000       ; ... for this long after last hit by poison damage
  End

  Behavior = SpecialAbility ModuleTag_16
    SpecialPowerTemplate      = SpecialAbilityRedGuardCaptureBuilding
    UpdateModuleStartsAttack  = Yes
    StartsPaused              = Yes
    InitiateSound         = RedGuardVoiceCapture
  End
  Behavior = SpecialAbilityUpdate ModuleTag_17
    SpecialPowerTemplate  = SpecialAbilityRedGuardCaptureBuilding
    StartAbilityRange  = 5.0
    UnpackTime            = 3000  ; (changing this will scale anim speed)
    PreparationTime       = 20000 ; time to complete hack once prepared (changing this will scale anim speed)
    PackTime              = 2000  ; (changing this will scale anim speed)
    DoCaptureFX           = Yes
    AwardXPForTriggering  = 4
    ;SkillPointsForTriggering = ???  -- Dustin, fill me out if you want different balance values.
  End

  Behavior = UnpauseSpecialPowerUpgrade ModuleTag_18
    SpecialPowerTemplate = SpecialAbilityRedGuardCaptureBuilding
    TriggeredBy = Upgrade_InfantryCaptureBuilding
  End

  Geometry = CYLINDER
  GeometryMajorRadius = 7.0
  GeometryMinorRadius = 7.0
  GeometryHeight = 12.0
  GeometryIsSmall = Yes
  Shadow = SHADOW_DECAL
  ShadowSizeX = 14;
  ShadowSizeY = 14;
  ShadowTexture = ShadowI;
  BuildCompletion = APPEARS_AT_RALLY_POINT

End

;------------------------------------------------------------------------------
Locomotor RedguardLocomotor
  Surfaces = GROUND RUBBLE
  Speed = 25 ;30                ; in dist/sec
  SpeedDamaged = 15 ;30         ; in dist/sec ;DEMO -- To allieviate skating appearence, wounded speed is same as normal
  TurnRate = 500            ; in degrees/sec
  TurnRateDamaged = 500     ; in degrees/sec
  Acceleration = 100        ; in dist/(sec^2)
  AccelerationDamaged = 50 ; in dist/(sec^2)
  Braking = 150             ; in dist/(sec^2)
  MinTurnSpeed = 0          ; in dist/sec
  ZAxisBehavior = NO_Z_MOTIVE_FORCE
  Appearance = TWO_LEGS
  StickToGround = Yes       ; walking guys aren't allowed to catch huge (or even small) air.
  GroupMovementPriority = MOVES_FRONT;   Moves in the back of a group, out of danger.
End

;------------------------------------------------------------------------------
Weapon RedguardMachineGun
  PrimaryDamage         = 15.0
  PrimaryDamageRadius   = 0.0       ; 0 primary radius means "hits only intended victim"
  AttackRange           = 100.0
  DamageType            = SMALL_ARMS
  DeathType             = NORMAL
  WeaponSpeed           = 999999.0          ; dist/sec (huge value == effectively instant)
  ProjectileObject      = NONE
  FireFX                = WeaponFX_GenericMachineGunFire
  VeterancyFireFX       = HEROIC WeaponFX_GenericMachineGunFireWithRedTracers
  FireSound             = RedGuardWeapon
  RadiusDamageAffects   = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots     = 1000               ; time between shots, msec
  ClipSize              = 0                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime        = 0              ; how long to reload a Clip, msec
End

;------------------------------------------------------------------------------
Weapon RedguardBayonet
  PrimaryDamage = 10000.0         ; always kills target in one hit
  PrimaryDamageRadius = 0.0       ; 0 primary radius means "hits only intended victim"
  AttackRange = 2.0
  DamageType = MELEE
  DeathType = NORMAL
  WeaponSpeed = 999999.0          ; dist/sec (huge value == effectively instant)
  ProjectileObject = NONE
  FireFX = WeaponFX_GenericMachineGunFire
  FireSound = HeroUSAKnifeAttack
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 1900        ; time between shots, msec
  ClipSize = 0                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 0              ; how long to reload a Clip, msec
  PreAttackDelay = 1400
  PreAttackType = PER_ATTACK ; Do the delay each time we attack a new target
End
