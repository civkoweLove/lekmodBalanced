function DummyPolicyBoer(player)
    for playerID, player in pairs(Players) do
        local player = Players[playerID];
        if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MALI"] then
            if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_MALI"]) then

                player:SetNumFreePolicies(1)
                player:SetNumFreePolicies(0)
                player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_MALI"], true)
            end
        end
    end
end
Events.SequenceGameInitComplete.Add(DummyPolicyBoer)
