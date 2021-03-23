local iDalailama = GameInfo.Units.UNIT_DALAILAMA.ID
local iProphetID = GameInfo.Units.UNIT_PROPHET.ID
local iCivType = GameInfo.Civilizations["CIVILIZATION_TIBET"].ID

function dalailamaExpended(iPlayer, iUnit, eUnit, iPlotX, iPlotY, bDelay, eByPlayer)
    -- triggers if Dalailama was killed by founding religion etc. not by combat
    if (eUnit == iDalailama) and bDelay then
        local pPlayer = Players[iPlayer];
        pPlayer:ChangeGoldenAgeTurns(7);
    end
end
GameEvents.UnitPrekill.Add(dalailamaExpended)

function dalailamaBorn(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:GetCivilizationType() == iCivType) then
        local pUnit = pPlayer:GetUnitByID(iUnit);
        if (pUnit:GetUnitType() == iProphetID) or (pUnit:GetUnitType() == iDalailama) then
            pPlayer:ChangeFaith(math.max(45, (pPlayer:GetMinimumFaithNextGreatProphet()) * 0.15))
        end
    end
end
Events.SerialEventUnitCreated.Add(dalailamaBorn)