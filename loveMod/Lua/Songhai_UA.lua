include( "Utility");

local civID = GameInfoTypes["CIVILIZATION_SONGHAI"]
local iFaith = 15

function SonghaiCampCleared(iPlayer, iX, iY)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == civID then
		pPlayer:ChangeFaith(iFaith)
		if pPlayer:IsHuman() and Game.GetActivePlayer() == iPlayer then
			local hex = ToHexFromGrid(Vector2(iX, iY))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ENDCOLOR] [ICON_PEACE]", iFaith), true)
		end
	end
end

if JFD_IsCivilisationActive(civID) then
	GameEvents.CampCleared.Add(SonghaiCampCleared)
end
