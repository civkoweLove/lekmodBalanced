include( "Utility");
local iCiv = GameInfoTypes["CIVILIZATION_DENMARK"]
local iTech = GameInfoTypes["TECH_METAL_CASTING"]
local iSwordsman = GameInfoTypes["UNIT_SWORDSMAN"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

function DanishSwordsman(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iCiv then
		if iUnit == iSwordsman then
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
	GameEvents.CityCanTrain.Add(DanishSwordsman)
end