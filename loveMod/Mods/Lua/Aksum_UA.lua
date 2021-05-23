include( "Utility");

-- Aksum UA
local civilissationID = GameInfoTypes["CIVILIZATION_AKSUM"]

if JFD_IsCivilisationActive(civilissationID) then
	print("Aksum is in this game")
end

function GetTradeRoutesNumberAksum(player, city)
	print("working: aksum 1")
	local tradeRoutes = player:GetTradeRoutes()
	local numRoutesAksum = 0
	for i, v in ipairs(tradeRoutes) do
		local originatingCity = v.FromCity
		if (originatingCity == city) then
			numRoutesAksum = numRoutesAksum + 1
		end
	end
	
	return numRoutesAksum
end

local buildingTraitAksumID = GameInfoTypes["BUILDING_AKSUM_TRAIT"]
function AksumTrait(playerID)
	print("working: aksum 2")
	local player = Players[playerID]
    if player:IsEverAlive() and player:GetCivilizationType() == civilissationID then 
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingTraitAksumID, math.min(GetTradeRoutesNumberAksum(player, city), 1)) -- it does!
		end
	end
end

if JFD_IsCivilisationActive(civilissationID) then
	GameEvents.PlayerDoTurn.Add(AksumTrait)
end