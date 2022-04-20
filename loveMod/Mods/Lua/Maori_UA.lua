include( "Utility")

-- Maori Promotion (UA) 
-- Code by EnormousApplePie
-- modyfied by Izydor

local unitPromotionActiveCivilID = GameInfoTypes["PROMOTION_MAORI_CIVILIAN"]
local move_denominator = GameDefines["MOVE_DENOMINATOR"]
local civID = GameInfoTypes["CIVILIZATION_MC_MAORI"]

function Maori_Unit_Create_Early(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	if not (pPlayer:GetCivilizationType() == civID) then return end
	local unit = pPlayer:GetUnitByID(iUnit)
	unit:SetHasPromotion(unitPromotionActiveCivilID, true)
end

function Maori_Unit_Create_Late(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	if not (pPlayer:GetCivilizationType() == civID) then return end
	local unit = pPlayer:GetUnitByID(iUnit)
	if not (unit:GetGameTurnCreated() == Game:GetGameTurn()) then return end	
	unit:ChangeMoves(2*move_denominator)
end

function Maori_Turn(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civID) then
		local Gameturn = Game.GetGameTurn()
		if Gameturn >= 9 then 
			for unit in player:Units() do
				unit:SetHasPromotion(unitPromotionActiveCivilID, false)
			end
			Events.SerialEventUnitCreated.Remove(Maori_Unit_Create_Early)
			GameEvents.PlayerDoTurn.Remove(Maori_Turn)
		end
	end
end

if JFD_IsCivilisationActive(civID) then
	GameEvents.PlayerDoTurn.Add(Maori_Turn)
	Events.SerialEventUnitCreated.Add(Maori_Unit_Create_Early)
	Events.SerialEventUnitCreated.Add(Maori_Unit_Create_Late);
end
