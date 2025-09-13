local direction = {0,1,2,3,4,5}


function Huey(iPlayer, iCity, iBuilding)
	local player = Players[iPlayer]
    local city = player:GetCityByID(iCity)

	if iBuilding == GameInfoTypes["BUILDING_HUEY"] then
        local nearby_lake = false
	    if Map.GetPlot(city:GetX(), city:GetY()) then
		    for direction = 0, 5 do
			    local adjPlot = Map.PlotDirection(city:GetX(), city:GetY(), direction)
			    if (adjPlot:IsLake() or adjPlot:GetFeatureType() ==  GameInfoTypes["FEATURE_LAKE_VICTORIA"])
			    and adjPlot:GetOwner() == iPlayer then
			        nearby_lake = true
			        break
			    end
		    end
		    if nearby_lake then
		        return true
		    else
		        return false
	        end
	    end
    end

return true
end
GameEvents.CityCanConstruct.Add(Huey)