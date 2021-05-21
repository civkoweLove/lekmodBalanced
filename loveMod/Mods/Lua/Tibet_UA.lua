-- Tibet new Trait UA
print("loaded tibet ua")
GameEvents.TeamSetHasTech.Add(function(iTeam, iTech, bAdopted)
	print("working: tibet UA 25%")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TIBET"] then
			if player:GetTeam() == iTeam then
				if (iTech == GameInfoTypes["TECH_DRAMA"]) then
					local pCity = player:GetCapitalCity();
					pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TIBET"], 1);
				end
			end
		end
	end
end)
GameEvents.TeamSetHasTech.Add(function(iTeam, iTech, bAdopted)
	print("working: tibet UA 50%")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TIBET"] then
			if player:GetTeam() == iTeam then
				if (iTech == GameInfoTypes["TECH_ACOUSTICS"]) then
					local pCity = player:GetCapitalCity();
					pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TIBET2"], 1);
				end
			end
		end
	end
end)
GameEvents.TeamSetHasTech.Add(function(iTeam, iTech, bAdopted)
	print("working: tibet UA 75%")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TIBET"] then
			if player:GetTeam() == iTeam then
				if (iTech == GameInfoTypes["TECH_RADIO"]) then
					local pCity = player:GetCapitalCity();
					pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TIBET3"], 1);
				end
			end
		end
	end
end)
GameEvents.TeamSetHasTech.Add(function(iTeam, iTech, bAdopted)
	print("working: tibet UA 100%")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TIBET"] then
			if player:GetTeam() == iTeam then
				if (iTech == GameInfoTypes["TECH_GLOBALIZATION"]) then
					local pCity = player:GetCapitalCity();
					pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TIBET4"], 1);
				end
			end
		end
	end
end)

function TibetLateEraFix(iPlayer, iX, iY)
    local player = Players[iPlayer]
    if (player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TIBET"]) and (player:GetNumCities() == 1) then
        local pTeam = Teams[player:GetTeam()]
        local pCity = player:GetCapitalCity();
        if (pTeam:IsHasTech(GameInfoTypes["TECH_DRAMA"])) then
            pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TIBET"], 1);
        end
        if (pTeam:IsHasTech(GameInfoTypes["TECH_ACOUSTICS"])) then
            pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TIBET2"], 1);
        end
        if (pTeam:IsHasTech(GameInfoTypes["TECH_RADIO"])) then
            pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TIBET3"], 1);
        end
        if (pTeam:IsHasTech(GameInfoTypes["TECH_GLOBALIZATION"])) then
            pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TIBET4"], 1);
        end
        GameEvents.PlayerCityFounded.Remove(TibetLateEraFix);
    end
end

function TibetLateEraFixInit(player)
    for playerID, player in pairs(Players) do
        local player = Players[playerID];
        if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TIBET"] then
            GameEvents.PlayerCityFounded.Add(TibetLateEraFix);
        end
    end
end
Events.SequenceGameInitComplete.Add(TibetLateEraFixInit)
