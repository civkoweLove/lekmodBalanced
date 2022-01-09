include( "Utility");

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
