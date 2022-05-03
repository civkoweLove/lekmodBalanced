local WallID = GameInfoTypes["BUILDING_GREAT_WALL"]
local WatchtowerID = GameInfoTypes["BUILDING_WATCH_TOWER"]

function GreatWall_Constructed(iPlayer, iCity, eBuilding, bGold, bFaithOrCulture)
	if (eBuilding == WallID) then
		local player = Players[iPlayer]
		for pCity in player:Cities() do
			pCity:SetNumRealBuilding(WatchtowerID, 1)
		end
		GameEvents.CityConstructed.Remove(GreatWall_Constructed)
	end
end
GameEvents.CityConstructed.Add(GreatWall_Constructed)