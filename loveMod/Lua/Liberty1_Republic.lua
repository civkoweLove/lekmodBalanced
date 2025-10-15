function Liberty_Republic_OnFoundCity(iPlayer, iCityX, iCityY)
	local player = Players[iPlayer]
	if (player:HasPolicy(GameInfo.Policies["POLICY_REPUBLIC"].ID)) then
		for loopCity in player:Cities() do
			if ((loopCity:GetX() == iCityX) and (loopCity:GetY() == iCityY)) then
				loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_STATUE_OF_FREEDOM"], 1)
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(Liberty_Republic_OnFoundCity)

function Liberty_Republic_OnPolicyAdopted(playerID, policyID)
	local player = Players[playerID]
	if	(policyID == GameInfo.Policies["POLICY_REPUBLIC"].ID) then
		for loopCity in player:Cities() do
			if (loopCity:GetOwner() == playerID) then
				loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_STATUE_OF_FREEDOM"], 1)
			end
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(Liberty_Republic_OnPolicyAdopted);

function Liberty_Republic_OnCityCaptured(iOldOwner, bCapital, iCityX, iCityY, iNewOwner, iOldPopulation, bConquest, iNumGreatWorks, iCapturedGreatWorks)
	local player = Players[iNewOwner]
	if (player:HasPolicy(GameInfo.Policies["POLICY_REPUBLIC"].ID)) then
		for loopCity in player:Cities() do
			if ((loopCity:GetX() == iCityX) and (loopCity:GetY() == iCityY) and (loopCity:GetOriginalOwner() == iNewOwner)) then
				loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_STATUE_OF_FREEDOM"], 1)
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(Liberty_Republic_OnCityCaptured)
