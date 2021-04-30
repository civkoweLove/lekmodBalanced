-- Brazilian UU promo during golden ages
-- Code by Izydor
--swaps between active and inactive promo depending on golden age

include( "Utility");

local unitPromotionPracinhaActiveID	= GameInfoTypes["PROMOTION_PRACINHA_ACTIVE"]
local unitPromotionPracinhaID		= GameInfoTypes["PROMOTION_PRACINHA"]

function brazilian_Pracinha_PlayerDoTurn(playerID)
	local player = Players[playerID]

	if player:IsBarbarian() then return end
	if (not player:IsAlive()) then return end

	for unit in player:Units() do
		if (unit and (unit:IsHasPromotion(unitPromotionPracinhaActiveID) or unit:IsHasPromotion(unitPromotionPracinhaID))) then
			if (player:IsGoldenAge()) then
				unit:SetHasPromotion(unitPromotionPracinhaActiveID, true);
				unit:SetHasPromotion(unitPromotionPracinhaID, false);
			else
				unit:SetHasPromotion(unitPromotionPracinhaActiveID, false);
				unit:SetHasPromotion(unitPromotionPracinhaID, true);
			end
		end
	end
end

local civ = GameInfoTypes["CIVILIZATION_BRAZIL"]
local unit = GameInfoTypes["UNIT_BRAZILIAN_PRACINHA"]

Events.SequenceGameInitComplete.Add(function(player)
	if isUUInGame(unit, civ) then
		GameEvents.PlayerDoTurn.Add(brazilian_Pracinha_PlayerDoTurn)
	end
end)