include( "Utility");

local promotionActive	= GameInfoTypes["PROMOTION_CARABINIERI_ACTIVE"]
local promotion		    = GameInfoTypes["PROMOTION_CARABINIERI"]

function carabinieri_PlayerDoTurn(playerID)
    local player = Players[playerID]

    if player:IsBarbarian() then return end
    if (not player:IsAlive()) then return end

    for unit in player:Units() do
        if (unit and (unit:IsHasPromotion(promotion) or unit:IsHasPromotion(promotionActive))) then
            if (unit:GetFortifyTurns() > 0) then
                unit:SetHasPromotion(promotionActive, true);
                unit:SetHasPromotion(promotion, false);
            else
                unit:SetHasPromotion(promotionActive, false);
                unit:SetHasPromotion(promotion, true);
            end
        end
    end
end

local civ = GameInfoTypes["CIVILIZATION_ITALY"]
local unit = GameInfoTypes["UNIT_CARABINIERI"]

Events.SequenceGameInitComplete.Add(function(player)
    if isUUInGame(unit, civ) then
        GameEvents.PlayerDoTurn.Add(carabinieri_PlayerDoTurn)
    end
end)
