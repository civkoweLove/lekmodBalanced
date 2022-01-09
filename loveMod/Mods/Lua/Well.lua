function well(iPlayer, iCity, iBuilding)
    if iBuilding == GameInfoTypes["BUILDING_WELL"] then
        local player = Players[iPlayer]
        local city = player:GetCityByID(iCity)
        if city:Plot():IsRiver() then
            return false
        end
    end
    return true
end

GameEvents.CityCanConstruct.Add(well)