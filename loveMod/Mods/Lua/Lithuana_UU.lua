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
    if (pPlayer:IsEverAlive()) then
        if (pPlayer:GetCivilizationType() == iCivType) then
       	    if pPlayer:GetUnitByID(iUnit) ~= nil then
				pUnit = pPlayer:GetUnitByID(iUnit);
                if (pUnit:GetUnitType() == iProphetID) then
                    local newUnit = pPlayer:InitUnit(iProphetOverride, pUnit:GetX(), pUnit:GetY())
                    newUnit:Convert(pUnit);
                end
            end
        end
    end
end

if JFD_IsCivilisationActive(iCivType) then
	Events.SerialEventUnitCreated.Add(KriviOverride)
end
