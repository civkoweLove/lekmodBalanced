include( "Utility")

local iCiv = GameInfoTypes["CIVILIZATION_CHILE"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

function ChileTerritoryClaim(playerID, plotX, plotY, improvementID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		if improvementID == GameInfoTypes["IMPROVEMENT_FISHING_BOATS"] or improvementID == GameInfoTypes["IMPROVEMENT_DOCK"] then
			local pPlot = Map.GetPlot(plotX, plotY)
			local pUnit = pPlot:GetUnit(0)
			pUnit:PerformCultureBomb(1)
		end
	end
end

if bIsActive then
	GameEvents.BuildFinished.Add(ChileTerritoryClaim)
end