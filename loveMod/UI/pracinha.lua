-- Brazilian UU promo during golden ages
-- Code by Izydor

--swaps between active and inactive promo depending on golden age
local unitPromotionPracinhaActiveID	= GameInfoTypes["PROMOTION_PRACINHA_ACTIVE"]
local unitPromotionPracinhaID		= GameInfoTypes["PROMOTION_PRACINHA"]

function brazilian_Pracinha_PlayerDoTurn(playerID)
	local player = Players[playerID]

	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	
	for unit in player:Units() do
		if (unit and (unit:IsHasPromotion(unitPromotionPracinhaID) or unit:IsHasPromotion(unitPromotionPracinhaActiveID))) then
			if (player:IsGoldenAge()) then
				if (not unit:IsHasPromotion(unitPromotionPracinhaActiveID)) then
					unit:SetHasPromotion(unitPromotionPracinhaActiveID, true)
					unit:SetHasPromotion(unitPromotionPracinhaID, false)
				end
			else
				if  (unit:IsHasPromotion(unitPromotionPracinhaActiveID)) then
					unit:SetHasPromotion(unitPromotionPracinhaActiveID, false)
					unit:SetHasPromotion(unitPromotionPracinhaID, true)
				end
			end	
		end
	end
end
GameEvents.PlayerDoTurn.Add(brazilian_Pracinha_PlayerDoTurn)