include( "Utility")
-- Notes, do realize that this is coded keeping policy requirements/paths in mind, so if you change any of the policy paths in the future, if anyone besides me is doing policies stuff, DONT FORGET TO CHECK THIS! thnx! ~EAP
-- Italy ua

function Italy_OnPolicyAdopted_Piety(playerID, policyID)

	local player = Players[playerID]

	-- Piety finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_THEOCRACY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_MANDATE_OF_HEAVEN"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_FREE_RELIGION"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_REFORMATION"].ID)) or
			(policyID == GameInfo.Policies["POLICY_MANDATE_OF_HEAVEN"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_THEOCRACY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_FREE_RELIGION"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_REFORMATION"].ID)) or
			(policyID == GameInfo.Policies["POLICY_FREE_RELIGION"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_MANDATE_OF_HEAVEN"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_THEOCRACY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_REFORMATION"].ID)) or
			(policyID == GameInfo.Policies["POLICY_REFORMATION"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_MANDATE_OF_HEAVEN"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_FREE_RELIGION"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_THEOCRACY"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_PIETY"], 1);
		end
	end 
end

function Italy_OnPolicyAdopted_Tradition(playerID, policyID)

	local player = Players[playerID]

	-- Tradition Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_ARISTOCRACY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_LANDED_ELITE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MONARCHY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_OLIGARCHY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_LANDED_ELITE"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_ARISTOCRACY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MONARCHY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_OLIGARCHY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_MONARCHY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_LANDED_ELITE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_ARISTOCRACY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_OLIGARCHY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_OLIGARCHY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_LANDED_ELITE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MONARCHY"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_ARISTOCRACY"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_TRADITION"], 1);
		end
	end 
end

function Italy_OnPolicyAdopted_Liberty(playerID, policyID)

	local player = Players[playerID]

	-- Liberty Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_REPRESENTATION"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MERITOCRACY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_REPRESENTATION"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MERITOCRACY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_MERITOCRACY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_COLLECTIVE_RULE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_REPRESENTATION"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_LIBERTY"], 1);
		end
	end 
end

function Italy_OnPolicyAdopted_Honor(playerID, policyID)

	local player = Players[playerID]

	-- Honor Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_MILITARY_CASTE"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_TRADITION"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_DISCIPLINE"].ID)) or
			(policyID == GameInfo.Policies["POLICY_MILITARY_TRADITION"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_CASTE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_DISCIPLINE"].ID)) or
			(policyID == GameInfo.Policies["POLICY_DISCIPLINE"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_CASTE"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_TRADITION"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_HONOR"], 1);
		end
	end 
end

function Italy_OnPolicyAdopted_Patronage(playerID, policyID)

	local player = Players[playerID]

	-- Patronage Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_CONSULATES"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_SCHOLASTICISM"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_PHILANTHROPY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_SCHOLASTICISM"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_CONSULATES"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_PHILANTHROPY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_PHILANTHROPY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_CONSULATES"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_SCHOLASTICISM"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_PATRONAGE"], 1);
		end
	end 
end

function Italy_OnPolicyAdopted_Aesthetics(playerID, policyID)

	local player = Players[playerID]

	-- Aesthetics Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_FINE_ARTS"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_FLOURISHING_OF_ARTS"].ID)) or
			(policyID == GameInfo.Policies["POLICY_FLOURISHING_OF_ARTS"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_FINE_ARTS"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_AESTHETICS"], 1);
		end
	end 
end

function Italy_OnPolicyAdopted_Exploration(playerID, policyID)

	local player = Players[playerID]

	-- Exploration Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_TREASURE_FLEETS"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_MERCHANT_NAVY"].ID)) or
			(policyID == GameInfo.Policies["POLICY_MERCHANT_NAVY"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_TREASURE_FLEETS"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_EXPLORATION"], 1);
		end
	end 
end

function Italy_OnPolicyAdopted_Rationalism(playerID, policyID)

	local player = Players[playerID]

	-- Rationalism Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_SECULARISM"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_HUMANISM"].ID)) or
			(policyID == GameInfo.Policies["POLICY_HUMANISM"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_SECULARISM"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_RATIONALISM"], 1);
		end
	end 
end

function Italy_OnPolicyAdopted_Commerce(playerID, policyID)

	local player = Players[playerID]

	-- Commerce Finished
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ITALY"] then

		if	(policyID == GameInfo.Policies["POLICY_ENTREPRENEURSHIP"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_PROTECTIONISM"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_TRADE_UNIONS"].ID)) or
			(policyID == GameInfo.Policies["POLICY_PROTECTIONISM"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_ENTREPRENEURSHIP"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_TRADE_UNIONS"].ID)) or
			(policyID == GameInfo.Policies["POLICY_TRADE_UNIONS"].ID 
			and player:HasPolicy(GameInfo.Policies["POLICY_ENTREPRENEURSHIP"].ID)
			and player:HasPolicy(GameInfo.Policies["POLICY_PROTECTIONISM"].ID)) then

			-- Finished Policy Tree, now add the building
			local pCity = player:GetCapitalCity();
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_ITALY_TRAIT_COMMERCE"], 1);
		end
	end 
end

local civID = GameInfoTypes["CIVILIZATION_ITALY"]
if JFD_IsCivilisationActive(civID) then
	GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted_Piety);
	GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted_Tradition);
	GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted_Liberty);
	GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted_Honor);
	GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted_Patronage);
	GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted_Aesthetics);
	GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted_Exploration);
	GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted_Rationalism);
	GameEvents.PlayerAdoptPolicy.Add(Italy_OnPolicyAdopted_Commerce);
end