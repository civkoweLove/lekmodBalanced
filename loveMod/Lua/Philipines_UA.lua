include( "Utility")

local iCiv = GameInfoTypes["CIVILIZATION_CB_AGUINALDOPH"]
local iBuilding = GameInfoTypes["BUILDING_TRAIT_GOOD_FIGHT"]

function Philipines_OnFoundCity(iPlayer, iCityX, iCityY)
	local player = Players[iPlayer]
	if player:GetCivilizationType() == iCiv then
		local citiesFounded = player:GetNumCitiesFounded();
		if citiesFounded <= 3 and citiesFounded > 1 then
			for loopCity in player:Cities() do
				if (loopCity:GetX() == iCityX) then
					if (loopCity:GetY() == iCityY) then
						loopCity:SetNumRealBuilding(iBuilding, 1)
					end
				end
			end
		end
			
		if citiesFounded == 3 then
			GameEvents.PlayerCityFounded.Remove(Philipines_OnFoundCity)
		end
	end
end

local iPromotion = GameInfoTypes["PROMOTION_GOOD_FIGHT"]
local iWorker = GameInfoTypes["UNITCLASS_WORKER"]
local iSettler = GameInfoTypes["UNITCLASS_SETTLER"]
local iSea = GameInfoTypes["DOMAIN_SEA"]

function Philipines_OnUnitCreate(iPlayer, iUnit)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iCiv then
		local unit = pPlayer:GetUnitByID(iUnit)
		local iType = unit:GetUnitClassType()
		local iDomain = unit:GetDomainType()
		if iType == iWorker or iType == iSettler or iDomain == iSea then
			unit:SetHasPromotion(iPromotion, true)
		end
	end
end

if JFD_IsCivilisationActive(iCiv) then
	GameEvents.PlayerCityFounded.Add(Philipines_OnFoundCity)
	Events.SerialEventUnitCreated.Add(Philipines_OnUnitCreate)
end