function StartReveal(player)
    for playerID, player in pairs(Players) do
        local player = Players[playerID];
        for unit in player:Units() do
            if (unit and (unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_SETTLER"])) then
                -- make sure settlers have 4 sight
                if (unit:GetUnitType() == GameInfoTypes["UNIT_PIONEER"]) or (player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_MAORI"]) then
                    unit:SetHasPromotion(GameInfoTypes["PROMOTION_EXTRA_SIGHT_I"], true);
                else
                    unit:SetHasPromotion(GameInfoTypes["PROMOTION_EXTRA_SIGHT_II"], true);
                end

                unit:SetHasPromotion(GameInfoTypes["PROMOTION_CAN_MOVE_IMPASSABLE"], true);
                local settlerPlot = unit:GetPlot();
                local memoryPlotType = settlerPlot:GetPlotType();
                settlerPlot:SetPlotType(PlotTypes.PLOT_MOUNTAIN, false, false);
                settlerPlot:SetPlotType(memoryPlotType, false, false);
                unit:SetHasPromotion(GameInfoTypes["PROMOTION_EXTRA_SIGHT_I"], false);
                unit:SetHasPromotion(GameInfoTypes["PROMOTION_EXTRA_SIGHT_II"], false);
                unit:SetHasPromotion(GameInfoTypes["PROMOTION_CAN_MOVE_IMPASSABLE"], false);
            end
        end
    end
end
Events.SequenceGameInitComplete.Add(StartReveal)