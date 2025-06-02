-- add statue of freedom to new city
function Liberty_CollectiveRule_OnFoundCity(iPlayer, iCityX, iCityY)
	local player = Players[iPlayer]
	if (player:HasPolicy(GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID)) then
		for loopCity in player:Cities() do
			if (loopCity:GetX() == iCityX) then
				if (loopCity:GetY() == iCityY) then
					loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_STATUE_OF_FREEDOM"], 1)
				end
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(Liberty_CollectiveRule_OnFoundCity)

-- add statue of freedom to all cities except capital
function Liberty_CollectiveRule_OnPolicyAdopted(playerID, policyID)
	local player = Players[playerID]
	local skips = 1
	if	(policyID == GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID) then
		for loopCity in player:Cities() do
			if skips == 0 and loopCity:GetOwner() == playerID then
				loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_STATUE_OF_FREEDOM"], 1)
			else
				skips = skips - 1
			end
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(Liberty_CollectiveRule_OnPolicyAdopted);