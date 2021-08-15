include( "Utility")

-- bolivia UA
local iCiv = GameInfoTypes["CIVILIZATION_LEU_BOLIVIA_BELZU"]
local iProductionPolicy = GameInfoTypes["POLICY_BOLIVIA_PRODUCTION"]
local iFoodPolicy = GameInfoTypes["POLICY_BOLIVIA_FOOD"]
local iArtist = GameInfoTypes["UNIT_ARTIST"]
local iWriter = GameInfoTypes["UNIT_WRITER"]
local iTech = GameInfoTypes["TECH_CHEMISTRY"]
local bIsActive = JFD_IsCivilisationActive(iCiv)
local bIsEverTriggered = false

function BoliviaPersonExpended(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:GetCivilizationType() == iCiv then
		if Teams[pPlayer:GetTeam()]:IsHasTech(iTech) then
			if (iUnit == iArtist) then
				pPlayer:SetHasPolicy(iFoodPolicy, false)
				pPlayer:SetHasPolicy(iProductionPolicy, true)
				if Game.GetActivePlayer() == iPlayer then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_THP_BOLIVIA_BUTTON_TITLE_RIGHT"))
				end
			elseif (iUnit == iWriter) then
				pPlayer:SetHasPolicy(iProductionPolicy, false)
				pPlayer:SetHasPolicy(iFoodPolicy, true)
				if Game.GetActivePlayer() == iPlayer then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_THP_BOLIVIA_BUTTON_TITLE_LEFT"))
				end
				
			end
			
			if (not bIsEverTriggered) and ((pPlayer:HasPolicy(iFoodPolicy)) or (pPlayer:HasPolicy(iProductionPolicy))) then
				pPlayer:SetNumFreePolicies(1)
				pPlayer:SetNumFreePolicies(0)
				bIsEverTriggered = true
			end
		end
	end
end

if bIsActive then
	GameEvents.GreatPersonExpended.Add(BoliviaPersonExpended)
end