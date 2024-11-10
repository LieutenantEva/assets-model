Object GLAInfantryAngryMobNexus 

;**** ART Parameters **************************
  SelectPortrait         = SUAngryMob_L
  ButtonImage            = SUAngryMob
  
  UpgradeCameo1 = Upgrade_GLAArmTheMob
  ;UpgradeCameo2 = NONE
  ;UpgradeCameo3 = NONE
  ;UpgradeCameo4 = NONE
  ;UpgradeCameo5 = NONE
  
  Draw = W3DModelDraw ModuleTag_01
    OkToChangeModelColor = Yes
    DefaultConditionState
      Model = None
;      Model = AVBomber_B
    End
  End


;****DESIGN parameters **************************

  DisplayName      = OBJECT:AngryMobNexus
  Side = GLA

  RadarPriority       = NOT_ON_RADAR

  EditorSorting   = INFANTRY
  TransportSlotCount = 0                 ;how many "slots" we take in a transport (0 == not transportable)

  WeaponSet
    Conditions = None 
    Weapon = PRIMARY GLAAngryMobNexusHarmlessWeapon
    Weapon = SECONDARY GLAAngryMobNexusHarmlessWeapon
    Weapon = TERTIARY GLAAngryMobNexusHarmlessWeapon
  End


  ArmorSet
    Conditions      = None
    Armor           = InvulnerableAllArmor
    DamageFX        = None
  End

  BuildCost       = 800
  BuildTime       = 15.0          ;in seconds    
  VisionRange     = 150  ; it can scout for the spawn
  ShroudClearingRange = 0

  Prerequisites
    Object = GLABarracks
    Object = GLAPalace
  End

  ExperienceValue    = 5 5 5 5 ;Experience point value at each level

  IsTrainable     = No



  CommandSet    = GLAInfantryAngryMobCommandSet;

;**** AUDIO Parameters *****************************
  VoiceSelect = AngryMobVoiceSelect
  VoiceMove = AngryMobVoiceMove
  VoiceGuard = AngryMobVoiceMove
  VoiceAttack = AngryMobVoiceAttack
  SoundMoveStart = NoSound
  SoundAmbient = AngryMobAmbientLoop
  SoundAmbientRubble = NoSound
  UnitSpecificSounds
    VoiceCreate          = AngryMobVoiceCreate
  End


;**** ENGINEERING Parameters ******************************

  RadarPriority = UNIT
  KindOf = PRELOAD CAN_ATTACK INFANTRY MOB_NEXUS ATTACK_NEEDS_LINE_OF_SIGHT NO_COLLIDE SELECTABLE SCORE
  Body = ImmortalBody ModuleTag_02
    MaxHealth       = 99999.0
    InitialHealth   = 99999.0
  End

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes
  End

  Locomotor = SET_NORMAL AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!
  Locomotor = SET_WANDER AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!
  Locomotor = SET_PANIC AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!

;  Locomotor = SET_NORMAL WanderHumanLocomotor ;Important! don't make the Nexus any faster!
;  Locomotor = SET_WANDER WanderHumanLocomotor ;Important! don't make the Nexus any faster!
;  Locomotor = SET_PANIC WanderHumanLocomotor ;Important! don't make the Nexus any faster!

  Behavior = PhysicsBehavior ModuleTag_04
    Mass = 50.0
  End

  Behavior            = SpawnBehavior ModuleTag_05
    SpawnNumber       = 10
    SpawnReplaceDelay = 30000 ; 30 seconds

        SpawnTemplateName = GLAInfantryAngryMobPistol01 ; Aladdin
        SpawnTemplateName = GLAInfantryAngryMobRock02 ; Woman in the Gypsy Costume
        SpawnTemplateName = GLAInfantryAngryMobMolotov02 ; The Lady with the hot sauce
        SpawnTemplateName = GLAInfantryAngryMobPistol03 ; Skinny Guy with the Green Beret
        SpawnTemplateName = GLAInfantryAngryMobRock04 ; Fat guy with the tank top
        SpawnTemplateName = GLAInfantryAngryMobMolotov02 ; The Lady with the hot sauce
        SpawnTemplateName = GLAInfantryAngryMobPistol05 ; The robed dude with the Man-Veil



    ExitByBudding = Yes;!

    InitialBurst = 5 ; the first set of 5 will not delay
    OneShot     = No
    AggregateHealth = Yes
    SlavesHaveFreeWill = No
  End

  Behavior = QueueProductionExitUpdate ModuleTag_06
    UnitCreatePoint   = X:  0.0  Y:  0.0   Z:0.0
    NaturalRallyPoint = X: 0.0  Y:  0.0   Z:0.0
    ExitDelay     = 5000 ; 5 sec
    InitialBurst = 5 ; the first set of 5 will not delay
  End

  Behavior = DestroyDie ModuleTag_07
    DeathTypes = ALL
  End

  Geometry = CYLINDER
  GeometryMajorRadius = 1.0
  GeometryMinorRadius = 1.0
  GeometryHeight = 1.0     
  GeometryIsSmall = Yes 
  Shadow = SHADOW_VOLUME

End

;------------------------------------------------------------------------------
Object GLAInfantryAngryMobPistol01

;**** ART Parameters ***
  Draw = W3DModelDraw DrawTag_01
    OkToChangeModelColor = Yes

    ; WHILE CARRYING PISTOL
    ;---------------------------------------------------------
    DefaultConditionState ;Idle with Pistol Holstered
      Model = UIMOB01_SKN
      IdleAnimation = UIMOB01_SKL.UIMOB01_IDA1 0 12
      IdleAnimation = UIMOB01_SKL.UIMOB01_IDA2 0 5
      IdleAnimation = UIMOB01_SKL.UIMOB01_CHA  0 5
      IdleAnimation = UIMOB01_SKL.UIMOB01_STA  0 5
      AnimationMode = ONCE
      AnimationSpeedFactorRange 0.9 1.1
      TransitionKey = TRANS_STAND_A

      WeaponFireFXBone = PRIMARY Muzzle
      WeaponMuzzleFlash = PRIMARY MuzzleFX
      WeaponFireFXBone = SECONDARY MuzzleAK
      WeaponMuzzleFlash = SECONDARY MuzzleAKFX
    End

    ; Drawing pistol
    ConditionState  = PREATTACK_A
      Animation     = UIMOB01_SKL.UIMOB01_ATA1_ST ; start firing
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_A FIRING_A
    AliasConditionState = PREATTACK_A BETWEEN_FIRING_SHOTS_A

    ; Firing pistol
    ConditionState = FIRING_A
      Animation = UIMOB01_SKL.UIMOB01_ATA1_LP ; looping firing
      AnimationMode = LOOP
      TransitionKey = TRANS_FIRING_A
    End
    AliasConditionState  = BETWEEN_FIRING_SHOTS_A
    
    ConditionState  = RELOADING_A
      Animation     = UIMOB01_SKL.UIMOB01_ATA1_ED ; end firing
      AnimationMode = ONCE
    End

    ; This transition allows him to put his gun away when he's finished attacking.
    TransitionState = TRANS_FIRING_A TRANS_STAND_A
      Animation     = UIMOB01_SKL.UIMOB01_ATA1_ED ; end firing
      AnimationMode = ONCE
    End

    ConditionState = MOVING
      Animation = UIMOB01_SKL.UIMOB01_RNA 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey   = MOVING
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = MOVING RELOADING_A
    AliasConditionState = MOVING PREATTACK_A
    AliasConditionState = MOVING FIRING_A
    AliasConditionState = MOVING BETWEEN_FIRING_SHOTS_A
    AliasConditionState = MOVING RELOADING_C RELOADING_A 
    AliasConditionState = MOVING PREATTACK_C BETWEEN_FIRING_SHOTS_A 

    ConditionState = DYING
      Animation = UIMOB01_SKL.UIMOB01_DA1    
      Animation = UIMOB01_SKL.UIMOB01_DA2
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End


    ConditionState = SPECIAL_CHEERING
      Animation = UIMOB01_SKL.UIMOB01_CHA
      AnimationMode = ONCE
    End

    ;--------------------------------------------------------
    ; TRANSITION FROM PISTOL TO AK47
    TransitionState = TRANS_STAND_A TRANS_STAND_AK
      Animation = UIMOB01_SKL.UIMOB01_TA-D
      AnimationMode = ONCE
    End

    ; WHILE CARRYING AK47 
    ;---------------------------------------------------------
    ConditionState WEAPONSET_PLAYER_UPGRADE ;Idle with AK Slung
      Model = UIMOB01_SKN
      IdleAnimation = UIMOB01_SKL.UIMOB01_IDD1 0 6
      IdleAnimation = UIMOB01_SKL.UIMOB01_IDD2 0 6
      IdleAnimation = UIMOB01_SKL.UIMOB01_CHD  0 6
      IdleAnimation = UIMOB01_SKL.UIMOB01_STD
      AnimationMode = ONCE
      AnimationSpeedFactorRange 0.9 1.1
      TransitionKey = TRANS_STAND_AK
    End

    ConditionState = MOVING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB01_SKL.UIMOB01_RND 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey   = MOVING_AK
    End

    ConditionState = DYING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB01_SKL.UIMOB01_DD1    
      Animation = UIMOB01_SKL.UIMOB01_DD2
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    ConditionState = SPECIAL_CHEERING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB01_SKL.UIMOB01_CHD
      AnimationMode = ONCE
    End

    ; Drawing AK47
    ConditionState  = PREATTACK_B WEAPONSET_PLAYER_UPGRADE
      Animation     = UIMOB01_SKL.UIMOB01_ATD1_ST ; start firing
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_B FIRING_B WEAPONSET_PLAYER_UPGRADE
    AliasConditionState = PREATTACK_B BETWEEN_FIRING_SHOTS_B WEAPONSET_PLAYER_UPGRADE

    ; Firing Gun
    ConditionState = FIRING_B WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB01_SKL.UIMOB01_ATD1_LP ; looping firing
      AnimationMode = LOOP
      WeaponFireFXBone = SECONDARY MuzzleAK
      WeaponMuzzleFlash = SECONDARY MuzzleAKFX
      TransitionKey = TRANS_FIRING_AK
    End
    AliasConditionState  = BETWEEN_FIRING_SHOTS_B WEAPONSET_PLAYER_UPGRADE


    ConditionState  = RELOADING_B WEAPONSET_PLAYER_UPGRADE
      Animation     = UIMOB01_SKL.UIMOB01_ATD1_ED ; end firing
      AnimationMode = ONCE
    End


    ; This transition allows him to put his gun away when he's finished attacking.
    TransitionState = TRANS_FIRING_AK TRANS_STAND_AK
      Animation     = UIMOB01_SKL.UIMOB01_ATD1_ED ; end firing
      AnimationMode = ONCE
    End

;    ;Throwing bottle----------------------------------------------------------------
;    ConditionState = PREATTACK_C 
;      Animation     = UIMOB01_SKL.UIMOB01_ATCA_BF ; the wind up
;    End
;    AliasConditionState = PREATTACK_C FIRING_A
;    AliasConditionState = PREATTACK_C RELOADING_A
;    AliasConditionState = PREATTACK_C BETWEEN_FIRING_SHOTS_A 
;
;    ConditionState = FIRING_C 
;      Animation     = UIMOB01_SKL.UIMOB01_ATCA_AF ; the release and follow-thru
;      TransitionKey = TRANS_THROW
;    End
;    AliasConditionState = FIRING_C BETWEEN_FIRING_SHOTS_A
;
;    ConditionState RELOADING_C
;      Animation =UIMOB01_SKL.UIMOB01_IDA1
;      WaitForStateToFinishIfPossible = TRANS_THROW ; universal hub for follow-thru
;    End
;    AliasConditionState = RELOADING_C RELOADING_A
;    AliasConditionState = RELOADING_C FIRING_A
;    AliasConditionState = RELOADING_C BETWEEN_FIRING_SHOTS_A


;    TransitionState = TRANSXXX TRANS_THROW
;      Animation     = UIMOB01_SKL.UIMOB01_XXXXXXXXputaway gun and take out bottle
;    End

;    TransitionState = TRANS_THROW TRANS_FIRING_A
;      Animation     = UIMOB01_SKL.UIMOB01_XXXXXXXXputaway bottle and get PISTOL
;    End

;    TransitionState = TRANSXXXAK TRANS_THROW
;      Animation     = UIMOB01_SKL.UIMOB01_XXXXXXXXputaway AK and take out bottle
;    End

;    TransitionState = TRANS_THROW TRANS_FIRING_AK
;      Animation     = UIMOB01_SKL.UIMOB01_XXXXXXXXputaway bottle and get AK
;    End

    ;--------------------------------------------------------

    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = UIMOB01_SKL.UIMOB01_A_ADTE1
      Animation = UIMOB01_SKL.UIMOB01_D_ADTE1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = UIMOB01_SKL.UIMOB01_A_ADTE2
      Animation = UIMOB01_SKL.UIMOB01_D_ADTE2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = UIMOB01_SKL.UIMOB01_A_ADTE3
      Animation = UIMOB01_SKL.UIMOB01_D_ADTE3
      AnimationMode = ONCE
      TransitionKey = None
    End
  End

;**** DESIGN parameters ***

  DisplayName      = OBJECT:AngryMob
  Side = GLA
  EditorSorting = INFANTRY
  TransportSlotCount = 0                 ;how many "slots" we take in a transport (0 == not transportable)

  WeaponSet
    Conditions = None 
    Weapon = PRIMARY GLAAngryMobPistolWeapon
  End

  WeaponSet
    Conditions = PLAYER_UPGRADE 
    Weapon = PRIMARY GLAAngryMobAK47NoDamageWeapon ; for atttacking in AK-proof conditions
    Weapon = SECONDARY GLAAngryMobAK47Weapon
  End

  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End

  VisionRange = 150
  ShroudClearingRange = 150
  Prerequisites
    Object = GLABarracks
  End
  BuildCost = 100
  BuildTime = 0.0           

  ExperienceValue = 5 5 5 5    ;Experience point value at each level
  ExperienceRequired = 0 150 450 900  ;Experience points needed to gain each level
  IsTrainable = Yes             ;Can gain experience
  CrushableLevel         = 0  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles

  ; *** AUDIO Parameters ***
  VoiceSelect = NoSound 
  VoiceMove = NoSound   
  VoiceAttack = NoSound 

;**** ENGINEERING Parameters *** ;MOB01
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK ATTACK_NEEDS_LINE_OF_SIGHT CAN_CAST_REFLECTIONS INFANTRY SALVAGER IGNORED_IN_GUI  ;NO_COLLIDE ;Lorenzen disables 

  Body = ActiveBody BodyTag_01
    MaxHealth       = 50.0
    InitialHealth   = 50.0
  End

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes
  End

  Behavior = MobMemberSlavedUpdate ModuleTag_04
    MustCatchUpRadius   = 40
    NoNeedToCatchUpRadius = 15
    Squirrelliness = 0.05
    CatchUpCrisisBailTime = 30; this is in calls to this update, not in frames
  End

  Locomotor = SET_NORMAL AngryMobNormalLocomotor
  Locomotor = SET_WANDER AngryMobWanderLocomotor
  Locomotor = SET_PANIC AngryMobPanicLocomotor

  Behavior = PhysicsBehavior BehaviorTag_01
    Mass = 5.0
  End

  Behavior = SquishCollide ModuleTag_08
    ;nothing
  End

  Behavior = WeaponSetUpgrade UpgradeTag_01
    TriggeredBy = Upgrade_GLAArmTheMob
  End


; --- begin Death modules ---
  Behavior = SlowDeathBehavior DeathTag_01
    DeathTypes          = ALL -CRUSHED -SPLATTED -EXPLODED -BURNED -POISONED -POISONED_BETA -POISONED_GAMMA
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_CivilianArabMaleDie
  End
  Behavior = SlowDeathBehavior DeathTag_02
    DeathTypes          = NONE +CRUSHED +SPLATTED
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_GIDieCrushed
  End
  Behavior = SlowDeathBehavior DeathTag_03
    DeathTypes          = NONE +EXPLODED
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_CivilianArabMaleDie
    FlingForce          = 8
    FlingForceVariance  = 3
    FlingPitch          = 60
    FlingPitchVariance  = 10
  End
  Behavior = SlowDeathBehavior DeathTag_04
    DeathTypes          = NONE +BURNED
    DestructionDelay    = 0
    FX                  = INITIAL FX_GIDie
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

  Behavior = PoisonedBehavior BehaviorTag_02
    PoisonDamageInterval = 100  ; Every this many msec I will retake the poison damage dealt me...
    PoisonDuration = 3000       ; ... for this long after last hit by poison damage
  End
 
  Geometry = CYLINDER
  GeometryMajorRadius = 4.0 ; very thin
  GeometryHeight = 12.0
  GeometryIsSmall = Yes
  Shadow = SHADOW_DECAL
  ShadowSizeX = 14;
  ShadowSizeY = 14;
  ShadowTexture = ShadowI;
  BuildCompletion = APPEARS_AT_RALLY_POINT

End

;------------------------------------------------------------------------------
Object GLAInfantryAngryMobRock02

;**** ART Parameters ***
  Draw = W3DModelDraw ModuleTag_01
    OkToChangeModelColor = Yes

    ; WHILE CARRYING ROCK
    ;---------------------------------------------------------
    DefaultConditionState
      Model = UIMOB02_SKN
      IdleAnimation = UIMOB02_SKL.UIMOB02_IDB1 0 12
      IdleAnimation = UIMOB02_SKL.UIMOB02_IDB2 0 5
      IdleAnimation = UIMOB02_SKL.UIMOB02_CHB  0 5
      IdleAnimation = UIMOB02_SKL.UIMOB02_STB  0 12
      AnimationMode = ONCE
      AnimationSpeedFactorRange 0.9 1.1
      TransitionKey = TRANS_STAND_A

      ;WeaponFireFXBone  = PRIMARY   "UIMOB02 R HAND"
      ;WeaponMuzzleFlash = PRIMARY   "UIMOB02 R HAND"
      WeaponFireFXBone =  SECONDARY MuzzleAK
      WeaponMuzzleFlash = SECONDARY MuzzleAKFX
    End


    ; Drawing rock
    ConditionState  = PREATTACK_A
      Animation     = UIMOB02_SKL.UIMOB02_ATB2_BF ; wind up
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_A FIRING_A
    AliasConditionState = PREATTACK_A BETWEEN_FIRING_SHOTS_A

    ; throwing rock
    ConditionState = FIRING_A
      Animation = UIMOB02_SKL.UIMOB02_ATB1_AF ; throw
      Animation = UIMOB02_SKL.UIMOB02_ATB2_AF ; throw
      AnimationMode = ONCE
      TransitionKey = TRANS_FIRING_A
    End
    
    ConditionState = BETWEEN_FIRING_SHOTS_A
      Animation         = UIMOB02_SKL.UIMOB02_STB
      AnimationMode     = ONCE
      ; this is basically a trick: this guy has a nontrivial animation for firing,
      ; and a long recycle time between shots. we want him to finish his fire animation
      ; (unless he's ordered to do something else), so this is just a handy trick that
      ; says, "if the previous state had this transition key, allow it to finish before
      ; switching to us, if possible".
      WaitForStateToFinishIfPossible = TRANS_FIRING_A
    End
    AliasConditionState = RELOADING_A


    ConditionState = MOVING
      Animation = UIMOB02_SKL.UIMOB02_RNB 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey   = MOVING
      ParticleSysBone   = None InfantryDustTrails
    End

    ConditionState = DYING
      Animation = UIMOB02_SKL.UIMOB02_DB1    
      Animation = UIMOB02_SKL.UIMOB02_DB2
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    ConditionState = SPECIAL_CHEERING
      Animation = UIMOB02_SKL.UIMOB02_CHB
      Flags = RANDOMSTART
      AnimationMode = LOOP
    End


    ;--------------------------------------------------------
    ; TRANSITION FROM PISTOL TO AK47
    TransitionState = TRANS_STAND_A TRANS_STAND_AK
      Animation = UIMOB02_SKL.UIMOB02_TB-D
      AnimationMode = ONCE
    End


    ; WHILE CARRYING AK47 
    ;---------------------------------------------------------
    ConditionState WEAPONSET_PLAYER_UPGRADE ;Idle with AK Slung
      Model = UIMOB02_SKN
      IdleAnimation = UIMOB02_SKL.UIMOB02_IDD1 0 6
      IdleAnimation = UIMOB02_SKL.UIMOB02_IDD2 0 6
      IdleAnimation = UIMOB02_SKL.UIMOB02_CHD  0 6
      IdleAnimation = UIMOB02_SKL.UIMOB02_STD
      AnimationMode = ONCE
      AnimationSpeedFactorRange 0.9 1.1
      TransitionKey = TRANS_STAND_AK
    End

    ConditionState = MOVING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB02_SKL.UIMOB02_RND 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey   = MOVING_AK
    End

    ConditionState = DYING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB02_SKL.UIMOB02_DD1    
      Animation = UIMOB02_SKL.UIMOB02_DD2
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    ConditionState = SPECIAL_CHEERING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB02_SKL.UIMOB02_CHD
      AnimationMode = ONCE
    End

    ; Drawing AK47
    ConditionState  = PREATTACK_B WEAPONSET_PLAYER_UPGRADE
      Animation     = UIMOB02_SKL.UIMOB02_ATD1_ST ; start firing
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_B FIRING_B WEAPONSET_PLAYER_UPGRADE
    AliasConditionState = PREATTACK_B BETWEEN_FIRING_SHOTS_B WEAPONSET_PLAYER_UPGRADE

    ; Firing Gun
    ConditionState = FIRING_B WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB02_SKL.UIMOB02_ATD1_LP ; looping firing
      AnimationMode = LOOP
      WeaponFireFXBone = SECONDARY MuzzleAK
      WeaponMuzzleFlash = SECONDARY MuzzleAKFX
      TransitionKey = TRANS_FIRING_AK
    End
    AliasConditionState  = BETWEEN_FIRING_SHOTS_B WEAPONSET_PLAYER_UPGRADE


    ConditionState  = RELOADING_B WEAPONSET_PLAYER_UPGRADE
      Animation     = UIMOB02_SKL.UIMOB02_ATD1_ED ; end firing
      AnimationMode = ONCE
    End


    ; This transition allows him to put his gun away when he's finished attacking.
    TransitionState = TRANS_FIRING_AK TRANS_STAND_AK
      Animation     = UIMOB02_SKL.UIMOB02_ATD1_ED ; end firing
      AnimationMode = ONCE
    End




    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = UIMOB02_SKL.UIMOB02_B_ADTA1
      Animation = UIMOB02_SKL.UIMOB02_D_ADTA1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = UIMOB02_SKL.UIMOB02_B_ADTA2
      Animation = UIMOB02_SKL.UIMOB02_D_ADTA2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = UIMOB02_SKL.UIMOB02_B_ADTA3
      Animation = UIMOB02_SKL.UIMOB02_D_ADTA3
      AnimationMode = ONCE
      TransitionKey = None
    End


  End


;**** DESIGN parameters ***

  DisplayName      = OBJECT:AngryMob
  Side = GLA
  EditorSorting = INFANTRY
  TransportSlotCount = 0                 ;how many "slots" we take in a transport (0 == not transportable)

  WeaponSet
    Conditions = None 
    Weapon = PRIMARY GLAAngryMobRockProjectileWeapon
  End

  WeaponSet
    Conditions = PLAYER_UPGRADE 
    Weapon = PRIMARY GLAAngryMobAK47NoDamageWeapon ; for atttacking in AK-proof conditions
    Weapon = SECONDARY GLAAngryMobAK47Weapon
  End

  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End

  VisionRange = 150
  ShroudClearingRange = 150
  Prerequisites
    Object = GLABarracks
  End
  BuildCost = 100
  BuildTime = 0.0            

  ExperienceValue = 5 5 5 5    ;Experience point value at each level
  ExperienceRequired = 0 150 450 900  ;Experience points needed to gain each level
  IsTrainable = Yes             ;Can gain experience
  CrushableLevel         = 0  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles

  ; *** AUDIO Parameters ***
  VoiceSelect = NoSound 
  VoiceMove = NoSound   
  VoiceAttack = NoSound 

;**** ENGINEERING Parameters *** ;MOB02
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK ATTACK_NEEDS_LINE_OF_SIGHT CAN_CAST_REFLECTIONS INFANTRY SALVAGER IGNORED_IN_GUI  ;NO_COLLIDE ;Lorenzen disables 

  Body = ActiveBody BodyTag_01
    MaxHealth       = 50.0
    InitialHealth   = 50.0
  End

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes
  End

  Behavior = MobMemberSlavedUpdate ModuleTag_04
    MustCatchUpRadius   = 40
    NoNeedToCatchUpRadius = 15
    Squirrelliness = 0.05
    CatchUpCrisisBailTime = 30; this is in calls to this update, not in frames
  End

  Locomotor = SET_NORMAL AngryMobNormalLocomotor
  Locomotor = SET_WANDER AngryMobWanderLocomotor
  Locomotor = SET_PANIC AngryMobPanicLocomotor

  Behavior = PhysicsBehavior ModuleTag_05
    Mass = 5.0
  End

  Behavior = SquishCollide ModuleTag_08
    ;nothing
  End

  Behavior = WeaponSetUpgrade UpgradeTag_01
    TriggeredBy = Upgrade_GLAArmTheMob
  End


; --- begin Death modules ---
  Behavior = SlowDeathBehavior ModuleTag_Death01
    DeathTypes          = ALL -CRUSHED -SPLATTED -EXPLODED -BURNED -POISONED -POISONED_BETA -POISONED_GAMMA
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_CivilianArabFemaleDie
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
    FX                  = INITIAL FX_CivilianArabFemaleDie
    FlingForce          = 8
    FlingForceVariance  = 3
    FlingPitch          = 60
    FlingPitchVariance  = 10
  End
  Behavior = SlowDeathBehavior ModuleTag_Death04
    DeathTypes          = NONE +BURNED
    DestructionDelay    = 0
    FX                  = INITIAL FX_GIDie
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

  Behavior = PoisonedBehavior ModuleTag_13
    PoisonDamageInterval = 100  ; Every this many msec I will retake the poison damage dealt me...
    PoisonDuration = 3000       ; ... for this long after last hit by poison damage
  End
 
  Geometry = CYLINDER
  GeometryMajorRadius = 4.0 ; very thin
  GeometryHeight = 12.0
  GeometryIsSmall = Yes
  Shadow = SHADOW_DECAL
  ShadowSizeX = 14;
  ShadowSizeY = 14;
  ShadowTexture = ShadowI;
  BuildCompletion = APPEARS_AT_RALLY_POINT

End

;------------------------------------------------------------------------------
ObjectReskin GLAInfantryAngryMobPistol03 GLAInfantryAngryMobPistol01

;**** ART Parameters ***
  Draw = W3DModelDraw DrawTag_01
    OkToChangeModelColor = Yes



    ; WHILE CARRYING PISTOL
    ;---------------------------------------------------------
    DefaultConditionState ;Idle with Pistol Holstered
      Model = UIMOB03_SKN
      IdleAnimation = UIMOB03_SKL.UIMOB03_IDA1 0 12
      IdleAnimation = UIMOB03_SKL.UIMOB03_IDA2 0 5
      IdleAnimation = UIMOB03_SKL.UIMOB03_CHA  0 5
      IdleAnimation = UIMOB03_SKL.UIMOB03_STA  0 5
      AnimationMode = ONCE
      AnimationSpeedFactorRange 0.9 1.1
      TransitionKey = TRANS_STAND_A

      WeaponFireFXBone = PRIMARY Muzzle
      WeaponMuzzleFlash = PRIMARY MuzzleFX
      WeaponFireFXBone = SECONDARY MuzzleAK
      WeaponMuzzleFlash = SECONDARY MuzzleAKFX
      WeaponFireFXBone = TERTIARY "UIMOB03 R HAND"
    End

    ; Drawing pistol
    ConditionState  = PREATTACK_A
      Animation     = UIMOB03_SKL.UIMOB03_ATA1_ST ; start firing
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_A FIRING_A
    AliasConditionState = PREATTACK_A BETWEEN_FIRING_SHOTS_A

    ; Firing pistol
    ConditionState = FIRING_A
      Animation = UIMOB03_SKL.UIMOB03_ATA1_LP ; looping firing
      AnimationMode = LOOP
      TransitionKey = TRANS_FIRING_A
    End
    AliasConditionState  = BETWEEN_FIRING_SHOTS_A

    ConditionState  = RELOADING_A
      Animation     = UIMOB03_SKL.UIMOB03_ATA1_ED ; end firing
      AnimationMode = ONCE
    End

    ; This transition allows him to put his gun away when he's finished attacking.
    TransitionState = TRANS_FIRING_A TRANS_STAND_A
      Animation     = UIMOB03_SKL.UIMOB03_ATA1_ED ; end firing
      AnimationMode = ONCE
    End

    ConditionState = MOVING
      Animation = UIMOB03_SKL.UIMOB03_RNA 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey   = MOVING
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = MOVING RELOADING_A
    AliasConditionState = MOVING PREATTACK_A
    AliasConditionState = MOVING FIRING_A
    AliasConditionState = MOVING BETWEEN_FIRING_SHOTS_A
    AliasConditionState = MOVING RELOADING_C RELOADING_A 
    AliasConditionState = MOVING PREATTACK_C BETWEEN_FIRING_SHOTS_A 

    ConditionState = DYING
      Animation = UIMOB03_SKL.UIMOB03_DA1    
      Animation = UIMOB03_SKL.UIMOB03_DA2
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End


    ConditionState = SPECIAL_CHEERING
      Animation = UIMOB03_SKL.UIMOB03_CHA
      AnimationMode = ONCE
    End

    ;--------------------------------------------------------
    ; TRANSITION FROM PISTOL TO AK47
    TransitionState = TRANS_STAND_A TRANS_STAND_AK
      Animation = UIMOB03_SKL.UIMOB03_TA-D
      AnimationMode = ONCE
    End


    ; WHILE CARRYING AK47 
    ;---------------------------------------------------------
    ConditionState WEAPONSET_PLAYER_UPGRADE ;Idle with AK Slung
      Model = UIMOB03_SKN
      IdleAnimation = UIMOB03_SKL.UIMOB03_IDD1 0 6
      IdleAnimation = UIMOB03_SKL.UIMOB03_IDD2 0 6
      IdleAnimation = UIMOB03_SKL.UIMOB03_CHD  0 6
      IdleAnimation = UIMOB03_SKL.UIMOB03_STD
      AnimationMode = ONCE
      AnimationSpeedFactorRange 0.9 1.1
      TransitionKey = TRANS_STAND_AK
    End

    ConditionState = MOVING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB03_SKL.UIMOB03_RND 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey   = MOVING_AK
    End

    ConditionState = DYING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB03_SKL.UIMOB03_DD1    
      Animation = UIMOB03_SKL.UIMOB03_DD2
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    ConditionState = SPECIAL_CHEERING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB03_SKL.UIMOB03_CHD
      AnimationMode = ONCE
    End

    ; Drawing AK47
    ConditionState  = PREATTACK_B WEAPONSET_PLAYER_UPGRADE
      Animation     = UIMOB03_SKL.UIMOB03_ATD_ST ; start firing
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_B FIRING_B WEAPONSET_PLAYER_UPGRADE
    AliasConditionState = PREATTACK_B BETWEEN_FIRING_SHOTS_B WEAPONSET_PLAYER_UPGRADE

    ; Firing Gun
    ConditionState = FIRING_B WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB03_SKL.UIMOB03_ATD_LP ; looping firing
      AnimationMode = LOOP
      WeaponFireFXBone = SECONDARY MuzzleAK
      WeaponMuzzleFlash = SECONDARY MuzzleAKFX
      TransitionKey = TRANS_FIRING_AK
    End
    AliasConditionState  = BETWEEN_FIRING_SHOTS_B WEAPONSET_PLAYER_UPGRADE


    ConditionState  = RELOADING_B WEAPONSET_PLAYER_UPGRADE
      Animation     = UIMOB03_SKL.UIMOB03_ATD_ED ; end firing
      AnimationMode = ONCE
    End


    ; This transition allows him to put his gun away when he's finished attacking.
    TransitionState = TRANS_FIRING_AK TRANS_STAND_AK
      Animation     = UIMOB03_SKL.UIMOB03_ATD_ED ; end firing
      AnimationMode = ONCE
    End


;    ;Throwing bottle----------------------------------------------------------------
;    ConditionState = PREATTACK_C 
;      Animation     = UIMOB03_SKL.UIMOB03_ATCA_BF ; the wind up
;    End
;    AliasConditionState = PREATTACK_C FIRING_A
;    AliasConditionState = PREATTACK_C RELOADING_A
;    AliasConditionState = PREATTACK_C BETWEEN_FIRING_SHOTS_A 
;
;    ConditionState = FIRING_C 
;      Animation     = UIMOB03_SKL.UIMOB03_ATCA_AF ; the release and follow-thru
;      TransitionKey = TRANS_THROW
;    End
;    AliasConditionState = FIRING_C BETWEEN_FIRING_SHOTS_A
;
;    ConditionState RELOADING_C
;      Animation =UIMOB03_SKL.UIMOB03_IDA1
;      WaitForStateToFinishIfPossible = TRANS_THROW ; universal hub for follow-thru
;
;    End
;    AliasConditionState = RELOADING_C RELOADING_A
;    AliasConditionState = RELOADING_C FIRING_A
;    AliasConditionState = RELOADING_C BETWEEN_FIRING_SHOTS_A


;    TransitionState = TRANSXXX TRANS_THROW
;      Animation     = UIMOB03_SKL.UIMOB03_XXXXXXXXputaway gun and take out bottle
;    End

;    TransitionState = TRANS_THROW TRANS_FIRING_A
;      Animation     = UIMOB03_SKL.UIMOB03_XXXXXXXXputaway bottle and get PISTOL
;    End

;    TransitionState = TRANSXXXAK TRANS_THROW
;      Animation     = UIMOB03_SKL.UIMOB03_XXXXXXXXputaway AK and take out bottle
;    End

;    TransitionState = TRANS_THROW TRANS_FIRING_AK
;      Animation     = UIMOB03_SKL.UIMOB03_XXXXXXXXputaway bottle and get AK
;    End





    ;--------------------------------------------------------






    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = UIMOB03_SKL.UIMOB03_A_ADTD1
      Animation = UIMOB03_SKL.UIMOB03_D_ADTD1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = UIMOB03_SKL.UIMOB03_A_ADTD2
      Animation = UIMOB03_SKL.UIMOB03_D_ADTD2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = UIMOB03_SKL.UIMOB03_A_ADTD3
      Animation = UIMOB03_SKL.UIMOB03_D_ADTD3
      AnimationMode = ONCE
      TransitionKey = None
    End


  End


  Geometry = CYLINDER
  GeometryMajorRadius = 3.0 ; very thin
  GeometryMinorRadius = 3.0 ; very thinD
  GeometryHeight = 12.0
  GeometryIsSmall = Yes

End

;------------------------------------------------------------------------------
ObjectReskin GLAInfantryAngryMobRock04 GLAInfantryAngryMobRock02

;**** ART Parameters ***
  Draw = W3DModelDraw ModuleTag_01
    OkToChangeModelColor = Yes

    ; WHILE CARRYING ROCK
    ;---------------------------------------------------------
    DefaultConditionState
      Model = UIMOB04_SKN
      IdleAnimation = UIMOB04_SKL.UIMOB04_IDB1 0 12
      IdleAnimation = UIMOB04_SKL.UIMOB04_IDB2 0 5 
      IdleAnimation = UIMOB04_SKL.UIMOB04_CHB  0 5 
      IdleAnimation = UIMOB04_SKL.UIMOB04_STB  0 12
      AnimationMode = ONCE
      AnimationSpeedFactorRange 0.9 1.1
      TransitionKey = TRANS_STAND_A
      WaitForStateToFinishIfPossible TRANS_FIRING_A

      ;WeaponFireFXBone  = PRIMARY   "UIMOB04 R HAND"
      ;WeaponMuzzleFlash = PRIMARY   "UIMOB04 R HAND"
      WeaponFireFXBone =  SECONDARY MuzzleAK
      WeaponMuzzleFlash = SECONDARY MuzzleAKFX
    End


    ; Drawing rock
    ConditionState  = PREATTACK_A
      Animation     = UIMOB04_SKL.UIMOB04_ATB2_BF ; wind up
      AnimationMode = ONCE
      AnimationSpeedFactorRange 1.0 1.0
    End
    AliasConditionState = PREATTACK_A FIRING_A
    AliasConditionState = PREATTACK_A BETWEEN_FIRING_SHOTS_A

    ; throwing rock
    ConditionState = FIRING_A
      Animation = UIMOB04_SKL.UIMOB04_ATB1_AF ; throw
      Animation = UIMOB04_SKL.UIMOB04_ATB2_AF ; throw
      AnimationMode = ONCE
      TransitionKey = TRANS_FIRING_A
    End

    ConditionState = BETWEEN_FIRING_SHOTS_A
      Animation         = UIMOB04_SKL.UIMOB04_STB
      AnimationMode     = ONCE
      ; this is basically a trick: this guy has a nontrivial animation for firing,
      ; and a long recycle time between shots. we want him to finish his fire animation
      ; (unless he's ordered to do something else), so this is just a handy trick that
      ; says, "if the previous state had this transition key, allow it to finish before
      ; switching to us, if possible".
      WaitForStateToFinishIfPossible = TRANS_FIRING_A
    End
    AliasConditionState = RELOADING_A

    ConditionState = MOVING
      Animation = UIMOB04_SKL.UIMOB04_RUN 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey   = MOVING
      ParticleSysBone   = None InfantryDustTrails
    End

    ConditionState = DYING
      Animation = UIMOB04_SKL.UIMOB04_DB1    
      Animation = UIMOB04_SKL.UIMOB04_DB2
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    ConditionState = SPECIAL_CHEERING
      Animation = UIMOB04_SKL.UIMOB04_CHB
      Flags = RANDOMSTART
      AnimationMode = LOOP
    End








    ;--------------------------------------------------------
    ; TRANSITION FROM PISTOL TO AK47
    TransitionState = TRANS_STAND_A TRANS_STAND_AK
      Animation = UIMOB04_SKL.UIMOB04_TB-D
      AnimationMode = ONCE
    End


    ; WHILE CARRYING AK47 
    ;---------------------------------------------------------
    ConditionState WEAPONSET_PLAYER_UPGRADE ;Idle with AK Slung
      Model = UIMOB04_SKN
      IdleAnimation = UIMOB04_SKL.UIMOB04_IDD1 0 6
      IdleAnimation = UIMOB04_SKL.UIMOB04_IDD2 0 6
      IdleAnimation = UIMOB04_SKL.UIMOB04_CHD  0 6
      IdleAnimation = UIMOB04_SKL.UIMOB04_STD
      AnimationMode = ONCE
      AnimationSpeedFactorRange 0.9 1.1
      TransitionKey = TRANS_STAND_AK
      WeaponFireFXBone = SECONDARY MuzzleAK
      WeaponMuzzleFlash = SECONDARY MuzzleAKFX
    End

    ConditionState = MOVING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB04_SKL.UIMOB04_RND 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey   = MOVING_AK
    End

    ConditionState = DYING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB04_SKL.UIMOB04_DD1    
      Animation = UIMOB04_SKL.UIMOB04_DD2
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    ConditionState = SPECIAL_CHEERING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB04_SKL.UIMOB04_CHD
      AnimationMode = ONCE
    End

    ; Drawing AK47
    ConditionState  = PREATTACK_B WEAPONSET_PLAYER_UPGRADE
      Animation     = UIMOB04_SKL.UIMOB04_ATD1_ST ; start firing
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_B FIRING_B WEAPONSET_PLAYER_UPGRADE
    AliasConditionState = PREATTACK_B BETWEEN_FIRING_SHOTS_B WEAPONSET_PLAYER_UPGRADE

    ; Firing Gun
    ConditionState = FIRING_B WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB04_SKL.UIMOB04_ATD1_LP ; looping firing
      AnimationMode = LOOP
      WeaponFireFXBone = PRIMARY MuzzleAK
      WeaponMuzzleFlash = PRIMARY MuzzleAKFX
      TransitionKey = TRANS_FIRING_AK
    End
    AliasConditionState  = BETWEEN_FIRING_SHOTS_B WEAPONSET_PLAYER_UPGRADE


    ConditionState  = RELOADING_B WEAPONSET_PLAYER_UPGRADE
      Animation     = UIMOB04_SKL.UIMOB04_ATD1_ED ; end firing
      AnimationMode = ONCE
    End


    ; This transition allows him to put his gun away when he's finished attacking.
    TransitionState = TRANS_FIRING_AK TRANS_STAND_AK
      Animation     = UIMOB04_SKL.UIMOB04_ATD1_ED ; end firing
      AnimationMode = ONCE
    End










    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = UIMOB04_SKL.UIMOB04_B_ADTF1
      Animation = UIMOB04_SKL.UIMOB04_D_ADTF1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = UIMOB04_SKL.UIMOB04_B_ADTF2
      Animation = UIMOB04_SKL.UIMOB04_D_ADTF2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = UIMOB04_SKL.UIMOB04_B_ADTF3
      Animation = UIMOB04_SKL.UIMOB04_D_ADTF3
      AnimationMode = ONCE
      TransitionKey = None
    End


  End

  Geometry = CYLINDER
  GeometryMajorRadius = 5.0 ; kinda thin
  GeometryMinorRadius = 5.0 ; kinda thinD
  GeometryHeight = 12.0
  GeometryIsSmall = Yes

End

;------------------------------------------------------------------------------
ObjectReskin GLAInfantryAngryMobPistol05 GLAInfantryAngryMobPistol01

;**** ART Parameters ***
  Draw = W3DModelDraw DrawTag_01
    OkToChangeModelColor = Yes



    ; WHILE CARRYING PISTOL
    ;---------------------------------------------------------
    DefaultConditionState ;Idle with Pistol Holstered
      Model = UIMOB05_SKN
      IdleAnimation = UIMOB05_SKL.UIMOB05_IDA1 0 12
      IdleAnimation = UIMOB05_SKL.UIMOB05_IDA2 0 5
      IdleAnimation = UIMOB05_SKL.UIMOB05_CHA  0 5
      IdleAnimation = UIMOB05_SKL.UIMOB05_STA  0 5
      AnimationMode = ONCE
      AnimationSpeedFactorRange 0.9 1.1
      TransitionKey = TRANS_STAND_A

      WeaponFireFXBone = PRIMARY Muzzle01
      WeaponMuzzleFlash = PRIMARY Muzzle01
    End

    ; Drawing pistol
    ConditionState  = PREATTACK_A
      Animation     = UIMOB05_SKL.UIMOB05_ATA1_ST ; start firing
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_A FIRING_A
    AliasConditionState = PREATTACK_A BETWEEN_FIRING_SHOTS_A

    ; Firing pistol
    ConditionState = FIRING_A
      Animation = UIMOB05_SKL.UIMOB05_ATA1_LP ; looping firing
      AnimationMode = LOOP
      TransitionKey = TRANS_FIRING_A
    End
    AliasConditionState  = BETWEEN_FIRING_SHOTS_A
    
    ConditionState  = RELOADING_A
      Animation     = UIMOB05_SKL.UIMOB05_ATA1_ED ; end firing
      AnimationMode = ONCE
    End

    ; This transition allows him to put his gun away when he's finished attacking.
    TransitionState = TRANS_FIRING_A TRANS_STAND_A
      Animation     = UIMOB05_SKL.UIMOB05_ATA1_ED ; end firing
      AnimationMode = ONCE
    End

    ConditionState = MOVING
      Animation = UIMOB05_SKL.UIMOB05_RNA 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey   = MOVING
      ParticleSysBone   = None InfantryDustTrails
    End
    AliasConditionState = MOVING RELOADING_A
    AliasConditionState = MOVING PREATTACK_A
    AliasConditionState = MOVING FIRING_A
    AliasConditionState = MOVING BETWEEN_FIRING_SHOTS_A
    AliasConditionState = MOVING RELOADING_C RELOADING_A 
    AliasConditionState = MOVING PREATTACK_C BETWEEN_FIRING_SHOTS_A 

    ConditionState = DYING
      Animation = UIMOB05_SKL.UIMOB05_DA1    
      Animation = UIMOB05_SKL.UIMOB05_DA2
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End


    ConditionState = SPECIAL_CHEERING
      Animation = UIMOB05_SKL.UIMOB05_CHA
      AnimationMode = ONCE
    End

    ;--------------------------------------------------------

    ; TRANSITION FROM PISTOL TO AK47
    TransitionState = TRANS_STAND_A TRANS_STAND_AK
      Animation = UIMOB05_SKL.UIMOB05_TA-D
      AnimationMode = ONCE
    End


    ; WHILE CARRYING AK47 
    ;---------------------------------------------------------
    ConditionState WEAPONSET_PLAYER_UPGRADE ;Idle with AK Slung
      Model = UIMOB05_SKN
      IdleAnimation = UIMOB05_SKL.UIMOB05_IDD1 0 6
      IdleAnimation = UIMOB05_SKL.UIMOB05_IDD2 0 6
      IdleAnimation = UIMOB05_SKL.UIMOB05_CHD  0 6
      IdleAnimation = UIMOB05_SKL.UIMOB05_STD
      AnimationMode = ONCE
      AnimationSpeedFactorRange 0.9 1.1
      TransitionKey = TRANS_STAND_AK
      WeaponFireFXBone = SECONDARY MuzzleAK
      WeaponMuzzleFlash = SECONDARY MuzzleAKFX
    End

    ConditionState = MOVING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB05_SKL.UIMOB05_RND 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey   = MOVING_AK
    End

    ConditionState = DYING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB05_SKL.UIMOB05_DD1    
      Animation = UIMOB05_SKL.UIMOB05_DD2
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    ConditionState = SPECIAL_CHEERING WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB05_SKL.UIMOB05_CHD
      AnimationMode = ONCE
    End

    ; Drawing AK47
    ConditionState  = PREATTACK_B WEAPONSET_PLAYER_UPGRADE
      Animation     = UIMOB05_SKL.UIMOB05_ATD1_ST ; start firing
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_B FIRING_B WEAPONSET_PLAYER_UPGRADE
    AliasConditionState = PREATTACK_B BETWEEN_FIRING_SHOTS_B WEAPONSET_PLAYER_UPGRADE

    ; Firing Gun
    ConditionState = FIRING_B WEAPONSET_PLAYER_UPGRADE
      Animation = UIMOB05_SKL.UIMOB05_ATD1_LP ; looping firing
      AnimationMode = LOOP
      WeaponFireFXBone = PRIMARY MuzzleAK
      WeaponMuzzleFlash = PRIMARY MuzzleAKFX
      TransitionKey = TRANS_FIRING_AK
    End
    AliasConditionState  = BETWEEN_FIRING_SHOTS_B WEAPONSET_PLAYER_UPGRADE


    ConditionState  = RELOADING_B WEAPONSET_PLAYER_UPGRADE
      Animation     = UIMOB05_SKL.UIMOB05_ATD1_ED ; end firing
      AnimationMode = ONCE
    End


    ; This transition allows him to put his gun away when he's finished attacking.
    TransitionState = TRANS_FIRING_AK TRANS_STAND_AK
      Animation     = UIMOB05_SKL.UIMOB05_ATD1_ED ; end firing
      AnimationMode = ONCE
    End


;    ;Throwing bottle----------------------------------------------------------------
;    ConditionState = PREATTACK_C 
;      Animation     = UIMOB05_SKL.UIMOB05_ATCA_BF ; the wind up
;    End
;    AliasConditionState = PREATTACK_C FIRING_A
;    AliasConditionState = PREATTACK_C RELOADING_A
;    AliasConditionState = PREATTACK_C BETWEEN_FIRING_SHOTS_A 
;
;    ConditionState = FIRING_C 
;      Animation     = UIMOB05_SKL.UIMOB05_ATCA_AF ; the release and follow-thru
;      TransitionKey = TRANS_THROW
;    End
;    AliasConditionState = FIRING_C BETWEEN_FIRING_SHOTS_A
;
;    ConditionState RELOADING_C
;      Animation =UIMOB05_SKL.UIMOB05_IDA1
;      WaitForStateToFinishIfPossible = TRANS_THROW ; universal hub for follow-thru
;    End
;    AliasConditionState = RELOADING_C RELOADING_A
;    AliasConditionState = RELOADING_C FIRING_A
;    AliasConditionState = RELOADING_C BETWEEN_FIRING_SHOTS_A


;    TransitionState = TRANSXXX TRANS_THROW
;      Animation     = UIMOB05_SKL.UIMOB05_XXXXXXXXputaway gun and take out bottle
;    End

;    TransitionState = TRANS_THROW TRANS_FIRING_A
;      Animation     = UIMOB05_SKL.UIMOB05_XXXXXXXXputaway bottle and get PISTOL
;    End

;    TransitionState = TRANSXXXAK TRANS_THROW
;      Animation     = UIMOB05_SKL.UIMOB05_XXXXXXXXputaway AK and take out bottle
;    End


;    TransitionState = TRANS_THROW TRANS_FIRING_AK
;      Animation     = UIMOB05_SKL.UIMOB05_XXXXXXXXputaway bottle and get AK
;    End





    ;--------------------------------------------------------






    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = UIMOB05_SKL.UIMOB05_A_ADTA1
      Animation = UIMOB05_SKL.UIMOB05_D_ADTA1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = UIMOB05_SKL.UIMOB05_A_ADTA2
      Animation = UIMOB05_SKL.UIMOB05_D_ADTA2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = UIMOB05_SKL.UIMOB05_A_ADTA3
      Animation = UIMOB05_SKL.UIMOB05_D_ADTA3
      AnimationMode = ONCE
      TransitionKey = None
    End


  End



  Geometry = CYLINDER
  GeometryMajorRadius = 3.0 ; very thin
  GeometryMinorRadius = 3.0 ; very thinD
  GeometryHeight = 12.0
  GeometryIsSmall = Yes

End

;------------------------------------------------------------------------------
Object GLAInfantryAngryMobMolotov02

;**** ART Parameters ***
  Draw = W3DModelDraw ModuleTag_01
    OkToChangeModelColor = Yes

    ; WHILE CARRYING ROCK
    ;---------------------------------------------------------
    DefaultConditionState
      Model = UIMOB02_SKN
      IdleAnimation = UIMOB02_SKL.UIMOB02_IDB1 0 12
      IdleAnimation = UIMOB02_SKL.UIMOB02_IDB2 0 5
      IdleAnimation = UIMOB02_SKL.UIMOB02_CHB  0 5
      IdleAnimation = UIMOB02_SKL.UIMOB02_STB  0 12
      AnimationMode = ONCE
      AnimationSpeedFactorRange 0.9 1.1
      TransitionKey = TRANS_STAND_B

      WeaponFireFXBone  = SECONDARY   "UIMOB02 R HAND"

    End


    ; Drawing rock
    ConditionState  = PREATTACK_B
      Animation     = UIMOB02_SKL.UIMOB02_ATCB_BF ; wind up
      AnimationMode = ONCE
    End
    AliasConditionState = PREATTACK_B FIRING_B
    AliasConditionState = PREATTACK_B BETWEEN_FIRING_SHOTS_B

    ; throwing rock
    ConditionState = FIRING_B
      Animation = UIMOB02_SKL.UIMOB02_ATCB_AF ; throw
      AnimationMode = ONCE
      TransitionKey = TRANS_FIRING_B
    End

    ConditionState = BETWEEN_FIRING_SHOTS_B
      Animation         = UIMOB02_SKL.UIMOB02_STB
      AnimationMode     = ONCE
      ; this is basically a trick: this guy has a nontrivial animation for firing,
      ; and a long recycle time between shots. we want him to finish his fire animation
      ; (unless he's ordered to do something else), so this is just a handy trick that
      ; says, "if the previous state had this transition key, allow it to finish before
      ; switching to us, if possible".
      WaitForStateToFinishIfPossible = TRANS_FIRING_B
    End
    AliasConditionState = RELOADING_B


    ConditionState = MOVING
      Animation = UIMOB02_SKL.UIMOB02_RNB 
      AnimationMode = LOOP
      Flags = RANDOMSTART
      TransitionKey   = MOVING
      ParticleSysBone   = None InfantryDustTrails
    End

    ConditionState = DYING
      Animation = UIMOB02_SKL.UIMOB02_DB1    
      Animation = UIMOB02_SKL.UIMOB02_DB2
      AnimationMode = ONCE
      TransitionKey = TRANS_Dying
    End

    ConditionState = SPECIAL_CHEERING
      Animation = UIMOB02_SKL.UIMOB02_CHB
      Flags = RANDOMSTART
      AnimationMode = LOOP
    End






    TransitionState = TRANS_Dying TRANS_Flailing
      Animation = UIMOB02_SKL.UIMOB02_B_ADTA1
      Animation = UIMOB02_SKL.UIMOB02_D_ADTA1
      AnimationMode = ONCE
    End

    ConditionState = DYING EXPLODED_FLAILING
      Animation = UIMOB02_SKL.UIMOB02_B_ADTA2
      Animation = UIMOB02_SKL.UIMOB02_D_ADTA2
      AnimationMode = LOOP
      TransitionKey = TRANS_Flailing
    End

    ConditionState = DYING EXPLODED_BOUNCING
      Animation = UIMOB02_SKL.UIMOB02_B_ADTA3
      Animation = UIMOB02_SKL.UIMOB02_D_ADTA3
      AnimationMode = ONCE
      TransitionKey = None
    End


  End


;**** DESIGN parameters ***

  DisplayName      = OBJECT:AngryMob
  Side = GLA
  EditorSorting = INFANTRY
  TransportSlotCount = 0                 ;how many "slots" we take in a transport (0 == not transportable)

  WeaponSet
    Conditions = None 
    Weapon = PRIMARY GLAAngryMobMolotovCocktailProjectileWeapon ; all she does is throw molotovs
  End

  ArmorSet
    Conditions      = None
    Armor           = HumanArmor
    DamageFX        = InfantryDamageFX
  End

  VisionRange = 150
  ShroudClearingRange = 150
  Prerequisites
    Object = GLABarracks

  End
  BuildCost = 100
  BuildTime = 0.0            

  ExperienceValue = 5 5 5 5    ;Experience point value at each level
  ExperienceRequired = 0 150 450 900  ;Experience points needed to gain each level
  IsTrainable = Yes             ;Can gain experience
  CrushableLevel         = 0  ;What am I?:        0 = for infantry, 1 = for trees, 2 = general vehicles

  ; *** AUDIO Parameters ***
  VoiceSelect = NoSound 
  VoiceMove = NoSound   
  VoiceAttack = NoSound 

;**** ENGINEERING Parameters *** ;MOB02
  RadarPriority = UNIT
  KindOf = PRELOAD SELECTABLE CAN_ATTACK ATTACK_NEEDS_LINE_OF_SIGHT CAN_CAST_REFLECTIONS INFANTRY SALVAGER IGNORED_IN_GUI  ;NO_COLLIDE ;Lorenzen disables 

  Body = ActiveBody BodyTag_01
    MaxHealth       = 50.0
    InitialHealth   = 50.0
  End

  Behavior = AIUpdateInterface ModuleTag_03
    AutoAcquireEnemiesWhenIdle = Yes
  End

  Behavior = MobMemberSlavedUpdate ModuleTag_04
    MustCatchUpRadius   = 40
    NoNeedToCatchUpRadius = 15
    Squirrelliness = 0.05
    CatchUpCrisisBailTime = 30; this is in calls to this update, not in frames
  End

  Locomotor = SET_NORMAL AngryMobNormalLocomotor
  Locomotor = SET_WANDER AngryMobWanderLocomotor
  Locomotor = SET_PANIC AngryMobPanicLocomotor

  Behavior = PhysicsBehavior ModuleTag_05
    Mass = 5.0
  End

  Behavior = SquishCollide ModuleTag_08
    ;nothing
  End

  Behavior = WeaponSetUpgrade UpgradeTag_01
    TriggeredBy = Upgrade_GLAArmTheMob
  End


; --- begin Death modules ---
  Behavior = SlowDeathBehavior ModuleTag_Death01
    DeathTypes          = ALL -CRUSHED -SPLATTED -EXPLODED -BURNED -POISONED -POISONED_BETA -POISONED_GAMMA
    SinkDelay           = 3000
    SinkRate            = 0.5     ; in Dist/Sec
    DestructionDelay    = 8000
    FX                  = INITIAL FX_CivilianArabFemaleDie
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
    FX                  = INITIAL FX_CivilianArabFemaleDie
    FlingForce          = 8
    FlingForceVariance  = 3
    FlingPitch          = 60
    FlingPitchVariance  = 10
  End
  Behavior = SlowDeathBehavior ModuleTag_Death04
    DeathTypes          = NONE +BURNED
    DestructionDelay    = 0
    FX                  = INITIAL FX_GIDie
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

  Behavior = PoisonedBehavior ModuleTag_13
    PoisonDamageInterval = 100  ; Every this many msec I will retake the poison damage dealt me...
    PoisonDuration = 3000       ; ... for this long after last hit by poison damage
  End
 
  Geometry = CYLINDER
  GeometryMajorRadius = 4.0 ; very thin
  GeometryHeight = 12.0
  GeometryIsSmall = Yes
  Shadow = SHADOW_DECAL
  ShadowSizeX = 14;
  ShadowSizeY = 14;
  ShadowTexture = ShadowI;
  BuildCompletion = APPEARS_AT_RALLY_POINT

End

;------------------------------------------------------------------------------
Locomotor AngryMobNexusLocomotor
  Surfaces = GROUND RUBBLE
  Speed = 18                ; in dist/sec
  SpeedDamaged = 18 ;10 ;30     ; in dist/sec
  TurnRate = 360            ; in degrees/sec
  TurnRateDamaged = 350     ; in degrees/sec
  Acceleration = 100        ; in dist/(sec^2)
  AccelerationDamaged = 50  ; in dist/(sec^2)
  Braking = 100             ; in dist/(sec^2)
  MinTurnSpeed = 0          ; in dist/sec
  ZAxisBehavior = NO_Z_MOTIVE_FORCE
  Appearance = TWO_LEGS
  StickToGround = Yes       ; walking guys aren't allowed to catch huge (or even small) air.
End

;------------------------------------------------------------------------------
Locomotor AngryMobNormalLocomotor
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
Locomotor AngryMobWanderLocomotor
  Surfaces = GROUND RUBBLE
  Speed = 13 ;;IMPORTANT THAT THIS STAYS SLOWER THAN A HUMAN WANDER, SO MOBSTER CAN LET THE OTHERS CATCH UP 
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
Locomotor AngryMobPanicLocomotor
  Surfaces = GROUND RUBBLE
  Speed = 32 ;IMPORTANT THAT THIS STAYS FASTER THAN A HUMAN PANIC, SO MOBSTER CAN CATCH UP WITH NEXUS IN A CRISIS
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
;----  ANGRY MOB  WEAPONS  ----------------------------------------------------
;------------------------------------------------------------------------------
Weapon GLAAngryMobNexusHarmlessWeapon 
  
  ;;; allows AI to set targets and victims and condition states
  ;;; without really doing any harm 
  
  PrimaryDamage = 0.001
  PrimaryDamageRadius = 0.0       ; 0 primary radius means "hits only intended victim"
  AttackRange = 90.0 ;70.0 ;; small so the whole mob can get in close
  DamageType = UNRESISTABLE
  DeathType = NORMAL
  WeaponSpeed = 999999.0          ; dist/sec (huge value == effectively instant)
  ProjectileObject = NONE
  FireFX = NONE
  RadiusDamageAffects = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots = 99999        ; time between shots, msec
  ClipSize = 0                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 0              ; how long to reload a Clip, msec
  WeaponBonus = PLAYER_UPGRADE DAMAGE 125% ; Armor Piercing Bullets
End

;------------------------------------------------------------------------------
Weapon GLAAngryMobRockProjectileWeapon 
  PrimaryDamage = 40.0 ;10.0
  PrimaryDamageRadius = 1.0       
  AttackRange = 100.0 
  DamageType = MOLOTOV_COCKTAIL  ;SMALL_ARMS
  DeathType = NORMAL
  WeaponSpeed = 130          ; dist/sec (huge value == effectively instant)
  ProjectileObject = GLAAngryMobRockProjectileObject
  FireFX = NONE
  FireSound = AngryMobWeaponMolotov
  RadiusDamageAffects = ENEMIES NEUTRALS ALLIES
  DelayBetweenShots = 500 ;3000        ; time between shots, msec
  ClipSize = 0                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 0              ; how long to reload a Clip, msec
  PreAttackDelay = 500 ;2000       ; linked to the length of throw animation
  PreAttackType = PER_SHOT ; Do the delay every single shot
  ProjectileCollidesWith = STRUCTURES WALLS 

End

;------------------------------------------------------------------------------
Weapon GLAAngryMobMolotovCocktailProjectileWeapon 
  PrimaryDamage = 40.0 ;40.0          
  PrimaryDamageRadius = 11.0       
  AttackRange = 100.0 
  MinimumAttackRange = 12; 40.0
  DamageType = MOLOTOV_COCKTAIL  ;used only by this weapon.  Splits off so Dragon Tanks and Toxin Trucks are resistant.  
  DeathType = NORMAL
  WeaponSpeed = 60 ;          
  ProjectileObject = GLAAngryMobMolotovCocktailProjectileObject
  FireFX = NONE
  RadiusDamageAffects = ENEMIES NEUTRALS ALLIES
  DelayBetweenShots = 500 ;3000        ; time between shots, msec
  ClipSize = 0                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime = 0              ; how long to reload a Clip, msec
  PreAttackDelay = 500 ;2000    ; linked to the length of throw animation
  PreAttackType = PER_SHOT ; Do the delay every single shot
  ProjectileDetonationFX = WeaponFX_MolotovCocktailDetonation
  MaxTargetPitch = 57 ; this is important so that they do not lob the bottles on their mobmates

  ProjectileCollidesWith = STRUCTURES WALLS 
End

;------------------------------------------------------------------------------
Weapon GLAAngryMobPistolWeapon
  PrimaryDamage         = 10.0
  PrimaryDamageRadius   = 0.0       ; 0 primary radius means "hits only intended victim"
  AttackRange           = 100.0
  DamageType            = MOLOTOV_COCKTAIL  ;SMALL_ARMS
  DeathType             = NORMAL
  WeaponSpeed           = 999999.0          ; dist/sec (huge value == effectively instant)
  ProjectileObject      = NONE
  FireFX                = WeaponFX_GenericMachineGunFire
  VeterancyFireFX       = HEROIC WeaponFX_GenericMachineGunFireWithRedTracers
  FireSound             = AngryMobWeaponPistol 
  RadiusDamageAffects   = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots     = 250               ; time between shots, msec
  ClipSize              = 8                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime        = 3000              ; how long to reload a Clip, msec
  AutoReloadsClip       = Yes 
End

;------------------------------------------------------------------------------
Weapon GLAAngryMobAK47Weapon 
  PrimaryDamage         = 20.0 ;8.0
  PrimaryDamageRadius   = 0.0       ; 0 primary radius means "hits only intended victim"
  AttackRange           = 120.0
  DamageType            = MOLOTOV_COCKTAIL  ;SMALL_ARMS
  DeathType             = NORMAL
  WeaponSpeed           = 999999.0          ; dist/sec (huge value == effectively instant)
  ProjectileObject      = NONE
  FireFX                = WeaponFX_RangerAdvancedCombatRifleFire
  VeterancyFireFX       = HEROIC WeaponFX_HeroicRangerAdvancedCombatRifleFire
  FireSound             = AngryMobWeaponAK47
  RadiusDamageAffects   = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots     = 250         ; time between shots, msec
  ClipSize              = 0                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime        = 0              ; how long to reload a Clip, msec
  WeaponBonus           = PLAYER_UPGRADE DAMAGE 125% ; Armor Piercing Bullets
End

;------------------------------------------------------------------------------
Weapon GLAAngryMobAK47NoDamageWeapon 
  PrimaryDamage         = 0.001 ; THIS IS A SPECIAL NO-DAMAGE AK47
  PrimaryDamageRadius   = 0.0       ; 0 primary radius means "hits only intended victim"
  AttackRange           = 120.0
  DamageType            = MOLOTOV_COCKTAIL  ;SMALL_ARMS
  DeathType             = NORMAL
  WeaponSpeed           = 999999.0          ; dist/sec (huge value == effectively instant)
  ProjectileObject      = NONE
  FireFX                = WeaponFX_RangerAdvancedCombatRifleFire
  VeterancyFireFX       = HEROIC WeaponFX_HeroicRangerAdvancedCombatRifleFire
  FireSound             = AngryMobWeaponAK47
  RadiusDamageAffects   = ALLIES ENEMIES NEUTRALS
  DelayBetweenShots     = 99999         ; time between shots, msec
  ClipSize              = 0                    ; how many shots in a Clip (0 == infinite)
  ClipReloadTime        = 0              ; how long to reload a Clip, msec
  WeaponBonus           = PLAYER_UPGRADE DAMAGE 125% ; Armor Piercing Bullets
End
