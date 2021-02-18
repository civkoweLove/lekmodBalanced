-- Austria dummy policy
function DummyPolicyAustria(player)
    for playerID, player in pairs(Players) do
        local player = Players[playerID];
        if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_AUSTRIA"] then
            if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_AUSTRIA"]) then

                player:SetNumFreePolicies(1)
                player:SetNumFreePolicies(0)
                player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_AUSTRIA"], true)
            end
        end
    end
end
Events.SequenceGameInitComplete.Add(DummyPolicyAustria)
