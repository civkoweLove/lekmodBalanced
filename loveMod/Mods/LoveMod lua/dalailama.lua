include( "Utility");

local iDalailama = GameInfoTypes["UNIT_DALAILAMA"]
local iProphetID = GameInfoTypes["UNIT_PROPHET"]
local iCivType = GameInfoTypes["CIVILIZATION_TIBET"]

function dalailamaExpended(iPlayer, iUnit, eUnit, iPlotX, iPlotY, bDelay, eByPlayer)
    -- triggers if Dalailama was killed by founding religion etc. not by combat
    if (eUnit == iDalailama) and bDelay then
        local pPlayer = Players[iPlayer];
        pPlayer:ChangeGoldenAgeTurns(7);
    end
end

function dalailamaBorn(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:GetCivilizationType() == iCivType) then
        local pUnit = pPlayer:GetUnitByID(iUnit);
        if (pUnit:GetUnitType() == iProphetID) or (pUnit:GetUnitType() == iDalailama) then
            pPlayer:ChangeFaith(math.max(45, (pPlayer:GetMinimumFaithNextGreatProphet()) * 0.15))
        end
    end
end


if JFD_IsCivilisationActive(iCivType) then
    Events.SerialEventUnitCreated.Add(dalailamaBorn)
    GameEvents.UnitPrekill.Add(dalailamaExpended)
end
