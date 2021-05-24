include( "Utility");

-- Venez trait tech research
iCivType == GameInfoTypes["CIVILIZATION_VENEZ"]

function Venez_Tech(iTeam, iTech, bAdopted)
	print("working: venez UA")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == iCivType then
			if player:GetTeam() == iTeam then
				if (iTech == GameInfoTypes["TECH_COMPASS"]) then
					local pCity = player:GetCapitalCity();
					pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_VENEZ_TRAIT"], 1);
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(iCivType) then
	GameEvents.TeamSetHasTech.Add(Venez_Tech)
end