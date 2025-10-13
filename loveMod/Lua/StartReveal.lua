local iMoveDenominator = GameDefines["MOVE_DENOMINATOR"]

function StartReveal(player)
    for playerID, player in pairs(Players) do
        local player = Players[playerID];
        for unit in player:Units() do
            if (unit and (unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_SETTLER"])) then
                -- make sure settler has 4 sight
                if (unit:VisibilityRange() == 3) then
                    unit:SetHasPromotion(GameInfoTypes["PROMOTION_EXTRA_SIGHT_I"], true);
                else
                    unit:SetHasPromotion(GameInfoTypes["PROMOTION_EXTRA_SIGHT_II"], true);
                end
				-- allow settler to stand on a mountain
                unit:SetHasPromotion(GameInfoTypes["PROMOTION_CAN_MOVE_IMPASSABLE"], true);
				-- change plot to mountain (nothing can obstruct vision
                local settlerPlot = unit:GetPlot();
                local memoryPlotType = settlerPlot:GetPlotType();
                settlerPlot:SetPlotType(PlotTypes.PLOT_MOUNTAIN, false, false); 
				-- change plot to normal and remove promotions
                settlerPlot:SetPlotType(memoryPlotType, false, false);
                unit:SetHasPromotion(GameInfoTypes["PROMOTION_EXTRA_SIGHT_I"], false);
                unit:SetHasPromotion(GameInfoTypes["PROMOTION_EXTRA_SIGHT_II"], false);
                unit:SetHasPromotion(GameInfoTypes["PROMOTION_CAN_MOVE_IMPASSABLE"], false);
				-- give the settler 3 moves and ignoring terrain (this turn only)
				unit:SetMoves(3 * iMoveDenominator);
                unit:SetHasPromotion(GameInfoTypes["PROMOTION_IGNORE_TERRAIN_COST"], true);
            end
        end
    end
end
Events.SequenceGameInitComplete.Add(StartReveal)

function SettlerTurn(playerID)
	local player = Players[playerID];
	if Game.GetElapsedGameTurns() >= 1 then 
        for unit in player:Units() do
            if (unit and (unit:GetUnitClassType() == GameInfoTypes["UNITCLASS_SETTLER"]) and (unit:GetUnitType() ~= GameInfoTypes["UNIT_PIONEER"])) then
				-- remove ignoring terrain after one turn
                unit:SetHasPromotion(GameInfoTypes["PROMOTION_IGNORE_TERRAIN_COST"], false);
			end
		end
		GameEvents.PlayerDoTurn.Remove(SettlerTurn);
	end
end
GameEvents.PlayerDoTurn.Add(SettlerTurn)