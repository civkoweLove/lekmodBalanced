-- Finish UU hotfix
-- Code by Izydor

local unitPromotionSissiID		= GameInfoTypes["PROMOTION_SISSI_STEEL_SKIN"]
local unitTypeSissi = GameInfoTypes["UNIT_FINNISH_FOREST_PATROL"]

function finish_SissiDoTurn(playerID)
    local player = Players[playerID]

    if (not player:IsAlive()) then return end
    if player:IsBarbarian() then return end

    for unit in player:Units() do
        if (unit and (unit:GetUnitType() == unitTypeSissi) and (not unit:IsHasPromotion(unitPromotionSissiID))) then
            unit:SetHasPromotion(unitPromotionSissiID, true)
        end
    end
end
GameEvents.PlayerDoTurn.Add(brazilian_Pracinha_PlayerDoTurn)