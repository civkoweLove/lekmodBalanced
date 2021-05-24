include( "Utility");
include("FLuaVector.lua")

-- Ottoman new UA addition
-- Code by Uighur_Caesar

local ottoID = GameInfoTypes.CIVILIZATION_OTTOMAN

function OttoPromotion(ownerId, unitId, ePromotion)
local player = Players[ownerId]
		if player:IsAlive() and player:GetCivilizationType() == ottoID then
		local unit = player:GetUnitByID(unitId)
		local xp = unit:GetExperience()
		local needed = unit:ExperienceNeeded()
		local faith = math.ceil(needed / 3)
		player:ChangeFaith(faith)
		if player:IsHuman() and Game.GetActivePlayer() == ownerId then
			local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ENDCOLOR] [ICON_PEACE]", faith), true)
		end
	end
end

if JFD_IsCivilisationActive(ottoID) then
	GameEvents.UnitPromoted.Add(OttoPromotion)
end