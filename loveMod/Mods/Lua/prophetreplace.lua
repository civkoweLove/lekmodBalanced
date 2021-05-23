
-- Author: EnormousApplePie
-- Created: 28-11-2019

----------------------------------------------------------
-------------------- UA, UU, UB ----------------------
----------------------------------------------------------

include( "Utility");

include("FLuaVector.lua")

-- Kilwa UA 
-- Ah, Optimization! Thanks JFD!
local civilisationID = GameInfoTypes["CIVILIZATION_MC_KILWA"]

if JFD_IsCivilisationActive(civilisationID) then
	print("Kilwa is in this game")
end

-- Kilwa UA function 
function GetTradeRoutesNumber(player, city)
	print("working: kilwa 1")
	local tradeRoutes = player:GetTradeRoutes()
	local numRoutes = 0
	for i, v in ipairs(tradeRoutes) do
		local originatingCity = v.FromCity
		if (originatingCity == city) and (v.FromID ~= v.ToID) then -- Thnx TophatPalading for fixing my stuff <3 
			numRoutes = numRoutes + 1
		end
	end
	
	return numRoutes
end

local buildingCoralPortID = GameInfoTypes["BUILDING_CORALSHOP"]
local buildingTraitKilwaID = GameInfoTypes["BUILDING_KILWA_TRAIT"]
function KilwaTrait(playerID)
	print("working: kilwa 2")
	local player = Players[playerID]
    if player:IsEverAlive() and player:GetCivilizationType() == civilisationID then 
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingTraitKilwaID, math.min(GetTradeRoutesNumber(player, city), 420)) -- I wonder if this will work (note: it does)
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.PlayerDoTurn.Add(KilwaTrait)
end


-- Ottoman new UA addition
-- Code by Uighur_Caesar

include("FLuaVector.lua")

local ottoID = GameInfoTypes.CIVILIZATION_OTTOMAN

function OttoPromotion(ownerId, unitId, ePromotion)
local player = Players[ownerId]
		if player:IsAlive() and player:GetCivilizationType() == ottoID then
		local unit = player:GetUnitByID(unitId)
		local xp = unit:GetExperience()
		local needed = unit:ExperienceNeeded()
		local faith = math.ceil(needed / 3)
		player:ChangeFaith(faith)
		if player:IsHuman() and Game.GetActivePlayer() == ownerId then
			local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ENDCOLOR] [ICON_PEACE]", faith), true)
		end
	end
end
GameEvents.UnitPromoted.Add(OttoPromotion)

-- Venez trait tech research
print("loaded venez ua")
GameEvents.TeamSetHasTech.Add(function(iTeam, iTech, bAdopted)
	print("working: venez UA")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_VENEZ"] then
			if player:GetTeam() == iTeam then
				if (iTech == GameInfoTypes["TECH_COMPASS"]) then
					local pCity = player:GetCapitalCity();
					pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_VENEZ_TRAIT"], 1);
				end
			end
		end
	end
end)

-- Horde free building 

print("loaded horde ua")
GameEvents.TeamSetHasTech.Add(function(iTeam, iTech, bAdopted)
	print("working: horde UA")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_HORDE"] then
			if player:GetTeam() == iTeam then
				if (iTech == GameInfoTypes["TECH_PHILOSOPHY"]) then
					local pCity = player:GetCapitalCity();
					pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_JARLIQ"], 1);
				end
			end
		end
	end
end)

----------------------------------------------------------
-------------------- DUMMY POLICIES ----------------------
----------------------------------------------------------

-- Mexico dummy policy

print("dummy policy loaded - Mexico")
function DummyPolicy(player)
	print("working - Mexico")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_LEXICO"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_LEXICO"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_LEXICO"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- New zealand dummy policy

print("dummy policy loaded - NZ")
function DummyPolicy(player)
	print("working - NZ")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_NEW_ZEALAND"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_NZ"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_NZ"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Kilwa Dummy policy

print("dummy policy loaded - Kilwa")
function DummyPolicy(player)
	print("working - Kilwa")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_KILWA"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_KILWA"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_KILWA"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Turkey dummy Policy
print("dummy policy loaded - Turkey")
function DummyPolicy(player)
	print("working - Turkey")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_UC_TURKEY"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_TURKEY"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_TURKEY"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)


-- Ireland dummy Policy
print("dummy policy loaded - Ireland")
function DummyPolicy(player)
	print("working - Ireland")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_IRELAND"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_IRELAND"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_IRELAND"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Ireland dummy Policy
print("dummy policy loaded - Ireland")
function DummyPolicy(player)
	print("working - Ireland")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_IRELAND"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_IRELAND"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_IRELAND"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Scotland dummy Policy
print("dummy policy loaded - Scotland")
function DummyPolicy(player)
	print("working - Wales")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_SCOTLAND"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_SCOTLAND"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_SCOTLAND"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Romania dummy Policy
print("dummy policy loaded - Romania")
function DummyPolicy(player)
	print("working - Romania")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_ROMANIA"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_ROMANIA"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_ROMANIA"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Goth dummy Policy
print("dummy policy loaded - Goth")
function DummyPolicy(player)
	print("working - Goth")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GOTH"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_GOTH"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_GOTH"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)
-- Korea dummy policy
print("dummy policy loaded - Germany")
function DummyPolicy(player)
	print("working - Germany")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GERMANY"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_GERMANY"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_GERMANY"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Korea dummy policy
print("dummy policy loaded - Korea")
function DummyPolicy(player)
	print("working - Korea")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_KOREA"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_KOREA"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_KOREA"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Akkad dummy policy
print("dummy policy loaded - Akkad")
function DummyPolicy(player)
	print("working - Akkad")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_LITE_AKKAD"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_AKKAD"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_AKKAD"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Prussia dummy policy
print("dummy policy loaded - Prussia")
function DummyPolicy(player)
	print("working - Prussia")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PRUSSIA"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_PRUSSIA"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_PRUSSIA"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)
--_________________________________________________________________________________________________________________________________________________________________________________________________________

-- ProphetReplacer
-- Author: LastSword
-- DateCreated: 8/24/2013 2:56:18 PM

local sUnitType = "UNIT_PROPHET"
local iProphetID = GameInfo.Units.UNIT_PROPHET.ID
local iProphetOverride = GameInfo.Units.UNIT_DALAILAMA.ID
local iCivType = GameInfo.Civilizations["CIVILIZATION_TIBET"].ID

function TibetOverride(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
        if (pPlayer:GetCivilizationType() == iCivType) then
      	    if pPlayer:GetUnitByID(iUnit) ~= nil then
			local pUnit = pPlayer:GetUnitByID(iUnit);
               if (pUnit:GetUnitType() == iProphetID)then
                   local newUnit = pPlayer:InitUnit(iProphetOverride, pUnit:GetX(), pUnit:GetY())
				   newUnit:Convert(pUnit)
                end
            end
        end
    end
end

Events.SerialEventUnitCreated.Add(TibetOverride)


-- krivis
-- Author: lek10
-- DateCreated: 4/25/2018 8:23:15 PM
--------------------------------------------------------------

local sUnitType = "UNIT_PROPHET"
local iProphetID = GameInfo.Units.UNIT_PROPHET.ID
local iProphetOverride = GameInfo.Units.UNIT_KRIVIS.ID
local iCivType = GameInfo.Civilizations["CIVILIZATION_LITHUANIA"].ID

function KriviOverride(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
        if (pPlayer:GetCivilizationType() == iCivType) then
       	    if pPlayer:GetUnitByID(iUnit) ~= nil then
		pUnit = pPlayer:GetUnitByID(iUnit);
                if (pUnit:GetUnitType() == iProphetID) then
                    local newUnit = pPlayer:InitUnit(iProphetOverride, pUnit:GetX(), pUnit:GetY())
                    newUnit:Convert(pUnit);
                end
            end
        end
    end
end

Events.SerialEventUnitCreated.Add(KriviOverride)