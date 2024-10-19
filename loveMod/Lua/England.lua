include( "Utility");
local iCiv = GameInfoTypes["CIVILIZATION_ENGLAND"]
local iTech = GameInfoTypes["TECH_GUILDS"]
local iComposite = GameInfoTypes["UNIT_COMPOSITE_BOWMAN"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

function EnglandComposite(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iCiv then
		if iUnit == iComposite then
			local iTeam = pPlayer:GetTeam()
			local pTeam = Teams[iTeam]
			if pTeam:IsHasTech(iTech) then
				return false
			end
		end
	end
	return true
end

if bIsActive then
	GameEvents.CityCanTrain.Add(EnglandComposite)
end