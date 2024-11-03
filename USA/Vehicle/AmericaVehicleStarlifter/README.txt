Object AmericaVehicleStarlifter

  ; *** ART Parameters ***
  ;SelectPortrait       = SAPStarLift
  Draw = W3DModelDraw
  DrawData
    OkToChangeModelColor = Yes

    ConditionState = NONE
      Model = AVStarlift
    End

  End

  ; ***DESIGN parameters ***
  DisplayName      = OBJECT:Starlifter
  Side = America
  EditorSorting   = VEHICLE
  TransportSlotCount = 0                 ;how many "slots" we take in a transport (0 == not transportable)
  MaxHealth       = 100.0
  InitialHealth   = 100.0
  VisionRange     = 300.0 
  BuildCost       = 700
  BuildTime       = 15.0          ;in seconds  
  PrerequisiteA = TECH_LEVEL_0
  PrerequisiteA = SCIENCE_AMERICA
  PrerequisiteA = AmericaAirfield
  CommandSet = AmericaTransportCommandSet

  ; *** AUDIO Parameters ***

  ; *** ENGINEERING Parameters ***
  Update = AIUpdateInterface
  UpdateData
    Locomotor = SET_NORMAL BasicTruckLocomotor
  End

  Body = UnitBody

  Collide = PhysicsCollide
  Update = PhysicsUpdate
  UpdateData
    Mass = 50.0
  End

  Contain = TransportContain
  ContainData
    Slots = 8
  End
  Collide = ContainCollide
  Die = RemoveContainDie

  Die = DestroyDie
  Die = FXListDie
  DieData        
    DeathFX = FX_PredatorTank_DeathEffect
  End

  RadarPriority = UNIT
  KindOf = SELECTABLE TRANSPORT
  Geometry = BOX
  GeometryMajorRadius = 15.0
  GeometryMinorRadius = 10.0
  GeometryHeight = 10.0    
  GeometryIsSmall = Yes    
End
