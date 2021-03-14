function BuildCanal(playerID, plotX, plotY, improvementID)
    if improvementID == GameInfoTypes["IMPROVEMENT_FORT"] or improvementID == GameInfoTypes["IMPROVEMENT_CITADEL"] then
        local plot = Map.GetPlot(plotX, plotY)
        plot:SetRouteType(GameInfoTypes["ROUTE_ROAD"]);
    end
end
--GameEvents.BuildFinished.Add(BuildCanal)