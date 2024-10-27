-- convert new city
function Piety_Mandate_OnFoundCity(iPlayer, iCityX, iCityY)
	local player = Players[iPlayer]
	local iReligion = player:GetReligionCreatedByPlayer()
	if (player:HasPolicy(GameInfo.Policies["POLICY_MANDATE_OF_HEAVEN"].ID) and iReligion ~= -1) then
		for loopCity in player:Cities() do
			if (loopCity:GetX() == iCityX) then
				if (loopCity:GetY() == iCityY) then
					loopCity:ConvertPercentFollowers(iReligion, -1, 100)
				end
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(Piety_Mandate_OnFoundCity)
