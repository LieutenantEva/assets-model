Object ChinaInfantryTankHunter

  ; *** ART Parameters ***
  SelectPortrait         = SNTankHunter_L
  ButtonImage            = SNTankHunter
  
  UpgradeCameo1 = Upgrade_Nationalism
  ;UpgradeCameo2 = NONE
  ;UpgradeCameo3 = NONE
  ;UpgradeCameo4 = NONE
  ;UpgradeCameo5 = NONE

  Draw = W3DModelDraw ModuleTag_01
    OkToChangeModelColor = Yes
  
  
    DefaultConditionState
      Model             = NIMSST_SKN
      IdleAnimation     = NIMSST_SKL.NIMSST_STA 0 30
      IdleAnimation     = NIMSST_SKL.NIMSST_IDA
      IdleAnimation     = NIMSST_SKL.NIMSST_IDB
      AnimationMode     = ONCE
      AnimationSpeedFactorRange = 0.8 1.2
      TransitionKey     = TRANS_Stand
      WeaponMuzzleFlash = PRIMARY MuzzleFX
      WeaponFireFXBone  = PRIMARY Muzzle
      WeaponLaunchBone  = PRIMARY Muzzle
      WeaponLaunchBone  = SECONDARY Muzzle
    End
    AliasConditionState = REALLYDAMAGED

    ConditionState      = FIRING_A 
      Animation         = NIMSST_SKL.NIMSST_ATA 
      AnimationMode     = ONCE
      TransitionKey     = TRANS_START_FIRING
    End
    AliasConditionState = REALLYDAMAGED FIRING_A
    
    ConditionState      = BETWEEN_FIRING_SHOTS_A
      Animation         = NIMSST_SKL.NIMSST_STA
      AnimationMode     = ONCE
      ; this is basically a trick: this guy has a nontrivial animation for firing,
      ; and a long recycle time between shots. we want him to finish his fire animation
      ; (unless he's ordered to do something else), so this is just a handy trick that
      ; says, "if the previous state had this transition key, allow it to finish before
      ; switching to us, if possible".
      WaitForStateToFinishIfPossible = TRANS_START_FIRING
    End
    AliasConditionState = REALLYDAMAGED BETWEEN_FIRING_SHOTS_A

    ConditionState      = MOVING
      Animation         = NIMSST_SKL.NIMSST_RNA 20
      AnimationMode     = LOOP
      Flags             = RANDOMSTART
      TransitionKey     = None
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = REALLYDAMAGED MOVING
    AliasConditionState = MOVING ATTACKING
    AliasConditionState = MOVING ATTACKING REALLYDAMAGED

    ConditionState      = RELOADING_A
      Animation         = NIMSST_SKL.NIMSST_ATA 10
      AnimationMode     = ONCE
      ;WeaponLaunchBone = PRIMARY WeaponA
    End
    AliasConditionState = MOVING RELOADING_A
    AliasConditionState = REALLYDAMAGED MOVING RELOADING_A

    ConditionState      = DYING
      Animation         = NIMSST_SKL.NIMSST_DTA
      Animation         = NIMSST_SKL.NIMSST_DTB
      AnimationSpeedFactorRange = 0.9 1.25
      AnimationMode     = ONCE
      TransitionKey     = TRANS_Dying
    End
    AliasConditionState = DYING RUBBLE

    TransitionState     = TRANS_Dying TRANS_Flailing
      Animation         = NIMSST_SKL.NIMSST_ADTD1
      AnimationMode     = ONCE
    End

    ConditionState      = DYING EXPLODED_FLAILING
      Animation         = NIMSST_SKL.NIMSST_ADTD2
      AnimationMode     = LOOP
      TransitionKey     = TRANS_Flailing
    End

    ConditionState      = DYING EXPLODED_BOUNCING
      Animation         = NIMSST_SKL.NIMSST_ADTD3
      AnimationMode     = ONCE
      TransitionKey     = None
    End

    ;PARACHUTING ANIMATIONS
    ConditionState      = FREEFALL
      Animation         = NIMSST_SKL.NIMSST_POP
      AnimationMode     = ONCE
      TransitionKey     = TRANS_Falling
    End
    AliasConditionState = FREEFALL REALLYDAMAGED
    AliasConditionState = FREEFALL DYING
    
    ConditionState      = PARACHUTING
      Animation         = NIMSST_SKL.NIMSST_PHG
      AnimationMode     = LOOP
      Flags             = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
      TransitionKey     = TRANS_Chute
    End
    AliasConditionState = PARACHUTING REALLYDAMAGED
    AliasConditionState = PARACHUTING DYING
    
   ; TransitionState     = TRANS_Falling TRANS_Chute
   ;   Animation         = NIMSST_SKL.NIMSST_POP
   ;   AnimationMode     = ONCE
   ;   Flags             = PRISTINE_BONE_POS_IN_FINAL_FRAME  ; our bone positions should come from the last frame, rather than the first
   ; End
    
    TransitionState     = TRANS_Chute TRANS_Stand
      Animation         = NIMSST_SKL.NIMSST_PDN
      AnimationMode     = ONCE
    End

  End


  ; ***DESIGN parameters ***
  DisplayName      = OBJECT:TankHunter
  Side = China
  EditorSorting = INFANTRY
  TransportSlotCount = 1                 ;how many "slots" we take in a transport (0 == not transportable)
  WeaponSet
    Conditions = None 
    Weapon = PRIMARY ChinaInfantryTankHunterMissileLauncher
  End
  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End
  VisionRange = 150
  ShroudClearingRange = 400
  Prerequisites
    Object = ChinaBarracks
  End
  BuildCost = 300
  BuildTime = 5.0          ;in seconds    

  ExperienceValue = 20 20 40 60    ;Experience point value at each level
  ExperienceRequired = 0 100 200 400  ;Experience points needed to gain each level
  IsTrainable = Yes             ;Can gain experience
  CrushableLevel         = 0  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles
  CommandSet      = ChinaInfantryTankHunterCommandSet

  ; *** AUDIO Parameters ***
  VoiceSelect = TankHunterVoiceSelect
  VoiceMove = TankHunterVoiceMove
  VoiceAttack = TankHunterVoiceAttack
  VoiceAttackAir = TankHunterVoiceAttack
  VoiceGuard = TankHunterVoiceMove
  VoiceFear = TankHunterVoiceFear
  UnitSpecificSounds
    VoiceCreate          = TankHunterVoiceCreate
    VoiceGarrison = TankHunterVoiceGarrison
    VoiceEnter = TankHunterVoiceMove
    VoiceEnterHostile = TankHunterVoiceMove
    VoiceGetHealed      = TankHunterVoiceMove
  End

  ; *** ENGINEERING Parameters ***
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK ATTACK_NEEDS_LINE_OF_SIGHT CAN_CAST_REFLECTIONS INFANTRY SCORE

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 100.0
    InitialHealth   = 100.0
  End

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes
  End
  Locomotor = SET_NORMAL MissileDefenderLocomotor
  Behavior = HordeUpdate ModuleTag_04
    UpdateRate = 1000    ; how often to recheck horde status (msec)
    RubOffRadius = 60    ; if I am this close to a real hordesman, I will get to be an honorary hordesman
    Radius = 30          ; how close other units must be to us to count towards our horde-ness (~30 feet or so)
    KindOf = INFANTRY    ; what KindOf's must match to count towards horde-ness
    AlliesOnly = Yes     ; do we only count allies towards horde status? 
    ExactMatch = No      ; do we only count units of our exact same type towards horde status? (overrides kindof)
    Count = 5            ; how many units must be within Radius to grant us horde-ness
    Action = HORDE       ; when horde-ing, grant us the HORDE bonus
  End
  Behavior = PhysicsBehavior ModuleTag_05
    Mass = 5.0
  End

  Behavior = SpecialAbility ModuleTag_07
    SpecialPowerTemplate = SpecialAbilityTankHunterTNTAttack
    UpdateModuleStartsAttack = Yes
    InitiateSound = TankHunterVoiceTNT
  End
  Behavior = SpecialAbilityUpdate ModuleTag_08
    SpecialPowerTemplate = SpecialAbilityTankHunterTNTAttack
    StartAbilityRange = 5.0
    PreparationTime = 0
    SpecialObject = TNTStickyBomb
    MaxSpecialObjects = 8
    SpecialObjectsPersistWhenOwnerDies = Yes ;Charges are removed instantly when owner dies (nobody can detonate).
    SpecialObjectsPersistent = Yes          ;Charges are persistent till lifetime expires or owner detonates them.
    UniqueSpecialObjectTargets = Yes        ;This prevents multiple charges placed on the same object.
    FleeRangeAfterCompletion = 100.0         ;Runs away after finishing ability
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
    FX                  = INITIAL FX_TankHunterDie
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
    FX                  = INITIAL FX_TankHunterDie
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

  Behavior = PoisonedBehavior ModuleTag_12
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
Locomotor MissileDefenderLocomotor
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
  GroupMovementPriority = MOVES_MIDDLE;   Moves in the middle of a group, behind small arms, ahead of artillery
End

;------------------------------------------------------------------------------
;This weapon fires standard anti-tank missiles at range
;------------------------------------------------------------------------------
Weapon ChinaInfantryTankHunterMissileLauncher
  PrimaryDamage = 40.0            
  PrimaryDamageRadius = 5.0      
  ScatterRadiusVsInfantry     = 10.0     ;When this weapon is used against infantry, it can randomly miss by as much as this distance.
  AttackRange = 175.0
  MinimumAttackRange = 5.0  ; Rockets take some distance to target, and you don't want them to blow up in your face.
  DamageType = INFANTRY_MISSILE   ;ignored for projectile weapons
  DeathType = EXPLODED
  WeaponSpeed = 600               ; ignored for projectile weapons
  ProjectileObject = TankHunterMissile
  ProjectileExhaust           = MissileExhaust
  VeterancyProjectileExhaust  = HEROIC HeroicMissileExhaust
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  ScatterRadius = 0      ; This weapon will scatter somewhere within a circle of this radius, instead of hitting someone directly
  DelayBetweenShots = 1000  ; time between shots, msec
  ClipSize = 0             ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 0    ; how long to reload a Clip, msec
  AutoReloadsClip = Yes 
  FireSound = TankHunterWeapon
  FireFX = FX_BuggyMissileIgnition
  ProjectileDetonationFX = WeaponFX_RocketBuggyMissileDetonation

  AntiAirborneVehicle   = Yes
  AntiAirborneInfantry  = Yes

  ; note, these only apply to units that aren't the explicit target 
  ; (ie, units that just happen to "get in the way"... projectiles
  ; always collide with the Designated Target, regardless of these flags
  ProjectileCollidesWith = STRUCTURES
End
