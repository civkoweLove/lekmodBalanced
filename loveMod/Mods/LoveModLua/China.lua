include( "Utility");

function China_turn(playerID)
    local player = Players[playerID]

    if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CHINA"] then
        for unit in player:Units() do
            if unit:IsNearGreatGeneral() and not unit:IsStackedGreatGeneral() then
                unit:ChangeMoves(60) --60 means 1 more move
            end
        end
    end
end

if JFD_IsCivilisationActive(GameInfoTypes["CIVILIZATION_CHINA"]) then
    GameEvents.PlayerDoTurn.Add(China_turn)
end
