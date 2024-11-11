Object AmericaVehicleHumvee

  ; *** ART Parameters ***
  SelectPortrait         = SAHummer_L
  ButtonImage            = SAHummer
  
  UpgradeCameo1 = Upgrade_AmericaBattleDrone
  UpgradeCameo2 = Upgrade_AmericaScoutDrone
  UpgradeCameo3 = Upgrade_AmericaHellfireDrone
  UpgradeCameo4 = Upgrade_AmericaAdvancedTraining
  UpgradeCameo5 = Upgrade_AmericaTOWMissile
  
  Draw = W3DTruckDraw ModuleTag_01
    OkToChangeModelColor = Yes

    ConditionState = NONE
      Model = AVHUMMER
      Turret = Turret
      ShowSubObject = Turret
      HideSubObject = TurretUp01 Housecolor03 MuzzleFXUP01
      WeaponFireFXBone = PRIMARY Muzzle
      WeaponMuzzleFlash = PRIMARY MuzzleFX
    End

    ConditionState = REALLYDAMAGED
      Model = AVHUMMER_d
      Turret = Turret
      ShowSubObject = Turret
      HideSubObject = TurretUp01 Housecolor03 MuzzleFXUP01
      WeaponFireFXBone = PRIMARY Muzzle
      WeaponMuzzleFlash = PRIMARY MuzzleFX
    End

    ConditionState = WEAPONSET_PLAYER_UPGRADE
      Model = AVHUMMER
      Turret = TurretUp01
      HideSubObject = Turret MuzzleFX01
      ShowSubObject = TurretUp01 Housecolor03
      WeaponFireFXBone = PRIMARY MuzzleUp
      WeaponMuzzleFlash = PRIMARY MuzzleFXUp
      WeaponFireFXBone = SECONDARY WeaponB
      WeaponLaunchBone = SECONDARY WeaponB
      WeaponFireFXBone = TERTIARY WeaponB
      WeaponLaunchBone = TERTIARY WeaponB
    End

    ConditionState = REALLYDAMAGED WEAPONSET_PLAYER_UPGRADE
      Model = AVHUMMER_d
      Turret = TurretUp01
      HideSubObject = Turret MuzzleFX01
      ShowSubObject = TurretUp01 Housecolor03
      WeaponFireFXBone = PRIMARY MuzzleUp
      WeaponMuzzleFlash = PRIMARY MuzzleFXUp
      WeaponFireFXBone = SECONDARY WeaponB
      WeaponLaunchBone = SECONDARY WeaponB
      WeaponFireFXBone = TERTIARY WeaponB
      WeaponLaunchBone = TERTIARY WeaponB
    End

    TrackMarks = EXTireTrack.tga

    Dust = RocketBuggyDust
    DirtSpray = RocketBuggyDirtSpray
    PowerslideSpray = RocketBuggyDirtPowerSlide

    ; These parameters are only used if the model has a separate suspension, 
    ; and the locomotor has HasSuspension = Yes.
    LeftFrontTireBone = Tire01
    RightFrontTireBone = Tire02
    LeftRearTireBone = Tire03
    RightRearTireBone = Tire04
    TireRotationMultiplier = 0.2   ; this * speed = rotation.
    PowerslideRotationAddition = 1.25   ; This speed is added to the rotation speed when powersliding.

  End

  ; ***DESIGN parameters ***
  DisplayName           = OBJECT:Humvee
  Side                  = America
  EditorSorting         = VEHICLE
  TransportSlotCount    = 3                 ;how many "slots" we take in a transport (0 == not transportable)
  WeaponSet
    Conditions = None 
    Weapon = PRIMARY HumveeGun
    Weapon = SECONDARY HumveeMissileWeaponAirDummy
  End
  WeaponSet
    Conditions = PLAYER_UPGRADE 
    Weapon = PRIMARY HumveeGun
    Weapon = SECONDARY HumveeMissileWeapon
    Weapon = TERTIARY HumveeMissileWeaponAir
    PreferredAgainst = TERTIARY     AIRCRAFT
  End
  ArmorSet
    Conditions      = None
    Armor           = HumveeArmor
    DamageFX        = TruckDamageFX
  End
  BuildCost       = 700
  BuildTime       = 10.0          ;in seconds    
  VisionRange     = 150
  ShroudClearingRange = 320
  Prerequisites
    Object = AmericaWarFactory
  End
  ExperienceValue = 50 50 100 150   ;Experience point value at each level
  ExperienceRequired = 0 100 150 300  ;Experience points needed to gain each level
  IsTrainable = Yes             ;Can gain experience
  CrusherLevel           = 2  ;What can I crush?: 1 = infantry, 2 = trees, 3 = vehicles
  CrushableLevel         = 2  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles
  CommandSet      = AmericaVehicleHumveeCommandSet

  ; *** AUDIO Parameters ***
  VoiceSelect = HumveeVoiceSelect
  VoiceMove = HumveeVoiceMove
  VoiceGuard = HumveeVoiceMove
  VoiceAttack = HumveeVoiceAttack
  VoiceAttackAir = HumveeVoiceAttackTOW
  SoundMoveStart = HumveeMoveStart
  SoundMoveStartDamaged = HumveeMoveStart
  SoundEnter = HumveeEnter
  SoundExit = HumveeExit

  UnitSpecificSounds
    ; These have the syntax of SomeNameSomewhereInCode = SomeNameSomewhereInLookupINIs
    ;TurretMoveStart    = NoSound
    VoiceCreate         = HumveeVoiceCreate
    TurretMoveLoop      = TurretMoveLoop
    SoundEject          = PilotSoundEject
    VoiceEject          = PilotVoiceEject
    VoiceCrush          = HumveeVoiceCrush
  ; Required for the W3DTruckDraw module
    TruckLandingSound = RocketBuggyLand
    TruckPowerslideSound = RocketBuggyPowerslide
    VoiceUnload = HumveeVoiceUnload
    VoiceEnter = HumveeVoiceMove
  End


  ; *** ENGINEERING Parameters ***
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK ATTACK_NEEDS_LINE_OF_SIGHT CAN_CAST_REFLECTIONS VEHICLE SCORE TRANSPORT

  Body = ActiveBody ModuleTag_02
    MaxHealth       = 240.0
    InitialHealth   = 240.0

    ; Subdual damage "Subdues" you (reaction defined by BodyModule) when it passes your max health.
    ; The cap limits how extra-subdued you can be, and the other numbers detemine how fast it drains away on its own.
    SubdualDamageCap = 480
    SubdualDamageHealRate = 500
    SubdualDamageHealAmount = 50
  End
  Behavior = TransportAIUpdate ModuleTag_03
    Turret
      TurretTurnRate = 180
      RecenterTime = 5000   ; how long to wait during idle before recentering
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes
    MoodAttackCheckRate        = 250
  End
  Locomotor = SET_NORMAL HumveeLocomotor

  Behavior = PhysicsBehavior ModuleTag_04
    Mass = 50.0
  End

  Behavior = TransportContain  ModuleTag_05
    PassengersAllowedToFire = Yes
    Slots             = 5
;    EnterSound          = GarrisonEnter
;    ExitSound           = GarrisonExit
    DamagePercentToUnits = 100% ;10%
    AllowInsideKindOf  = INFANTRY
    ExitDelay = 250
    NumberOfExitPaths = 3 ; Defaults to 1.  Set 0 to not use ExitStart/ExitEnd, set higher than 1 to use ExitStart01-nn/ExitEnd01-nn
    GoAggressiveOnExit = Yes ; AI Will tell people to set their mood to Aggressive on exiting
  End

  Behavior = ObjectCreationUpgrade ModuleTag_06
    UpgradeObject = OCL_AmericanBattleDrone
    TriggeredBy   = Upgrade_AmericaBattleDrone
    ConflictsWith = Upgrade_AmericaScoutDrone Upgrade_AmericaHellfireDrone
  End
  Behavior = ObjectCreationUpgrade ModuleTag_07
    UpgradeObject = OCL_AmericanScoutDrone
    TriggeredBy   = Upgrade_AmericaScoutDrone
    ConflictsWith = Upgrade_AmericaBattleDrone Upgrade_AmericaHellfireDrone
  End
  Behavior = ObjectCreationUpgrade ModuleTag_14
    UpgradeObject = OCL_AmericanHellfireDrone
    TriggeredBy   = Upgrade_AmericaHellfireDrone
    ConflictsWith = Upgrade_AmericaBattleDrone Upgrade_AmericaScoutDrone
  End

  Behavior = ProductionUpdate ModuleTag_08
    MaxQueueEntries = 1; So you can't build multiple upgrades in the same frame
  End

  Behavior = WeaponSetUpgrade ModuleTag_09
    TriggeredBy = Upgrade_AmericaTOWMissile
  End
  Behavior = ExperienceScalarUpgrade ModuleTag_10
    TriggeredBy = Upgrade_AmericaAdvancedTraining
    AddXPScalar = 1.0 ;Increases experience gained by an additional 100%
  End

  Behavior = SlowDeathBehavior ModuleTag_11
    DeathTypes = ALL -CRUSHED -SPLATTED
    ProbabilityModifier = 25
    DestructionDelay = 1
    OCL = INITIAL  OCL_InitialHumveeDebris
    FX  = FINAL    FX_BattleMasterExplosionOneFinal
    OCL = FINAL    OCL_FinalHumveeDebris
  End

  Behavior = DestroyDie ModuleTag_12
    DeathTypes = NONE +CRUSHED +SPLATTED
  End

  Behavior = FXListDie ModuleTag_13
    DeathTypes = NONE +CRUSHED +SPLATTED
    DeathFX = FX_CarCrush
  End

  Behavior = CreateCrateDie ModuleTag_CratesChange
    CrateData = SalvageCrateData
    ;CrateData = EliteTankCrateData
    ;CrateData = HeroicTankCrateData
  End

; This is commented out per hotlist request 10/9 ML
;  Behavior = CreateObjectDie ModuleTag_15
;    DeathTypes = ALL -CRUSHED -SPLATTED
;    CreationList = OCL_AmericanRangerDebris01
;    ExemptStatus = HIJACKED
;  End

  Behavior = EjectPilotDie ModuleTag_16
    DeathTypes = ALL -CRUSHED -SPLATTED
    ExemptStatus = HIJACKED
    ; The following added out per hotlist request 10/9 as above ML
    VeterancyLevels =  ALL -REGULAR ;only vet+ gives pilot
    GroundCreationList = OCL_EjectPilotOnGround
    AirCreationList = OCL_EjectPilotViaParachute
  End

  Behavior = TransitionDamageFX ModuleTag_17
    ReallyDamagedParticleSystem1 = Bone:Smoke RandomBone:Yes PSys:SmokeSmallContinuous01
    ReallyDamagedFXList1 = Loc: X:0 Y:0 Z:0 FXList:FX_BattleMasterDamageTransition
  End

  Behavior = FlammableUpdate ModuleTag_21
    AflameDuration = 5000         ; If I catch fire, I'll burn for this long...
    AflameDamageAmount = 3       ; taking this much damage...
    AflameDamageDelay = 500       ; this often.
  End

  Geometry = BOX
  GeometryMajorRadius = 14.0
  GeometryMinorRadius = 7.0
  GeometryHeight = 11.5     
  GeometryIsSmall = Yes 
  Shadow = SHADOW_VOLUME
  ShadowSizeX = 45  ; minimum elevation angle above horizon. Used to limit shadow length

End

;------------------------------------------------------------------------------
Locomotor HumveeLocomotor
  Surfaces                = GROUND
  Speed                   = 60    ; in dist/sec
  SpeedDamaged            = 30    ; in dist/sec
  TurnRate                = 180   ;120   ; in degrees/sec
  TurnRateDamaged         = 180   ;120   ; in degrees/sec
  Acceleration            = 1000  ;60    ; in dist/(sec^2)
  AccelerationDamaged     = 1000  ;60    ; in dist/(sec^2)
  Braking                 = 1000  ;60    ; in dist/(sec^2)
  MinTurnSpeed            = 20    ; in dist/sec
  TurnPivotOffset         = -0.33 ; where to pivot when turning (-1.0 = rear, 0.0 = center, 1.0 = front)
  ZAxisBehavior           = NO_Z_MOTIVE_FORCE
  Appearance              = FOUR_WHEELS
  StickToGround           = No 

  AccelerationPitchLimit  = 0     ; Angle limit how far chassis will lift or roll from acceleration.
  DecelerationPitchLimit  = 0     ; Angle limit how far chassis willdip roll deom acceleration.
  BounceAmount            = 0    ; simulates hitting random rocks.  0==smooth pavement, 200 = bumpy.
  PitchStiffness          = 0.35  ; stiffness of the "springs" in the suspension forward & back.
  RollStiffness           = 0.05  ; stiffness of the "springs" in the suspension side to side.
  PitchDamping            = 0.96  ; How fast it damps.  0=perfect spring, bounces forever.  1=glued to terrain.
  RollDamping             = 0.96  ; How fast it damps.  0=perfect spring, bounces forever.  1=glued to terrain.  
  
  ForwardAccelerationPitchFactor = 0.00  ; How much acceleration will cause the front to lift, or dip for stops.
  LateralAccelerationRollFactor  = 0.10  ; How much cornering will cause the chassis to roll.

  HasSuspension           = Yes   ; Calculate 4 wheel independent suspension info.
  CanMoveBackwards        = Yes   ; Can move backwards.
  MaximumWheelExtension   = -1.0  ; Maximum distance the wheels will drop on the model.
  MaximumWheelCompression = 0.5   ; Maximum distance the wheel will move up into the chassis.
  FrontWheelTurnAngle     = 22    ; How many degrees the front wheels can turn.

End

;------------------------------------------------------------------------------
Weapon HumveeGun 
  PrimaryDamage = 10.0  ; 8.0 
  PrimaryDamageRadius = 0.0
  AttackRange = 150.0
  DamageType = COMANCHE_VULCAN  
  DeathType = NORMAL
  WeaponSpeed = 600         ; dist/sec 
  ProjectileObject = NONE
  FireFX = WeaponFX_TechnicalGunFire
  VeterancyFireFX  = HEROIC WeaponFX_GenericMachineGunFireWithRedTracers
  FireSound = HumveeWeapon
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 200         ; time between shots, msec
  ClipSize = 0                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 0              ; how long to reload a Clip, msec
End

;------------------------------------------------------------------------------
Weapon HumveeMissileWeapon
  PrimaryDamage = 30.0            
  PrimaryDamageRadius = 5.0      
  ScatterRadiusVsInfantry = 10.0     ;When this weapon is used against infantry, it can randomly miss by as much as this distance.
  AttackRange = 150.0
  DamageType = EXPLOSION          ; ignored for projectile weapons
  DeathType = EXPLODED
  WeaponSpeed = 600               ; ignored for projectile weapons
  ProjectileDetonationFX = WeaponFX_RocketBuggyMissileDetonation
  ProjectileObject = HumveeMissile
  ProjectileExhaust = TowMissileExhaust
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 1000  ; time between shots, msec
  ClipSize = 1            ; how many shots in a Clip (0 == infinite) ; You have to have a clip size as a missile weapon
  ClipReloadTime = 2000     how long to reload a Clip, msec
  AutoReloadsClip = Yes 
  FireSound = HumveeWeaponTOW
  ProjectileDetonationFX = WeaponFX_RocketBuggyMissileDetonation
  AntiAirborneVehicle         = No
  AntiAirborneInfantry        = No
  AntiGround = Yes

  ; note, these only apply to units that aren't the explicit target 
  ; (ie, units that just happen to "get in the way"... projectiles
  ; always collide with the Designated Target, regardless of these flags
  ProjectileCollidesWith = STRUCTURES
End

;------------------------------------------------------------------------------
Weapon HumveeMissileWeaponAir
  PrimaryDamage = 50.0            
  PrimaryDamageRadius = 5.0      
  ScatterRadiusVsInfantry = 10.0     ;When this weapon is used against infantry, it can randomly miss by as much as this distance.
  AttackRange = 320.0
  DamageType = EXPLOSION          ; ignored for projectile weapons
  DeathType = EXPLODED
  WeaponSpeed = 600               ; ignored for projectile weapons
  ProjectileDetonationFX = WeaponFX_RocketBuggyMissileDetonation
  ProjectileObject            = PatriotMissile
  ProjectileExhaust = MissileExhaust
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 1000  ; time between shots, msec
  ClipSize = 1            ; how many shots in a Clip (0 == infinite) ; You have to have a clip size as a missile weapon
  ClipReloadTime = 2000    ; how long to reload a Clip, msec
  AutoReloadsClip = Yes 
  FireSound = HumveeWeaponTOW
  ProjectileDetonationFX = WeaponFX_RocketBuggyMissileDetonation
  AntiAirborneVehicle         = Yes
  AntiAirborneInfantry        = No
  AntiGround = No

  ; note, these only apply to units that aren't the explicit target 
  ; (ie, units that just happen to "get in the way"... projectiles
  ; always collide with the Designated Target, regardless of these flags
  ProjectileCollidesWith = STRUCTURES
End

;------------------------------------------------------------------------------
Weapon HumveeMissileWeaponAirDummy
  PrimaryDamage = 0.0001
  PrimaryDamageRadius = 0.0      
  AttackRange = 320.0
  DamageType = EXPLOSION
  DeathType = EXPLODED
  WeaponSpeed = 999999.0
  ProjectileObject = NONE
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 500
  ClipSize = 0
  ClipReloadTime = 0
  AutoReloadsClip = Yes 
  AntiAirborneVehicle = Yes
  AntiAirborneInfantry = Yes
  AntiGround = No
End
