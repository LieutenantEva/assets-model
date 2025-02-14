;***THESE UNITS ARE NOT SELECTABLE ANYMORE! To kill them, you must target
;   the stinger site. If the weapon does particular types of damage, it'll
;   kill guys inside first, then the site.
Object GLAInfantryStingerSoldier

  ; *** ART Parameters ***
  SelectPortrait         = SUStinger_L
  ButtonImage            = SUStinger

  Draw = W3DModelDraw ModuleTag_01
    OkToChangeModelColor = Yes

    DefaultConditionState
      Model = UISmsd_SKN
      IdleAnimation = UISmsd_SKL.UISmsd_STA 0 45
      IdleAnimation = UISmsd_SKL.UISmsd_IDA 
      IdleAnimation = UISmsd_SKL.UISmsd_IDB 
      IdleAnimation = UISmsd_SKL.UISmsd_IDC 
      IdleAnimation = UISmsd_SKL.UISmsd_IDD 
      AnimationMode = ONCE
      WeaponMuzzleFlash = PRIMARY MuzzleFX
      WeaponFireFXBone = PRIMARY Exhaust
      WeaponLaunchBone = PRIMARY Muzzle
      WeaponFireFXBone = SECONDARY Exhaust
      WeaponLaunchBone = SECONDARY Muzzle

      WaitForStateToFinishIfPossible = TRANS_START_FIRING

    End
    AliasConditionState = BETWEEN_FIRING_SHOTS_A
    AliasConditionState = BETWEEN_FIRING_SHOTS_B
    AliasConditionState = RELOADING_A
    AliasConditionState = RELOADING_B

    ConditionState = MOVING
      Animation = UISmsd_SKL.UISmsd_WKB 25
      AnimationMode = LOOP
    End

    ConditionState = DYING
      Animation = UISmsd_SKL.UISmsd_DTA 
      Animation = UISmsd_SKL.UISmsd_DTB 
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
      WaitForStateToFinishIfPossible = NONE ; We got a Key from Default state, but Death does not need to wait for firing to finish
    End

    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = UISmsd_SKL.UISmsd_ADTF1
      Animation = UISmsd_SKL.UISmsd_ADTG21
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = UISmsd_SKL.UISmsd_ADTF2
      Animation = UISmsd_SKL.UISmsd_ADTG22
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
      WaitForStateToFinishIfPossible = NONE ; We got a Key from Default state, but Death does not need to wait for firing to finish
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = UISmsd_SKL.UISmsd_ADTF3
      Animation = UISmsd_SKL.UISmsd_ADTG23
      AnimationMode = ONCE
      TransitionKey = None
      WaitForStateToFinishIfPossible = NONE ; We got a Key from Default state, but Death does not need to wait for firing to finish
    End

    ConditionState = FIRING_A
      Animation = UISmsd_SKL.UISmsd_ATA
      AnimationMode = ONCE
      TransitionKey = TRANS_START_FIRING
    End
    ; AliasConditionState is a new keyword that says,
    ; "give me another ConditionState exactly like the previous
    ; one, except with different conditions". Useful when you
    ; have several states that are the same with only different condition bits.
    ; these aliases handle the moving-between-shots case. (we can't actually move-and-fire at the same time.).
    AliasConditionState = MOVING FIRING_A
    AliasConditionState = MOVING RELOADING_A

    ConditionState = FIRING_B
      Animation = UISmsd_SKL.UISmsd_ATB
      AnimationMode = ONCE
      TransitionKey = TRANS_START_FIRINGB
    End
    ; AliasConditionState is a new keyword that says,
    ; "give me another ConditionState exactly like the previous
    ; one, except with different conditions". Useful when you
    ; have several states that are the same with only different condition bits.
    ; these aliases handle the moving-between-shots case. (we can't actually move-and-fire at the same time.).
    AliasConditionState = MOVING FIRING_B
    AliasConditionState = MOVING RELOADING_B


    ConditionState = SPECIAL_CHEERING
      Animation = UISMSD_SKL.UISMSD_CHA
      AnimationMode = LOOP
    End

  End

  ; ***DESIGN parameters ***
  DisplayName      = OBJECT:StingerSoldier
  Side = GLA
  EditorSorting = INFANTRY
  TransportSlotCount = 1                 ;how many "slots" we take in a transport (0 == not transportable)
  WeaponSet
    Conditions          = None 
    Weapon              = PRIMARY   StingerMissileWeapon
    AutoChooseSources   = PRIMARY   FROM_PLAYER FROM_AI FROM_SCRIPT
    Weapon              = SECONDARY StingerMissileWeaponAir
    PreferredAgainst    = SECONDARY BALLISTIC_MISSILE AIRCRAFT
  End
  ArmorSet
    Conditions      = None
    Armor           = StingerSoldierArmor ;Extra protection due to being enclosed by the stinger site.
    DamageFX        = None
  End
  VisionRange = 400.0
  ShroudClearingRange = 400

  Prerequisites
    Object = GLABarracks
  End
  BuildCost = 100
  BuildTime = 1.0          ;in seconds    
  CrushableLevel         = 0  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles

;  CommandSet      = GLAInfantryRebelCommandSet

  ; *** AUDIO Parameters ***
  VoiceSelect = StingerSoldierVoiceSelect
  VoiceMove = StingerSoldierVoiceMove
  VoiceAttack = StingerSoldierVoiceAttack

  ; *** ENGINEERING Parameters ***
  RadarPriority = UNIT
  KindOf = PRELOAD CAN_ATTACK ATTACK_NEEDS_LINE_OF_SIGHT CAN_CAST_REFLECTIONS INFANTRY SALVAGER CLICK_THROUGH SPAWNS_ARE_THE_WEAPONS

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 100.0
    InitialHealth   = 100.0
  End

  Behavior = StealthDetectorUpdate ModuleTag_16
    DetectionRate   = 500   ; how often to rescan for stealthed things in my sight (msec)
    DetectionRange = 200 ;Dustin, enable this for independant balancing!
    CanDetectWhileGarrisoned  = No ;Garrisoned means being in a structure that you units can shoot out of.
    CanDetectWhileContained   = No ;Contained means being in a transport or tunnel network.
  End

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes Stealthed ATTACK_BUILDINGS
    MoodAttackCheckRate        = 250
  End
  Locomotor = SET_NORMAL BasicHumanLocomotor
  Behavior = PhysicsBehavior ModuleTag_04
    Mass = 5.0
  End
  Behavior = SlavedUpdate ModuleTag_06
    ;nothing
  End
;  Behavior = ProneUpdate ModuleTag_07
;    DamageToFramesRatio = 5.0 ; I take 20 damage, I go prone for 100.  For this guy, if any of my buds or my building take damage too (I have SlaveUpdate + ProneUpdate) Prone may get cut by itself though
;  End

  Behavior = SquishCollide ModuleTag_08
    ;nothing
  End

  Behavior = StealthUpdate ModuleTag_09
    StealthDelay                = 2500 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY
    MoveThresholdSpeed          = 3
    InnateStealth               = No ;Requires upgrade first
    OrderIdleEnemiesToAttackMeUponReveal  = Yes
  End
  Behavior = StealthUpgrade ModuleTag_10
    TriggeredBy = Upgrade_GLACamoNetting
  End


; --- begin Death modules ---
  Behavior = SlowDeathBehavior ModuleTag_Death01
    DeathTypes          = ALL -CRUSHED -SPLATTED -EXPLODED -BURNED -POISONED -POISONED_BETA -POISONED_GAMMA
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_StingerSoldierDie
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
    FX                  = INITIAL FX_StingerSoldierDie
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
  ShadowSizeX = 14
  ShadowSizeY = 14
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
Weapon StingerMissileWeapon
  PrimaryDamage = 20.0            
  PrimaryDamageRadius = 5.0      
  ScatterRadiusVsInfantry     = 10.0     ;When this weapon is used against infantry, it can randomly miss by as much as this distance.
  AttackRange = 225.0
  DamageType = EXPLOSION          ; ignored for projectile weapons
  DeathType = EXPLODED
  WeaponSpeed = 750               ; ignored for projectile weapons
  ProjectileObject = StingerMissile
  ProjectileExhaust           = MissileExhaust
  VeterancyProjectileExhaust  = HEROIC HeroicMissileExhaust
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 0  ; time between shots, msec
  ClipSize = 1             ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 2000    ; how long to reload a Clip, msec
  AutoReloadsClip = Yes 
  FireFX = FX_StingerMissileIgnition
  FireSound = StingerMissileWeapon
  ProjectileDetonationFX = WeaponFX_StingerMissileDetonation
  AntiAirborneVehicle = No
  AntiAirborneInfantry = No
  AntiGround = Yes
  WeaponBonus = PLAYER_UPGRADE DAMAGE 125% ; AP rocket upgrade


  ; note, these only apply to units that aren't the explicit target 
  ; (ie, units that just happen to "get in the way"... projectiles
  ; always collide with the Designated Target, regardless of these flags
  ProjectileCollidesWith = STRUCTURES
End

;------------------------------------------------------------------------------
Weapon StingerMissileWeaponAir
  PrimaryDamage = 30.0            
  PrimaryDamageRadius = 10.0      
  ScatterRadiusVsInfantry     = 10.0     ;When this weapon is used against infantry, it can randomly miss by as much as this distance.
  AttackRange = 400.0
  DamageType = EXPLOSION          ; ignored for projectile weapons
  DeathType = EXPLODED
  WeaponSpeed = 600               ; ignored for projectile weapons
  ProjectileObject = StingerMissile
  ProjectileExhaust           = MissileExhaust
  VeterancyProjectileExhaust  = HEROIC HeroicMissileExhaust
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 0  ; time between shots, msec
  ClipSize = 1             ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 2000    ; how long to reload a Clip, msec
  AutoReloadsClip = Yes 
  FireFX = FX_StingerMissileIgnition
  FireSound = StingerMissileWeapon
  ProjectileDetonationFX = WeaponFX_StingerMissileDetonation
  AntiAirborneVehicle = Yes
  AntiAirborneInfantry = No
  AntiGround = No
  AntiBallisticMissile = Yes

  ; note, these only apply to units that aren't the explicit target 
  ; (ie, units that just happen to "get in the way"... projectiles
  ; always collide with the Designated Target, regardless of these flags
  ProjectileCollidesWith = STRUCTURES
End
