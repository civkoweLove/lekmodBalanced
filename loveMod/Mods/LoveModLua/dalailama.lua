local iDalailama = GameInfo.Units.UNIT_DALAILAMA.ID

function dalailamaExpended(iPlayer, iUnit, eUnit, iPlotX, iPlotY, bDelay, eByPlayer)
    -- triggers if Dalailama was killed by founding religion etc. not by combat
    if (eUnit == iDalailama) and bDelay then
        local pPlayer = Players[iPlayer];
        pPlayer:ChangeGoldenAgeTurns(7);
    end
end

GameEvents.UnitPrekill.Add(dalailamaExpended)
