-- Add Governor's Mansion to newly founded cities
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