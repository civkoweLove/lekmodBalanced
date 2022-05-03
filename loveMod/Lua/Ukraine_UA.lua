include( "Utility");

-- Ukraine UA 

local civilissationID = GameInfoTypes["CIVILIZATION_UKRAINE"]

function Ukraine_Tech(iTeam, iTech, bAdopted)
	print("working: ukraine ontechbonus")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == civilissationID then
			if player:GetTeam() == iTeam then
				if (iTech == GameInfoTypes["TECH_THE_WHEEL"]) then
					local pCity = player:GetCapitalCity();
					pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_UKRAINE_TRAIT"], 1);
					for pCity in player:Cities() do
					pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_UKRAINE_TRAIT"], 1) end
				end
			end
		end
	end
end

-- From Chrisy15, thanks a lot! :-)

local iUkraineTraitDummy = GameInfoTypes["BUILDING_UKRAINE_TRAIT"]
local iWheel = GameInfoTypes["TECH_THE_WHEEL"]
local iUkraineLeader = GameInfoTypes["LEADER_YAROSLAV"] 

function Ukraine_CityFounded(playerID, iX, iY)
	print("working: ukraine oncityfoundbonus")
    local pPlayer = Players[playerID]
    if pPlayer:GetLeaderType() == iUkraineLeader then
        local pTeam = Teams[pPlayer:GetTeam()] -- Techs are handled on a Team level, because Teams are a thing that exist in this game for some reason
        if pTeam:IsHasTech(iWheel) then
            local pPlot = Map.GetPlot(iX, iY)
            local pCity = pPlot:GetPlotCity()
            pCity:SetNumRealBuilding(iUkraineTraitDummy, 1)
        end
    end
end

function Ukraine_CityCaptured(oldPlayerID, bCapital, iPlotX, iPlotY, newPlayerID) -- Thanks TopHatPaladin
    print("working: ukraine oncitycapturebonus")
	local pPlayer = Players[newPlayerID]
    if pPlayer:GetLeaderType() == iUkraineLeader then
        local pTeam = Teams[pPlayer:GetTeam()]
        if pTeam:IsHasTech(iWheel) then
            local pPlot = Map.GetPlot(iPlotX, iPlotY)
            local pCity = pPlot:GetPlotCity()
            pCity:SetNumRealBuilding(iUkraineTraitDummy, 1)
        end
    end
end

if JFD_IsCivilisationActive(civilissationID) then
	GameEvents.CityCaptureComplete.Add(Ukraine_CityCaptured)
	GameEvents.PlayerCityFounded.Add(Ukraine_CityFounded)
	GameEvents.TeamSetHasTech.Add(Ukraine_Tech)
end
