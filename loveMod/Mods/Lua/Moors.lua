include( "Utility");

local iCiv = GameInfoTypes["CIVILIZATION_MC_LITE_MOOR"]
local iBuilding = GameInfoTypes["BUILDING_MOORS_TRAIT"]
local iEra = GameInfoTypes["ERA_MEDIEVAL"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

function Moors_CityFounded(playerID, iX, iY)
    local pPlayer = Players[playerID]
    if (pPlayer:GetCivilizationType() == iCiv) then
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetPlotCity()
		pCity:SetNumRealBuilding(iBuilding, 1)
    end
end

function Moors_CityCaptured(oldPlayerID, bCapital, iPlotX, iPlotY, newPlayerID)
	local pPlayer = Players[newPlayerID]
    if (pPlayer:GetCivilizationType() == iCiv) then
		local pPlot = Map.GetPlot(iPlotX, iPlotY)
		local pCity = pPlot:GetPlotCity()
		pCity:SetNumRealBuilding(iBuilding, 1)
    end
end

function Moors_TechLeave(iTeam, iTech, bAdopted)
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		
		if player:GetCivilizationType() == iCiv  then
			if player:GetCurrentEra() > iEra then
				for pCity in player:Cities() do
					pCity:SetNumRealBuilding(iBuilding, 0);
				end
				GameEvents.PlayerCityFounded.Remove(Moors_CityFounded)
				GameEvents.CityCaptureComplete.Remove(Moors_CityCaptured)
				GameEvents.TeamSetHasTech.Remove(Moors_TechLeave)
				Events.GameplayAlertMessage("everything removed")
			end
		end
	end
end

function Moors_TechEnter(iTeam, iTech, bAdopted)
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		
		if player:GetCivilizationType() == iCiv then
			if player:GetCurrentEra() == iEra then
				for pCity in player:Cities() do
					pCity:SetNumRealBuilding(iBuilding, 1);
				end
				GameEvents.PlayerCityFounded.Add(Moors_CityFounded)
				GameEvents.CityCaptureComplete.Add(Moors_CityCaptured)
				GameEvents.TeamSetHasTech.Add(Moors_TechLeave)
				
				GameEvents.TeamSetHasTech.Remove(Moors_TechEnter)
				Events.GameplayAlertMessage("added and removed")
			end
		end
	end
end


if bIsActive then
	GameEvents.TeamSetHasTech.Add(Moors_TechEnter)
end