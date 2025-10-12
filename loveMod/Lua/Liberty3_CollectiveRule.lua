function Liberty_CollectiveRule_OnFoundCity(iPlayer, iCityX, iCityY)
	local player = Players[iPlayer]
	if (player:HasPolicy(GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID)) then
		for loopCity in player:Cities() do
			if ((loopCity:GetX() == iCityX) and (loopCity:GetY() == iCityY)) then
				loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_STATUE_OF_FREEDOM"], 1)
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(Liberty_CollectiveRule_OnFoundCity)

function Liberty_CollectiveRule_OnPolicyAdopted(playerID, policyID)
	local player = Players[playerID]
	if	(policyID == GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID) then
		for loopCity in player:Cities() do
			if (loopCity:GetOwner() == playerID) then
				loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_STATUE_OF_FREEDOM"], 1)
			end
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(Liberty_CollectiveRule_OnPolicyAdopted);

function Liberty_CollectiveRule_OnCityCaptured(iOldOwner, bCapital, iCityX, iCityY, iNewOwner, iOldPopulation, bConquest, iNumGreatWorks, iCapturedGreatWorks)
	local player = Players[iNewOwner]
	if (player:HasPolicy(GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID)) then
		for loopCity in player:Cities() do
			if ((loopCity:GetX() == iCityX) and (loopCity:GetY() == iCityY) and (loopCity:GetOriginalOwner() == iNewOwner)) then
				loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_STATUE_OF_FREEDOM"], 1)
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(Liberty_CollectiveRule_OnCityCaptured)
