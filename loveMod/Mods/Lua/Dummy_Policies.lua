
-- Author: EnormousApplePie
-- Created: 28-11-2019

include( "Utility");
include("FLuaVector.lua")

-- Mexico dummy policy

print("dummy policy loaded - Mexico")
function DummyPolicy(player)
	print("working - Mexico")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_LEXICO"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_LEXICO"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_LEXICO"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- New zealand dummy policy

print("dummy policy loaded - NZ")
function DummyPolicy(player)
	print("working - NZ")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_NEW_ZEALAND"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_NZ"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_NZ"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Kilwa Dummy policy

print("dummy policy loaded - Kilwa")
function DummyPolicy(player)
	print("working - Kilwa")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_KILWA"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_KILWA"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_KILWA"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Turkey dummy Policy
print("dummy policy loaded - Turkey")
function DummyPolicy(player)
	print("working - Turkey")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_UC_TURKEY"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_TURKEY"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_TURKEY"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)


-- Ireland dummy Policy
print("dummy policy loaded - Ireland")
function DummyPolicy(player)
	print("working - Ireland")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_IRELAND"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_IRELAND"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_IRELAND"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Ireland dummy Policy
print("dummy policy loaded - Ireland")
function DummyPolicy(player)
	print("working - Ireland")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_IRELAND"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_IRELAND"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_IRELAND"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Scotland dummy Policy
print("dummy policy loaded - Scotland")
function DummyPolicy(player)
	print("working - Wales")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_SCOTLAND"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_SCOTLAND"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_SCOTLAND"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Romania dummy Policy
print("dummy policy loaded - Romania")
function DummyPolicy(player)
	print("working - Romania")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_ROMANIA"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_ROMANIA"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_ROMANIA"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Goth dummy Policy
print("dummy policy loaded - Goth")
function DummyPolicy(player)
	print("working - Goth")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GOTH"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_GOTH"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_GOTH"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)
-- Korea dummy policy
print("dummy policy loaded - Germany")
function DummyPolicy(player)
	print("working - Germany")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GERMANY"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_GERMANY"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_GERMANY"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Korea dummy policy
print("dummy policy loaded - Korea")
function DummyPolicy(player)
	print("working - Korea")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_KOREA"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_KOREA"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_KOREA"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Akkad dummy policy
print("dummy policy loaded - Akkad")
function DummyPolicy(player)
	print("working - Akkad")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_LITE_AKKAD"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_AKKAD"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_AKKAD"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)

-- Prussia dummy policy
print("dummy policy loaded - Prussia")
function DummyPolicy(player)
	print("working - Prussia")
	for playerID, player in pairs(Players) do
		local player = Players[playerID];
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_PRUSSIA"] then
			if not player:HasPolicy(GameInfoTypes["POLICY_DUMMY_PRUSSIA"]) then
				
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(GameInfoTypes["POLICY_DUMMY_PRUSSIA"], true)	
			end
		end
	end 
end
Events.SequenceGameInitComplete.Add(DummyPolicy)