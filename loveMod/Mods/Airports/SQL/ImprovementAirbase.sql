----------------------------------------------------------
-- ArtDefine Landmarks
----------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_AIRBASE', 'Improvement', 'Airbase';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 1.0,  'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era1_HB.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed',       1.0,  'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era1.fxsxml',    1 UNION ALL
SELECT 'Any', 'Pillaged',          1.0,  'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era1_PL.fxsxml', 1;

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour, Tech)
SELECT 'Any', 'UnderConstruction', 1.25, 'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era2_HB.fxsxml', 1, 'TECH_RADAR' UNION ALL
SELECT 'Any', 'Constructed',       1.25, 'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era2.fxsxml',    1, 'TECH_RADAR' UNION ALL
SELECT 'Any', 'Pillaged',          1.25, 'ART_DEF_IMPROVEMENT_AIRBASE', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Airfield_Era2_PL.fxsxml', 1, 'TECH_RADAR';

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_AIRBASE', 'Improvement', 'SV_Airbase.dds';


----------------------------------------------------------
-- Improvements
----------------------------------------------------------
INSERT INTO Improvements (Type,	Description,			Civilopedia,								Help,										ArtDefineTag,						RequiresFlatlands,	BuildableOnResources,	Permanent,	DestroyedWhenPillaged,	DefenseModifier,	OutsideBorders,		NoTwoAdjacent,	PortraitIndex,	IconAtlas) VALUES
('IMPROVEMENT_AIRBASE',	'TXT_KEY_IMPROVEMENT_AIRBASE',	'TXT_KEY_CIV5_IMPROVEMENTS_AIRBASE_TEXT',	'TXT_KEY_CIV5_IMPROVEMENTS_AIRBASE_HELP',	'ART_DEF_IMPROVEMENT_AIRBASE',		1,					1,						0,			0,						25,					1,					1,				0,				'IMPROVEMENTS_AIRBASE_ICON_ATLAS'	);

INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) VALUES ('IMPROVEMENT_AIRBASE',			'TERRAIN_GRASS' );
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) VALUES ('IMPROVEMENT_AIRBASE',			'TERRAIN_PLAINS');
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) VALUES ('IMPROVEMENT_AIRBASE',			'TERRAIN_DESERT');
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) VALUES ('IMPROVEMENT_AIRBASE',			'TERRAIN_TUNDRA');
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) VALUES ('IMPROVEMENT_AIRBASE',			'TERRAIN_SNOW'	);



INSERT INTO Improvement_Flavors (	ImprovementType,		FlavorType,				Flavor) 
							SELECT	'IMPROVEMENT_AIRBASE',	'FLAVOR_OFFENSE',		25 UNION ALL
							SELECT	'IMPROVEMENT_AIRBASE',	'FLAVOR_DEFENSE',		15 UNION ALL
							SELECT	'IMPROVEMENT_AIRBASE',	'FLAVOR_AIR_CARRIER',	33;
							

----------------------------------------------------------
-- Builds
----------------------------------------------------------
INSERT INTO Builds	(Type,				PrereqTech,		ImprovementType,		Description,				Help,							Recommendation,					EntityEvent,				HotKey,		OrderPriority,	AltDown,	Time,	IconIndex,	IconAtlas			) VALUES
					('BUILD_AIRBASE',	'TECH_FLIGHT',	'IMPROVEMENT_AIRBASE',	'TXT_KEY_BUILD_AIRBASE',	'TXT_KEY_BUILD_AIRBASE_HELP',	'TXT_KEY_BUILD_AIRBASE_REC',	'ENTITY_EVENT_BUILD',		'KB_F',		1,				1,			800,	46,			'UNIT_ACTION_ATLAS'	);


INSERT INTO BuildFeatures (	BuildType,			FeatureType,		PrereqTech,				Time,	Remove) 
					SELECT	'BUILD_AIRBASE',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',	700,	1	UNION ALL
					SELECT	'BUILD_AIRBASE',	'FEATURE_FOREST',	'TECH_MINING',			400,	1	UNION ALL
					SELECT	'BUILD_AIRBASE',	'FEATURE_MARSH',	'TECH_MASONRY',			600,	1;


INSERT INTO Unit_Builds (UnitType, BuildType) VALUES ('UNIT_WORKER', 'BUILD_AIRBASE');


----------------------------------------------------------
-- Atlases
----------------------------------------------------------
INSERT INTO IconTextureAtlases (	Atlas,								IconSize,		Filename,			IconsPerRow,	IconsPerColumn) 
							SELECT	'IMPROVEMENTS_AIRBASE_ICON_ATLAS',	256,			'Airbase_256.dds',	1,				1   UNION ALL
							SELECT	'IMPROVEMENTS_AIRBASE_ICON_ATLAS',	64,				'Airbase_064.dds',	1,				1;
							

----------------------------------------------------------
-- Text Keys
----------------------------------------------------------
INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_IMPROVEMENT_AIRBASE', 'Airbase' );
INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_CIV5_IMPROVEMENTS_AIRBASE', 'Airbase' );
INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_CIV5_IMPROVEMENTS_AIRBASE_HELP', 'Permits up to three air units to be based on the tile. +25% [ICON_STRENGTH] Defensive Strength for any Unit stationed in this Tile.' );
INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_CIV5_IMPROVEMENTS_AIRBASE_TEXT', 'The Airbase is a special Tile Improvement that allows you to station aircraft away from Cities or Aircraft Carriers. They become available at the discovery of Flight, and allow stationing up to 3 Units (Fighters, Bombers, and Missiles). An advanced version of the Airfield becomes available at the discovery of Radar. This `improved` Improvement allows up to 5 Units.[NEWLINE][NEWLINE]Airbases may be constructed in your own territory or in unowned Desert, Grass, Plains, Snow, and Tundra Tiles. Airbases may not be built in adjacent Tiles.[NEWLINE][NEWLINE]Airbases do not increase a hex`s productivity or provide access to a Resource. Instead, an Airbase permits stationing of aircraft, and also improves a hex`s defensive bonus by 25%. However, they do not provide a defensive bonus to Units in enemy territory.[NEWLINE][NEWLINE]You may use another Civilization`s Airbases if you are on the same team or if you have a Declaration of Friendship in place. If a DoF is subsequently cancelled, e.g. you Denounce a Civ where you have Aircaft using one of their Airfields, then those Aircraft may remain in that Airfield, but when they move, they will not be allowed to return.  If you have Aircraft in another Civ`s Airfields and then declare war on that Civ, those aircraft will be destroyed.' );
INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_CIV5_IMPROVEMENTS_AIRBASE_TITLE1', 'Technology Required' );
INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_CIV5_IMPROVEMENTS_AIRBASE_TITLE2', 'Where It Can Be Constructed' );
INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_CIV5_IMPROVEMENTS_AIRBASE_TITLE3', 'Yield Effect' );
INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_CIV5_IMPROVEMENTS_AIRBASE_TITLE4', 'Resource Accessed' );

INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_AIRCRAFT_STATUS_HEALING', 'Healing' );
INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_AIRCRAFT_STATUS_INTERCEPTING', 'Intercepting' );

INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_BUILD_AIRBASE', 'Construct an [LINK=IMPROVEMENT_AIRBASE]Airbase[\LINK]' );
INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_BUILD_AIRBASE_HELP', 'Permits up to three air units to be based on the tile. +25% [ICON_STRENGTH] Defensive Strength for any Unit stationed in this Tile.' );
INSERT INTO Language_en_US (Tag, Text) VALUES ( 'TXT_KEY_BUILD_AIRBASE_REC', 'Improve the [ICON_STRENGTH] Defense of any military unit stationed in this tile.' );
