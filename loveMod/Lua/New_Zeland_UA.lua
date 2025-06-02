include( "Utility");

-- New Zealand UA 
-- Original code by JDF

function GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
     
local civID = GameInfoTypes["CIVILIZATION_MC_NEW_ZEALAND"]
local eNewZelandTeam = -1
local eNewZelandPlayer = -1
local pNewZelandPlayer = nil

function NZ_Team_Met(teamMetID, teamID)
	
	-- if we don't know where is New Zeland we must find it!
	if eNewZelandTeam == -1 then
		for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local somePlayer = Players[iPlayerLoop];
			if(somePlayer ~= nil) then
				if somePlayer:GetCivilizationType() == civID then
					eNewZelandTeam = somePlayer:GetTeam()
					eNewZelandPlayer = iPlayerLoop
					pNewZelandPlayer = Players[eNewZelandPlayer]
				end
			end
		end
	end
	
	if eNewZelandTeam == teamMetID or eNewZelandTeam == teamID then
		local rewardCulture = 8
		local rewardScience = 6
		local rewardGold = 40
		local rewardFaith = 14
		local random = GetRandom(1, 4)
		
		if random == 1 then
			pNewZelandPlayer:ChangeFaith(rewardFaith)
			if pNewZelandPlayer:IsHuman() and Game.GetActivePlayer() == eNewZelandPlayer then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("You receive {1_Num} [ICON_PEACE] Faith from meeting another civilization", rewardFaith))
			end
		elseif random == 2 then
			pNewZelandPlayer:ChangeJONSCulture(rewardCulture)
			if pNewZelandPlayer:IsHuman() and Game.GetActivePlayer() == eNewZelandPlayer then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("You receive {1_Num} [ICON_CULTURE] Culture from meeting another civilization", rewardCulture))
			end
		elseif random == 3 then
			Teams[eNewZelandTeam]:GetTeamTechs():ChangeResearchProgress(pNewZelandPlayer:GetCurrentResearch(), rewardScience, eNewZelandPlayer)
			if pNewZelandPlayer:IsHuman() and Game.GetActivePlayer() == eNewZelandPlayer then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("You receive {1_Num} [ICON_RESEARCH] Science from meeting another civilization", rewardScience))
			end
		else
			pNewZelandPlayer:ChangeGold(rewardGold)
			if pNewZelandPlayer:IsHuman() and Game.GetActivePlayer() == eNewZelandPlayer then
				 Events.GameplayAlertMessage(Locale.ConvertTextKey("You receive {1_Num} [ICON_GOLD] Gold from meeting another civilization", rewardGold))
			end
		end
	end
end

if JFD_IsCivilisationActive(civID) then
	GameEvents.TeamMeet.Add(NZ_Team_Met)
end
