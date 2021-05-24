-- Horde free building 
include( "Utility");

iCivType = GameInfoTypes["CIVILIZATION_HORDE"]

function GoldenHorde_Tech(iTeam, iTech, bAdopted)
	print("working: horde UA")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == iCivType then
			if player:GetTeam() == iTeam then
				if (iTech == GameInfoTypes["TECH_PHILOSOPHY"]) then
					local pCity = player:GetCapitalCity();
					pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_JARLIQ"], 1);
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(iCivType) then
	GameEvents.TeamSetHasTech.Add(GoldenHorde_Tech)
end