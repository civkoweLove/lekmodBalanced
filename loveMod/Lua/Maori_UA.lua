include( "Utility")

local unitPromotionActiveCivilID = GameInfoTypes["PROMOTION_MAORI_CIVILIAN"]
local move_denominator = GameDefines["MOVE_DENOMINATOR"]
local civID = GameInfoTypes["CIVILIZATION_MC_MAORI"]

function Maori_Unit_Create_Early(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() == civID) then
		if Game.GetElapsedGameTurns() < 9 then 
			local unit = pPlayer:GetUnitByID(iUnit)
			unit:SetHasPromotion(unitPromotionActiveCivilID, true)
		end
	end
end

function Maori_Unit_Create_Late(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() == civID) then
		local unit = pPlayer:GetUnitByID(iUnit)
		if (unit:GetGameTurnCreated() == Game.GetGameTurn() and not unit:HasMoved()) then	
			unit:SetMoves(unit:MaxMoves() + 2*move_denominator)
		end
	end
end

function Maori_Turn(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civID) then
		if Game.GetElapsedGameTurns() >= 9 then 
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
	Events.SerialEventUnitCreated.Add(Maori_Unit_Create_Late)
	Events.SerialEventUnitCreated.Add(Maori_Unit_Create_Early)
end
