; Jason Bender sez:
; This unit is used in a mission for "color".
; This unit is never human-controllable!
;
Object ChinaInfantryOfficer

    ; *** ART Parameters ***
  Draw = W3DModelDraw ModuleTag_01
    OkToChangeModelColor = Yes

    ;NORMAL STANDING
    DefaultConditionState
      Model = NIOFCR_SKN
      IdleAnimation = NIOFCR_SKL.NIOFCR_STA 0 21
      ;Regular spice animations
      IdleAnimation = NIOFCR_SKL.NIOFCR_IDA
      IdleAnimation = NIOFCR_SKL.NIOFCR_IDB
      AnimationMode = ONCE
      WeaponFireFXBone = PRIMARY Muzzle
      WeaponMuzzleFlash = PRIMARY MuzzleFX
      TransitionKey = TRANS_STAND
    End

    ConditionState    = MOVING
      Animation       = NIOFCR_SKL.NIOFCR_RNA
      AnimationMode   = LOOP
      ParticleSysBone     = None InfantryDustTrails
    End

    ; NORMAL ATTACK
    ;--------------------------------------------------------
    ; Drawing gun
    ConditionState  = PREATTACK_A
      Animation     = NIOFCR_SKL.NIOFCR_ATAST
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_A MOVING
    AliasConditionState = PREATTACK_A FIRING_A
    AliasConditionState = PREATTACK_A BETWEEN_FIRING_SHOTS_A

    ; Firing gun
    ConditionState  = FIRING_A
      Animation     = NIOFCR_SKL.NIOFCR_ATALP
      AnimationMode = LOOP
      TransitionKey = TRANS_FIRING_A
    End
    ConditionState  = BETWEEN_FIRING_SHOTS_A
      Animation     = NIOFCR_SKL.NIOFCR_ATALP
      AnimationMode = LOOP
      TransitionKey = TRANS_FIRING_A
    End
    AliasConditionState = RELOADING_A
    AliasConditionState = MOVING FIRING_A
    AliasConditionState = MOVING BETWEEN_FIRING_SHOTS_A
    AliasConditionState = MOVING RELOADING_A

    ; This transition allows him to put his gun away when he's finished attacking.
    TransitionState = TRANS_FIRING_A TRANS_STAND
      Animation     = NIOFCR_SKL.NIOFCR_ATAED
      AnimationMode = ONCE
    End
    ;--------------------------------------------------------

    ConditionState  = DYING
      Animation     = NIOFCR_SKL.NIOFCR_DTA
      Animation     = NIOFCR_SKL.NIOFCR_DTB
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = NIOFCR_SKL.NIOFCR_ADTE1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = NIOFCR_SKL.NIOFCR_ADTE2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = NIOFCR_SKL.NIOFCR_ADTE3
      AnimationMode = ONCE
      TransitionKey = None
    End

    ConditionState  = SPECIAL_CHEERING
      Animation     = NIOFCR_SKL.NIOFCR_CHA
      AnimationMode = LOOP
    End

    ;PARACHUTING ANIMATIONS

    ;@TODO - MISSING ANIMATION FILE
    ;ConditionState   = FREEFALL
    ;  Animation      = NIOFCR_SKL.NIOFCR_PFL
    ;  AnimationMode  = LOOP
    ;  TransitionKey  = TRANS_Falling
    ;End
    ;AliasConditionState = FREEFALL REALLYDAMAGED
    ;AliasConditionState = FREEFALL DYING
    ConditionState  = PARACHUTING
      Animation     = NIOFCR_SKL.NIOFCR_PHG
      AnimationMode = LOOP
      Flags         = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
      TransitionKey = TRANS_Chute
    End
    AliasConditionState = PARACHUTING REALLYDAMAGED
    AliasConditionState = PARACHUTING DYING
    TransitionState = TRANS_Falling TRANS_Chute
      Animation     = NIOFCR_SKL.NIOFCR_POP
      AnimationMode = ONCE
      Flags         = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
    End
    TransitionState = TRANS_Chute TRANS_STAND
      Animation     = NIOFCR_SKL.NIOFCR_PTD
      AnimationMode = ONCE
    End

  End

  ; ***DESIGN parameters ***
  DisplayName      = OBJECT:Officer
  Side = China
  EditorSorting = INFANTRY
  TransportSlotCount = 1                 ;how many "slots" we take in a transport (0 == not transportable)
  WeaponSet
    Conditions = None 
    Weapon = PRIMARY ChinaOfficerMachineGun
  End
  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End
  VisionRange = 150
  ShroudClearingRange = 150
  Prerequisites
    Object = ChinaBarracks
  End

  BuildCost     = 400
  BuildTime     = 10.0          ;in seconds      

  ; *** AUDIO Parameters ***
  VoiceSelect = RedGuardVoiceSelect
  VoiceGroupSelect = BattleCrySound
  VoiceMove = RedGuardVoiceMove
  VoiceAttack = RedGuardVoiceAttack

  ; *** ENGINEERING Parameters ***
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK CAN_CAST_REFLECTIONS INFANTRY 
  Body = ActiveBody ModuleTag_02
    MaxHealth       = 100.0
    InitialHealth   = 100.0
  End

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes
  End
  Locomotor = SET_NORMAL BasicHumanLocomotor
  Behavior = PhysicsBehavior ModuleTag_04
    Mass = 5.0
  End
 
  Behavior = SquishCollide ModuleTag_06
    ;nothing
  End


; --- begin Death modules ---
  Behavior = SlowDeathBehavior ModuleTag_Death01
    DeathTypes          = ALL -CRUSHED -SPLATTED -EXPLODED -BURNED -POISONED
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
    OCL                 = INITIAL OCL_ 
  End
; --- end Death modules ---

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
Weapon ChinaOfficerMachineGun
  PrimaryDamage = 10.0
  PrimaryDamageRadius = 0.0       ; 0 primary radius means "hits only intended victim"
  AttackRange = 100.0
  DamageType = SMALL_ARMS
  DeathType = NORMAL
  WeaponSpeed = 999999.0          ; dist/sec (huge value == effectively instant)
  ProjectileObject = NONE
  FireFX                = WeaponFX_GenericMachineGunFire
  VeterancyFireFX       = HEROIC WeaponFX_GenericMachineGunFireWithRedTracers
  FireSound = RedGuardWeapon
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 1000               ; time between shots, msec
  ClipSize = 0                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 0              ; how long to reload a Clip, msec
  PreAttackDelay = 1538           ; 1538 is natural time of drawing gun animation
  PreAttackType = PER_ATTACK ; Do the delay each time we attack a new target
End
