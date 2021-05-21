include( "Utility");

-- New Zealand UA 
-- Original code by JDF

 function GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
     
local civID = GameInfoTypes["CIVILIZATION_MC_NEW_ZEALAND"]

function NZ_Team_Met(playerMetID, playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civID then
		local playerMet = Players[playerMetID]
		local majorsMet = Teams[playerMet:GetTeam()]:GetHasMetCivCount(true)
		local rewardCulture = 8
		local rewardScience = 6
		local rewardGold = 40
		local rewardFaith = 14
		local random = GetRandom(1, 4)
		if random == 1 then
			player:ChangeFaith(rewardFaith)
			if player:IsHuman() and player:GetCivilizationType() == civID and Game.GetActivePlayer() == playerID then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("You receive {1_Num} [ICON_PEACE] Faith from meeting {2_CivName}", rewardFaith, playerMet:GetName()))
			end
		elseif random == 2 then
			player:ChangeJONSCulture(rewardCulture)
			if player:IsHuman() and player:GetCivilizationType() == civID and Game.GetActivePlayer() == playerID then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("You receive {1_Num} [ICON_CULTURE] Culture from meeting {2_CivName}", rewardCulture, playerMet:GetName()))
			end
		elseif random == 3 then
			Teams[player:GetTeam()]:GetTeamTechs():ChangeResearchProgress(player:GetCurrentResearch(), rewardScience, playerID)
			if player:IsHuman() and player:GetCivilizationType() == civID and Game.GetActivePlayer() == playerID then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("You receive {1_Num} [ICON_RESEARCH] Science from meeting {2_CivName}", rewardScience, playerMet:GetName()))
			end
		else
			player:ChangeGold(rewardGold)
			if player:IsHuman() and player:GetCivilizationType() == civID and Game.GetActivePlayer() == playerID then
				 Events.GameplayAlertMessage(Locale.ConvertTextKey("You receive {1_Num} [ICON_GOLD] Gold from meeting {2_CivName}", rewardGold, playerMet:GetName()))
			end
		end
	end
end

if JFD_IsCivilisationActive(civID) then
	GameEvents.TeamMeet.Add(NZ_Team_Met)
end
