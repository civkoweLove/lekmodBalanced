function ForestPlanted(iHexX, iHexY, iContinent1, iContinent2)
    local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY))
    if (pPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_FOREST.ID) then
        pPlot:SetImprovementType(-1);
        pPlot:SetFeatureType(FeatureTypes.FEATURE_FOREST, -1);
    end
end
Events.SerialEventImprovementCreated.Add(ForestPlanted)