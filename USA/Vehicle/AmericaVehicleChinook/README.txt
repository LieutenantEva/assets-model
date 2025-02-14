Object AmericaVehicleChinook

  ; *** ART Parameters ***
  SelectPortrait         = SAChinook_L
  ButtonImage            = SAChinook
  
  ;UpgradeCameo1 = Upgrade_AmericaCountermeasures
  ;UpgradeCameo1 = Upgrade_AmericaAdvancedTraining
  ;UpgradeCameo2 = NONE
  ;UpgradeCameo3 = NONE
  ;UpgradeCameo4 = NONE
  ;UpgradeCameo5 = NONE

  Draw = W3DModelDraw                         ModuleTag_01 ; Helicopter 

    ExtraPublicBone = RopeStart
    ExtraPublicBone = RopeEnd

    DefaultConditionState
      Model = AVChinook
      Animation = AVChinook.AVChinook
      AnimationMode = LOOP
    End

    ConditionState = REALLYDAMAGED
      Model = AVChinook_d
      Animation = AVChinook_d.AVChinook_d
      AnimationMode = LOOP
    End

    ConditionState = RUBBLE
      Model = AVChinook_d
      Animation = AVChinook_d.AVChinook_d
      AnimationMode = LOOP
    End

    ConditionState = RUBBLE SPECIAL_DAMAGED
      Model = AVChinook_d
      HideSubObject = Props01
      HideSubObject = Props02
    End

    OkToChangeModelColor = Yes
  End

  Draw = W3DModelDraw                         ModuleTag_02 ; Cargo net 
    ConditionState = NONE
      Model = None  ; Nothing here
      TransitionKey = TRANS_Empty
      WaitForStateToFinishIfPossible = TRANS_Unloading
    End

    ConditionState = DYING 
      Model = None  ; Nothing here
    End
    AliasConditionState = RUBBLE
    AliasConditionState = CARRYING RUBBLE
    AliasConditionState = DOCKING RUBBLE
    AliasConditionState = DOCKING CARRYING RUBBLE
 
     ConditionState = CARRYING
      Model = AVChinook_A ;Carrying a full wobbly net of stuff
      Animation = AVChinook_A.AVChinook_A
      AnimationMode = LOOP
      TransitionKey = TRANS_Full
      WaitForStateToFinishIfPossible = TRANS_PickingUp
    End

    ConditionState = DOCKING
      Model = AVChinook_A1MSH ;Lowering an empty net, pulling up with stuff
      Animation = AVChinook_A1SK.AVChinook_A1
      AnimationMode = ONCE_BACKWARDS
      Flags = START_FRAME_LAST
      AnimationSpeedFactorRange = .75 .75
      TransitionKey = TRANS_PickingUp
      WaitForStateToFinishIfPossible = TRANS_Unloading  ;Trick.  Without hardcoding the difference between what we are docking with, need to use DOCKING for both.
    End

    ConditionState = DOCKING CARRYING
      Model = AVChinook_A1MSH ; Lowering a full net, letting stuff fall out, and pulling up an empty net
      Animation = AVChinook_A1SK.AVChinook_A1
      AnimationMode = ONCE
      AnimationSpeedFactorRange = 2.75 2.75
      TransitionKey = TRANS_Unloading
      WaitForStateToFinishIfPossible = TRANS_PickingUp  ;Trick.  Without hardcoding the difference between what we are docking with, need to use DOCKING for both.
    End
  End

  ; ***DESIGN parameters ***
  DisplayName         = OBJECT:Chinook
  EditorSorting       = VEHICLE
  Side                = America
  TransportSlotCount  = 0                 ;how many "slots" we take in a transport (0 == not transportable)
  VisionRange         = 300.0 
  ShroudClearingRange = 600
  BuildCost           = 1200
  BuildTime           = 10.0          ;in seconds  
  Prerequisites
    Object = AmericaSupplyCenter
  End
  ExperienceValue     = 50 50 50 50 ;Experience point value at each level
  IsTrainable         = No  
  CommandSet          = AmericaVehicleChinookCommandSet
  ArmorSet
    Conditions      = None
    Armor           = ChinookArmor
    DamageFX        = None
  End

  ; *** AUDIO Parameters ***
  VoiceSelect     = ChinookVoiceSelect
  VoiceMove       = ChinookVoiceMove
  VoiceAttack     = ChinookVoiceAttack
  SoundAmbient    = ChinookAmbientLoop
  SoundAmbientRubble    = NoSound
  SoundEnter      = HumveeEnter
  SoundExit       = HumveeExit
  UnitSpecificSounds
    VoiceCreate         = ChinookVoiceCreate
    VoiceSupply         = ChinookVoiceSupply
    VoiceUnload         = ChinookVoiceUnload
    VoiceCombatDrop     = ChinookVoiceCombatDrop
    VoiceClearBuilding  = RangerVoiceClearBuilding ;Special combat drop that clears buildings!
    VoiceGarrison       = ChinookVoiceMove
  End

  ; *** ENGINEERING Parameters ***
  RadarPriority   = UNIT
  ; note that, although Chinooks aren't produced at helipads, we want to set this KINDOF so that they can land at
  ; (well, "near" actually) an Airfield to get healed...
  ; also note that we should NOT set CAN_ATTACK for chinooks. they can't attack. so there.
  KindOf          = PRELOAD CAN_CAST_REFLECTIONS SELECTABLE VEHICLE TRANSPORT AIRCRAFT HARVESTER SCORE PRODUCED_AT_HELIPAD

  Body = ActiveBody ModuleTag_03
    MaxHealth       = 300.0
    InitialHealth   = 300.0
  End

  Behavior = FXListDie ModuleTag_05
    DeathFX = FX_HelicopterStartDeath
  End

  Behavior                       = TransitionDamageFX ModuleTag_06
    ReallyDamagedParticleSystem1 = Bone:Smoke RandomBone:Yes PSys:SmokeSmallContinuousDown
    ReallyDamagedFXList1         = Loc: X:0 Y:0 Z:0 FXList:FX_ComancheDamageTransition
  End

  Behavior = ChinookAIUpdate ModuleTag_07
    MaxBoxes                = 8
    SupplyCenterActionDelay = 2900 ;3000     ; ms for whole thing (one transaction)
    SupplyWarehouseActionDelay = 1200 ;1250  ; 875 ; ms per box (many small transactions)
    SupplyWarehouseScanDistance = 700 ;350 ; Max distance to look for a warehouse, or we go home.  (Direct dock command on warehouse overrides, and no max on Center Scan)
    SuppliesDepletedVoice = ChinookVoiceSuppliesDepleted
    NumRopes                = 4
    ; these define how long we can wait, once a guy is on-rope, before throwing another
    ; guy onto that same rope. (Hint: you don't want to use zero.) Omit entirely
    ; and we'll wait for each guy to clear before spawning another.
    PerRopeDelayMin         = 900
    PerRopeDelayMax         = 1500
    RopeWidth               = 0.5
    RopeColor               = R:0 G:0 B:0
    RopeWobbleLen           = 10
    RopeWobbleAmplitude     = 0.25
    RopeWobbleRate          = 180
    RopeFinalHeight         = 10    ; stop this far above ground
    RappelSpeed             = 30
    MinDropHeight           = 40    ; if dropping into a tall bldg, go at least this far above it
    UpgradedSupplyBoost     = 60    ; increase in value of the crates when supply lines has been upgraded
  End
  Locomotor = SET_NORMAL    ChinookLocomotor
  Locomotor = SET_TAXIING   BasicHelicopterTaxiLocomotor

  Behavior = TransportContain ModuleTag_08
    Slots                 = 8
    DamagePercentToUnits  = 100%
    AllowInsideKindOf     = INFANTRY VEHICLE
    ForbidInsideKindOf    = AIRCRAFT HUGE_VEHICLE
    ExitDelay             = 100
    NumberOfExitPaths     = 1
  End
  Behavior = PhysicsBehavior ModuleTag_09
    Mass = 50.0
  End
  Behavior = HelicopterSlowDeathBehavior ModuleTag_10
    DestructionDelay                = 99999999        ; the destruction delay
    SpiralOrbitTurnRate             = 140.0           ; in degrees per second, bigger # = tighter spiral
    SpiralOrbitForwardSpeed         = 350.0           ; bigger # = larger spiral
    SpiralOrbitForwardSpeedDamping  = .9999           ; smaller #'s = slow down faster
    MaxBraking                      = 190   ; max braking we can use during death spiral (lower num = wilder spiral)    
    SoundDeathLoop                  = ComancheDamagedLoop
    MinSelfSpin                     = 100                     ; in degrees per second
    MaxSelfSpin                     = 300                     ; in degrees per second
    SelfSpinUpdateDelay             = 100                     ; in milliseconds
    SelfSpinUpdateAmount            = 10                      ; in degrees   
    FallHowFast                     = 12.0%                   ; fraction of gravity, lower = take longer to fall
    MinBladeFlyOffDelay             = 1500                    ; in milliseconds
    MaxBladeFlyOffDelay             = 1500                    ; in milliseconds
    AttachParticle                  = SootySmokeTrail
    AttachParticleBone              = Propeller02
    BladeObjectName                 = ComancheBlades
    BladeBoneName                   = Propeller01    
    FXBlade                         = FX_HelicopterBladeExplosion
    OCLBlade                        = OCL_HelicopterBladeExplosion
    FXHitGround                     = FX_HelicopterHitGround
    OCLHitGround                    = OCL_HelicopterHitGround
    FXFinalBlowUp                   = FX_GroundedHelicopterBlowUp
    OCLFinalBlowUp                  = OCL_GroundedHelicopterBlowUp
    DelayFromGroundToFinalDeath     = 30
    FinalRubbleObject               = ChinookRubbleHull
  End

  Behavior = FlammableUpdate ModuleTag_21
    AflameDuration = 5000         ; If I catch fire, I'll burn for this long...
    AflameDamageAmount = 3       ; taking this much damage...
    AflameDamageDelay = 500       ; this often.
  End

  Geometry              = BOX
  GeometryMajorRadius   = 20.0
  GeometryMinorRadius   = 6.0
  GeometryHeight        = 12.0     
  GeometryIsSmall       = No
  Shadow                = SHADOW_VOLUME    
  ShadowSizeX           = 89  ; minimum elevation angle above horizon. Used to limit shadow length

End

;------------------------------------------------------------------------------
Object ChinookRubbleHull

  ; *** ART Parameters ***
  Draw = W3DModelDraw ModuleTag_01
    DefaultConditionState
      Model        = AVChinook_D1
    End
  End

  ; ***DESIGN parameters ***
  DisplayName      = OBJECT:ComancheHull
  Side = America

  ; *** ENGINEERING Parameters ***
  KindOf = IMMOBILE NO_COLLIDE HULK

  Behavior = PhysicsBehavior ModuleTag_02
    Mass           = 25.0
    AllowBouncing  = No
    KillWhenRestingOnGround = Yes
  End
  Behavior = LifetimeUpdate ModuleTag_03
    MinLifetime    = 20000   ; min lifetime in msec
    MaxLifetime    = 20000   ; max lifetime in msec
  End
  Behavior = SlowDeathBehavior ModuleTag_05
    SinkDelay        = 1500
    SinkRate            = 1     ; in Dist/Sec
    DestructionDelay = 16000
  End

End

;------------------------------------------------------------------------------
Locomotor ChinookLocomotor
  Surfaces = AIR
  Speed = 150               ; in dist/sec
  SpeedDamaged = 60         ; in dist/sec
  TurnRate = 180             ; in degrees/sec
  TurnRateDamaged = 90      ; in degrees/sec
  Acceleration = 60         ; in dist/(sec^2)
  AccelerationDamaged = 30  ; in dist/(sec^2)
  Lift = 120                 ; in dist/(sec^2)
  LiftDamaged = 80          ; in dist/(sec^2)
  Braking = 100              ; in dist/(sec^2)
  MinTurnSpeed = 0          ; in dist/sec
  PreferredHeight = 100
  AllowAirborneMotiveForce = Yes
  ZAxisBehavior = SURFACE_RELATIVE_HEIGHT
  Appearance = HOVER

  ; this applies only in "ultra-accurate" mode, and is a fudge factor that allows
  ; us to "slide into place" (rather than turning) when we get close to our destination.
  ; the magnitude is basically the number of msec it would take us to reach the dest
  ; at our max speed; if we're under this threshold, we just slide into place...
  SlideIntoPlaceTime = 100

  PitchStiffness = 0.5                  ;  stiffness of the "springs" in the suspension forward & back.
  RollStiffness = 0.1                   ;  stiffness of the "springs" in the suspension side to side.
  PitchDamping = 0.9                    ;  How fast it damps.  0=perfect spring, bounces forever.  1=glued to terrain.
  RollDamping = 0.9                     ;  How fast it damps.  0=perfect spring, bounces forever.  1=glued to terrain.
  ForwardVelocityPitchFactor = -0.1     ;  How much velocity will cause the front to lift/dip
  LateralVelocityRollFactor = 0.1       ;  How much cornering will cause the chassis to roll.
  Apply2DFrictionWhenAirborne = Yes
  AirborneTargetingHeight = 30
  LocomotorWorksWhenDead = Yes          ; HelicopterSlowDeathBehavior needs this to function correctly
End
