include( "Utility");

local iCiv = GameInfoTypes["CIVILIZATION_CZECH"]
local iCurrency = GameInfoTypes["TECH_CURRENCY"]
local iBuilding = GameInfoTypes["BUILDING_CZECH_TRAIT_UB"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

function Czech_Tech(iTeam, iTech, bAdopted)
	if iTech == iCurrency then
		for playerID, player in pairs(Players) do
			local player = Players[playerID]
			if player:GetCivilizationType() == iCiv then
				if player:GetTeam() == iTeam then
					local pCity = player:GetCapitalCity()
					pCity:SetNumRealBuilding(iBuilding, 1)
					GameEvents.TeamSetHasTech.Remove(Czech_Tech)
				end
			end
		end
	end
end
	
if bIsActive then
	GameEvents.TeamSetHasTech.Add(Czech_Tech)
end