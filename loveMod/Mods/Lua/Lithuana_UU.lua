include( "Utility");
-- krivis
-- Author: lek10
-- modified by Izydor
-- DateCreated: 4/25/2018 8:23:15 PM
--------------------------------------------------------------
local iProphetID = GameInfoTypes["UNIT_PROPHET"]
local iProphetOverride = GameInfoTypes["UNIT_KRIVIS"]
local iCivType = GameInfoTypes["CIVILIZATION_LITHUANIA"]

function KriviOverride(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
	if (pPlayer:GetCivilizationType() == iCivType) then
		local pUnit = pPlayer:GetUnitByID(iUnit);
		if (pUnit:GetUnitType() == iProphetID) then
			local newUnit = pPlayer:InitUnit(iProphetOverride, pUnit:GetX(), pUnit:GetY())
			newUnit:Convert(pUnit)
		end
	end
end

function Lithuana_Turn(iPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() == iCivType) then

		if(pPlayer:GetFaith() >= pPlayer:GetMinimumFaithNextGreatProphet()) then
			local pCity = pPlayer:GetCapitalCity()
			pPlayer:SetFaith(pPlayer:GetFaith() - pPlayer:GetMinimumFaithNextGreatProphet())
			pPlayer:IncrementGreatProphetsCreated()
			pPlayer:AddFreeUnit(iProphetOverride)
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, 
									L("TXT_KEY_NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER"),
									L("TXT_KEY_NOTIFICATION_SUMMARY_GREAT_PERSON"),  
									pCity:GetX(), 
									pCity:GetY(),
									iProphetID)
		end
	end
end

if JFD_IsCivilisationActive(iCivType) then
	GameEvents.PlayerDoTurn.Add(Lithuana_Turn)
	Events.SerialEventUnitCreated.Add(KriviOverride)
end
