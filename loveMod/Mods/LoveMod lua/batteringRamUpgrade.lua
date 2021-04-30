function batteringRamUpgrade(ePlayer, iUnit, iNewUnit, bGoodyHut)
    local pPlayer = Players[ePlayer];
    local pUnit = pPlayer:GetUnitByID(iUnit);

    if pUnit:GetUnitType() == GameInfoTypes["UNIT_BATTERING_RAM"] then
        local promotion = GameInfoTypes["PROMOTION_COVER_1"]
        pUnit:SetHasPromotion(promotion, false);
        promotion = GameInfoTypes["PROMOTION_COVER_2"]
        pUnit:SetHasPromotion(promotion, false);
    end
end
GameEvents.UnitUpgraded.Add(batteringRamUpgrade);
