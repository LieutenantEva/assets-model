Object GLAInfantryTerrorist

; *** ART Parameters ***
  SelectPortrait         = SUTerrorist_L
  ButtonImage            = SUTerrorist
  
  ;UpgradeCameo1 = NONE
  ;UpgradeCameo2 = NONE
  ;UpgradeCameo3 = NONE
  ;UpgradeCameo4 = NONE
  ;UpgradeCameo5 = NONE

  Draw = W3DModelDraw ModuleTag_01
    OkToChangeModelColor = Yes
    DefaultConditionState
      Model = UITRST_SKN
      IdleAnimation = UITRST_SKL.UITRST_STA 0 25
      ;Regular spice animations
      IdleAnimation = UITRST_SKL.UITRST_IDA
      IdleAnimation = UITRST_SKL.UITRST_IDB
      AnimationMode = ONCE
      TransitionKey = TRANS_Stand
    End

    ConditionState = REALLYDAMAGED
      Animation = UITRST_SKL.UITRST_STA
      AnimationMode = LOOP
      TransitionKey = TRANS_Stand
    End

    ConditionState = FREEFALL
      Animation = UITRST_SKL.UITRST_PFL
      AnimationMode = LOOP
      TransitionKey = TRANS_Falling
    End
    AliasConditionState = FREEFALL REALLYDAMAGED
    AliasConditionState = FREEFALL DYING

    ConditionState = PARACHUTING
      Animation = UITRST_SKL.UITRST_PHG
      AnimationMode = LOOP
      Flags = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
      TransitionKey = TRANS_Chute
    End
    AliasConditionState = PARACHUTING REALLYDAMAGED
    AliasConditionState = PARACHUTING DYING

    ConditionState = MOVING
      Animation = UITRST_SKL.UITRST_RNA 15
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey = None
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = MOVING REALLYDAMAGED

    ConditionState = ATTACKING MOVING
      Animation = UITRST_SKL.UITRST_RNB 10
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey = None
    End
    AliasConditionState = ATTACKING MOVING REALLYDAMAGED

    ConditionState = PREATTACK_A
      Animation = UITRST_SKL.UITRST_ATA
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_A MOVING
 
    ConditionState = DYING
      Animation = UITRST_SKL.UITRST_DTA
      Animation = UITRST_SKL.UITRST_DTC
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = UITRST_SKL.UITRST_ADTE1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = UITRST_SKL.UITRST_ADTE2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = UITRST_SKL.UITRST_ADTE3
      AnimationMode = ONCE
      TransitionKey = None
    End

    ConditionState = SPECIAL_CHEERING
      Animation = UITRST_SKL.UITRST_CHA
      AnimationMode = LOOP
    End

    TransitionState = TRANS_Falling TRANS_Chute
      Animation = UITRST_SKL.UITRST_POP
      AnimationMode = ONCE
      Flags = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
    End

    TransitionState = TRANS_Chute TRANS_Stand
      Animation = UITRST_SKL.UITRST_PTD
      AnimationMode = ONCE
    End

  End

  ; ***DESIGN parameters ***
  DisplayName      = OBJECT:Terrorist
  Side = GLA
  EditorSorting = INFANTRY
  TransportSlotCount = 1                 ;how many "slots" we take in a transport (0 == not transportable)
  WeaponSet
    Conditions = None 
    ;Kill himself so we can use FireWeaponWhenDead to fire the real weapon -- and use UNRESISTABLE
    ;damage to do ini logic for type of death to play -- unresistable for success.
    Weapon = PRIMARY TerroristSuicideWeapon 
  End
  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End
  VisionRange = 150
  ShroudClearingRange = 200
  Prerequisites
    Object = GLABarracks
  End
  BuildCost = 200
  BuildTime = 5.0          ;in seconds    
  CrushableLevel         = 0  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles
  CommandSet    = GLAInfantryTerroristCommandSet

  ; *** AUDIO Parameters ***
  VoiceSelect = TerroristVoiceSelect
  VoiceMove = TerroristVoiceMove
  VoiceAttack = TerroristVoiceAttack
  VoiceFear = TerroristVoiceFear
  VoiceGuard = TerroristVoiceMove
  UnitSpecificSounds
    VoiceGarrison         = TerroristVoiceMove
    VoiceCreate           = TerroristVoiceCreate
    VoiceEnter            = TerroristVoiceEnter
    VoiceEnterHostile     = TerroristVoiceEnterHostile
    VoiceGetHealed      = TerroristVoiceMove
  End

  ; *** ENGINEERING Parameters ***
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK ATTACK_NEEDS_LINE_OF_SIGHT CAN_CAST_REFLECTIONS INFANTRY SALVAGER SCORE

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 120.0
    InitialHealth   = 120.0
  End

  ExperienceValue     = 20 20 20 20  ; Experience point value at each level

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes
  End
  Behavior = CommandButtonHuntUpdate  ModuleTag_CBH01 ; allows use of command button hunt script with this unit. 
  End

  Locomotor = SET_NORMAL FastHumanLocomotor
  Behavior = PhysicsBehavior ModuleTag_04
    Mass = 5.0
  End

  ;Kris
  Behavior = ConvertToCarBombCrateCollide       ModuleTag_06
    RequiredKindOf    = VEHICLE      ; we only give our bonus to VEHICLEs we collide with
    ;ForbiddenKindOf  = TRANSPORT DOZER  ; but not to TRANSPORTs or DOZERs!
    FXList            = FX_MakeCarBombSuccess
  End
 
  Behavior = SquishCollide ModuleTag_07
    ;nothing
  End

; --- begin Death modules ---
  Behavior = SlowDeathBehavior ModuleTag_Death01
    DeathTypes          = ALL  -SUICIDED -POISONED -POISONED_BETA -POISONED_GAMMA
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_TerroristDie
  End


  ;POISON_DEATHS POISON_DEATHS POISON_DEATHS POISON_DEATHS
  Behavior = SlowDeathBehavior ModuleTag_Death02
    DeathTypes          = NONE +POISONED
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinGLA
    OCL                 = INITIAL OCL_ToxicInfantry_TerroristOnly
  End
  Behavior = SlowDeathBehavior ModuleTag_Death06 ; don't forget to give it a new, unique module tag
    DeathTypes          = NONE +POISONED_BETA
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinGLA
    OCL                 = INITIAL OCL_ToxicInfantryBeta_TerroristOnly ;you'll have to create this OCL and make it use the blue guys instead of green ones
  End
  Behavior = SlowDeathBehavior ModuleTag_Death07
    DeathTypes          = NONE +POISONED_GAMMA
    DestructionDelay    = 0
    FX                  = INITIAL FX_DieByToxinGLA
    OCL                 = INITIAL OCL_ToxicInfantryGamma_TerroristOnly
  End

  ;POISON_DEATHS POISON_DEATHS POISON_DEATHS POISON_DEATHS


  ; I have just pulled my ripcord, and this ain't no parachute!
  Behavior = SlowDeathBehavior ModuleTag_Death03
    DeathTypes          = NONE +SUICIDED
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_TerroristExplode
    FlingForce          = 8
    FlingForceVariance  = 3
    FlingPitch          = 60
    FlingPitchVariance  = 10
  End
  Behavior = FireWeaponWhenDeadBehavior ModuleTag_Death04
    DeathWeapon   = SuicideDynamitePack
    StartsActive  = Yes                      ; turned on by upgrade
    DeathTypes = NONE +SUICIDED +CRUSHED +SPLATTED +LASERED +BURNED +EXPLODED
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
Locomotor FastHumanLocomotor
  Surfaces = GROUND RUBBLE
  Speed = 25 ;30                ; in dist/sec
  SpeedDamaged = 15 ;30         ; in dist/sec
  TurnRate = 500            ; in degrees/sec
  TurnRateDamaged = 500     ; in degrees/sec
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
; This weapon kills itself (to presumably trigger detonations on death)
Weapon TerroristSuicideWeapon
  LeechRangeWeapon = Yes
  AttackRange = 1.0
  PrimaryDamage = 999999.0            
  PrimaryDamageRadius = 1.0      
  DamageDealtAtSelfPosition = Yes   ; this is a suicide bomber... remember?
  RadiusDamageAffects = SELF SUICIDE
  DamageType = EXPLOSION
  DeathType = SUICIDED
  WeaponSpeed = 99999.0             
  DelayBetweenShots = 0              
  ClipSize = 1                        
  ClipReloadTime = 0                  
  AutoReloadsClip = No 
  ;PreAttackDelay = 600             ;766 matches the animation timing his detonating
End

;------------------------------------------------------------------------------
Weapon SuicideDynamitePack
  PrimaryDamage = 500.0           ;was 150.0
  PrimaryDamageRadius = 18.0      ;was 6.0
  SecondaryDamage = 300.0         ;was 30.0
  SecondaryDamageRadius = 50.0    ;was 25.0
  AttackRange = 5.0       ; must be very close to use this weapon!
  DamageType = EXPLOSION
  DeathType = SUICIDED
  WeaponSpeed = 99999.0             
  ProjectileObject = NONE
  DamageDealtAtSelfPosition = Yes   ; this is a suicide bomber... remember?
  RadiusDamageAffects = SELF SUICIDE ALLIES ENEMIES NEUTRALS NOT_SIMILAR
  DelayBetweenShots = 0              
  ClipSize = 1                        
  ClipReloadTime = 0                  
  AutoReloadsClip = No 
  FireFX = WeaponFX_SuicideDynamitePackDetonation
  FireSound = CarBomberDie
End
