include( "Utility")

--- Cuba ua
local iCiv = GameInfoTypes["CIVILIZATION_UC_CUBA_BATISTA"]
local iUnit = GameInfoTypes["UNIT_GUERRILLERO"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

-- UB: Dance Hall

function DanceHallDoTurn(iPlayer)
    local pPlayer = Players[iPlayer]
    if pPlayer:GetCivilizationType() == iCiv then
        for pCity in pPlayer:Cities() do
            if pCity:IsHasBuilding(GameInfoTypes["BUILDING_DANCE_HALL"]) then
                if pCity:GetNumGreatWorksInBuilding(GameInfoTypes["BUILDINGCLASS_OPERA_HOUSE"]) > 0 then
                    pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_CUBA_TRAIT_UB"], 1)
                else
                    pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_CUBA_TRAIT_UB"], 0)
                end
            end
        end
    end
end

-- UU

function UUnlock(iPlayer, policyTypeID)
	local player = Players[iPlayer]
	local capital = player:GetCapitalCity()
	
	if player:GetCivilizationType() == iCiv then
		local policyLevel = GameInfo.Policies[policyTypeID].Level
		if policyLevel == 1 then
			player:SetNumFreePolicies(player:GetNumFreePolicies() + 1)
			player:SetNumFreePolicies(player:GetNumFreePolicies() - 1)
			player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_CUBA"], true)
			player:AddFreeUnit(iUnit)
			player:AddFreeUnit(iUnit)
			GameEvents.PlayerAdoptPolicy.Remove(UUnlock)
		end
	end
end


if bIsActive then
	GameEvents.PlayerAdoptPolicy.Add(UUnlock)
	GameEvents.PlayerDoTurn.Add(DanceHallDoTurn)
end
