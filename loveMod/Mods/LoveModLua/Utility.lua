function isUUInGame(unit, civ)
    for playerID, player in pairs(Players) do
        local player = Players[playerID];
        if (player:GetCivilizationType() == civ) or (player:GetMinorCivUniqueUnit() == unit) then
            return true
        end
    end
    return false
end

function JFD_IsCivilisationActive(civilissationID)
    for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
        local slotStatus = PreGame.GetSlotStatus(iSlot)
        if (slotStatus == SlotStatus["SS_TAKEN"]) or (slotStatus == SlotStatus["SS_COMPUTER"]) then
            if PreGame.GetCivilization(iSlot) == civilissationID then
                return true
            end
        end
    end
    return false
end