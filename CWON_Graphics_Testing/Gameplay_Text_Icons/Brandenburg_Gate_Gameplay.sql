INSERT INTO Types (Type, Kind) VALUES ('BUILDING_BRANDENBURG_GATE', 'KIND_BUILDING');

INSERT INTO Buildings (BuildingType, Name, Description, PrereqTech, Cost, AdvisorType, MaxWorldInstances, IsWonder, RequiresPlacement, Quote, AdjacentDistrict)
VALUES ('BUILDING_BRANDENBURG_GATE', 'LOC_BUILDING_BRANDENBURG_GATE_NAME', 'LOC_BUILDING_BRANDENBURG_GATE_DESCRIPTION', 'TECH_MILITARY_SCIENCE', 1350, 'ADVISOR_CONQUEST', '1', 1, 1, 'LOC_BUILDING_BRANDENBURG_GATE_QUOTE', 'DISTRICT_CITY_CENTER');

--INSERT INTO BuildingPrereqs (Building, PrereqBuilding) VALUES ('BUILDING_BRANDENBURG_GATE', 'BUILDING_BANK');

INSERT INTO Building_YieldChanges (BuildingType, YieldType, YieldChange) VALUES  ('BUILDING_BRANDENBURG_GATE', 'YIELD_CULTURE', 2);

INSERT INTO Building_ValidTerrains (BuildingType, TerrainType)
VALUES
  (
    'BUILDING_BRANDENBURG_GATE', 'TERRAIN_GRASS'
  ),
  (
    'BUILDING_BRANDENBURG_GATE', 'TERRAIN_PLAINS'
  ),
  (
    'BUILDING_BRANDENBURG_GATE', 'TERRAIN_TUNDRA'
  );


-- +25% combat experience for all land units trained in this city
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES ('BRANDENBURG_GATE_LAND_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES ('BRANDENBURG_GATE_LAND_REQUIREMENTS', 'REQUIRES_LAND_DOMAIN');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, Permanent)
VALUES ('BRANDENBURG_GATE_TRAINED_UNIT_XP_MODIFIER', 'MODIFIER_CITY_TRAINED_UNITS_ADJUST_XP_BONUS', 'BRANDENBURG_GATE_LAND_REQUIREMENTS', 1);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BRANDENBURG_GATE_TRAINED_UNIT_XP_MODIFIER', 'Amount', '25');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_BRANDENBURG_GATE', 'BRANDENBURG_GATE_TRAINED_UNIT_XP_MODIFIER');


-- 1 free Great General appears near the city where the wonder was built
INSERT INTO Modifiers (ModifierId, ModifierType,  RunOnce, Permanent)
VALUES ('BRANDENBURG_GRANT_GENERAL', 'MODIFIER_SINGLE_CITY_GRANT_GREAT_PERSON_CLASS_IN_CITY',  1, 1);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BRANDENBURG_GRANT_GENERAL', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_GENERAL');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BRANDENBURG_GRANT_GENERAL', 'Amount', '1');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_BRANDENBURG_GATE', 'BRANDENBURG_GRANT_GENERAL');

-- +3 Loyalty?