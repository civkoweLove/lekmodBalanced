function Liberty_Opener_OnPolicyAdopted(playerID, policyID)

	local player = Players[playerID]

	if	(policyID == GameInfo.Policies["POLICY_CITIZENSHIP"].ID) then

		-- The player has adopted Citizenship. Add a Monument of Freedom to the capital.
		local pCity = player:GetCapitalCity();
		pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_MONUMENT_OF_FREEDOM"], 1);
	end
end
GameEvents.PlayerAdoptPolicy.Add(Liberty_Opener_OnPolicyAdopted);