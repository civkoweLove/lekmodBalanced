-- add statue of tradition to new city
function Tradition_Oligarchy_OnFoundCity(iPlayer, iCityX, iCityY)
	local player = Players[iPlayer]
	if (player:HasPolicy(GameInfo.Policies["POLICY_OLIGARCHY"].ID)) then
		for loopCity in player:Cities() do
			if (loopCity:GetX() == iCityX) then
				if (loopCity:GetY() == iCityY) then
					loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_STATUE_OF_TRADITION"], 1)
				end
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(Tradition_Oligarchy_OnFoundCity)

-- add statue of tradition to all cities
function Tradition_Oligarchy_OnPolicyAdopted(playerID, policyID)
	local player = Players[playerID]
	if	(policyID == GameInfo.Policies["POLICY_OLIGARCHY"].ID) then
		for loopCity in player:Cities() do
			loopCity:SetNumRealBuilding(GameInfoTypes["BUILDING_STATUE_OF_TRADITION"], 1)
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(Tradition_Oligarchy_OnPolicyAdopted);