include( "Utility");
include("FLuaVector.lua")
-- ProphetReplacer
-- Author: LastSword
-- modified by Izydor
-- DateCreated: 8/24/2013 2:56:18 PM

local iProphetID = GameInfoTypes["UNIT_PROPHET"]
local iDalailama = GameInfoTypes["UNIT_DALAILAMA"]
local iProphetID = GameInfoTypes["UNIT_PROPHET"]
local iCivType = GameInfoTypes["CIVILIZATION_TIBET"]

function TibetOverride(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
        if (pPlayer:GetCivilizationType() == iCivType) then
      	    if pPlayer:GetUnitByID(iUnit) ~= nil then
			local pUnit = pPlayer:GetUnitByID(iUnit);
               if (pUnit:GetUnitType() == iProphetID)then
					local newUnit = pPlayer:InitUnit(iDalailama, pUnit:GetX(), pUnit:GetY())
					newUnit:Convert(pUnit)
					
					local faith  = math.max(45, (pPlayer:GetMinimumFaithNextGreatProphet()) * 0.15)
					pPlayer:ChangeFaith(faith)
					if pPlayer:IsHuman() and Game.GetActivePlayer() == ownerId then
						local hex = ToHexFromGrid(Vector2(newUnit:GetX(), newUnit:GetY()))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ENDCOLOR] [ICON_PEACE]", faith), true)
					end
                end
            end
        end
    end
end

function dalailamaExpended(iPlayer, iUnit, eUnit, iPlotX, iPlotY, bDelay, eByPlayer)
    -- triggers if Dalailama was killed by founding religion etc. not by combat
    if (eUnit == iDalailama) and bDelay then
        local pPlayer = Players[iPlayer];
        pPlayer:ChangeGoldenAgeTurns(7);
    end
end

if JFD_IsCivilisationActive(iCivType) then
	Events.SerialEventUnitCreated.Add(TibetOverride)
    GameEvents.UnitPrekill.Add(dalailamaExpended)
end
