function ForestPlanted(playerID, plotX, plotY, improvementID)
    if improvementID == GameInfoTypes["IMPROVEMENT_FOREST"] then
        local plot = Map.GetPlot(plotX, plotY)
        plot:SetImprovementType(-1);
        plot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1);
		plot:SetPlantedForest();
    end
end
GameEvents.BuildFinished.Add(ForestPlanted)