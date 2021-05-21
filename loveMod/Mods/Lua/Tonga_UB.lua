include( "Utility")

-- Tongo UB food
-- Code by JFD
-- modyfied by Izydor
-- Hoped to edit it somewhat and make it slightly more original, but I couldn't quite change it without bringing down the balance ~EAP

local direction_types = {
		DirectionTypes["DIRECTION_NORTHEAST"],
		DirectionTypes["DIRECTION_NORTHWEST"],
		DirectionTypes["DIRECTION_EAST"],
		DirectionTypes["DIRECTION_SOUTHEAST"],
		DirectionTypes["DIRECTION_SOUTHWEST"],
		DirectionTypes["DIRECTION_WEST"]
		}

function JFD_GetNumAdjacentSeaTiles(city)
	local numAdjacentSeaTiles = 0
	if Map.GetPlot(city:GetX(), city:GetY()) then
		for loop, direction in ipairs(direction_types) do
			local adjPlot = Map.PlotDirection(city:GetX(), city:GetY(), direction)
			if adjPlot:GetTerrainType() == GameInfoTypes["TERRAIN_COAST"] then
					numAdjacentSeaTiles = numAdjacentSeaTiles + 1
			end
		end
	end

	return numAdjacentSeaTiles
end

function JFD_MalaeFood(playerID, iCity, eBuilding, bGold, bFaithOrCulture)
	local player = Players[playerID]
	local city = player:GetCityByID(iCity)
	if (eBuilding == GameInfoTypes["BUILDING_MC_TONGAN_MALAE"]) and (JFD_GetNumAdjacentSeaTiles(city) >= 3) then
		city:SetNumRealBuilding(GameInfoTypes["BUILDING_MC_MALAE_FOOD"], 1)
	end
end

if JFD_IsCivilisationActive(GameInfoTypes["CIVILIZATION_MC_TONGA"]) then
	GameEvents.CityConstructed.Add(JFD_MalaeFood)
end