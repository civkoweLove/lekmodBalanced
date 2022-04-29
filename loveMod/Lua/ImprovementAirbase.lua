-- code by sman1975
-- modified by Izydor

local iImprovementAirbase = GameInfoTypes.IMPROVEMENT_AIRBASE
local iLateTech = GameInfoTypes.TECH_RADAR
local iMaxAircraftPerAirbaseEarly = 3
local iMaxAircraftPerAirbaseLate  = 5

--
-- CanLoadAt() is only called for plots that are neither a city nor have a cargo carrying unit in them
-- It should be used to ascertain if the plot can hold aircraft anyway (usually in an improvement)
--
function isUnpillagedAirbase(iPlayer, iUnit, iPlotX, iPlotY)
    local pPlot = Map.GetPlot(iPlotX, iPlotY)
    return (pPlot:GetImprovementType() == iImprovementAirbase) and (not pPlot:IsImprovementPillaged())
end
GameEvents.CanLoadAt.Add(isUnpillagedAirbase)

--
-- CanRebaseTo() is only called for non-city plots without a unit that can take cargo
-- It should be used to ascertain if the plot can take our aircraft anyway
--
-- The city equivalent is CanRebaseInCity()
--
function OnCanRebaseTo(iPlayer, iUnit, iPlotX, iPlotY)
  local pPlot = Map.GetPlot(iPlotX, iPlotY)
  local pPlayer = Players[iPlayer]
  local pUnit = pPlayer:GetUnitByID(iUnit)

  if (isUnpillagedAirbase(iPlayer, iUnit, iPlotX, iPlotY) and CanLandAt(pPlot, pUnit)) then
	local iMaxAircraftPerAirbase = (Teams[pPlayer:GetTeam()]:IsHasTech(iLateTech)) and iMaxAircraftPerAirbaseLate or iMaxAircraftPerAirbaseEarly
    return (CountAircraft(pPlot, pUnit) < iMaxAircraftPerAirbase)
  end

  return false
end
GameEvents.CanRebaseTo.Add(OnCanRebaseTo)

function CanLandAt(pPlot, pUnit)
    local iPlayer = pUnit:GetOwner()														-- iPlayer = Active Player, since it's for his plane we're testing

    for i = 0, pPlot:GetNumUnits()-1, 1 do													-- Check the units on the tile (if any)
        local pPlotUnit = pPlot:GetUnit(i)													-- Set up Plot Unit Pointer
        if (pPlotUnit:GetOwner() ~= iPlayer) then											-- Unit owner is not the Active player - return false early
            return false																	-- Any unit that is not ours is bad
        end
    end
  
    local iOwner = pPlot:GetOwner()															-- No Foriegn/Enemy units, so check ownership of the tile
    if (iPlayer ~= iOwner) and (iOwner >= 0) then												-- If plot owner is not active player, but plot is owned, then...
        if Teams[Players[iOwner]:GetTeam()]:IsAllowsOpenBordersToTeam( Players[iPlayer]:GetTeam() ) then
            return true																			-- Return TRUE early
        end
    end

  if (iOwner == iPlayer or iOwner == -1 or Players[iPlayer]:GetTeam() == Players[iOwner]:GetTeam() 
		or Players[iOwner]:IsPlayerHasOpenBorders(iPlayer) or Players[iOwner]:IsPlayerHasOpenBordersAutomatically(iPlayer)) then	-- If active player owns tile, tile is unowned, or owned by team member, then...
    return true
  end
    
  local pOwner = Players[iOwner]
  if (pOwner:IsMinorCiv() and pOwner:GetAlly() == iPlayer) then
    -- No suicide units (missiles, nukes etc) in city states
    return (not pUnit.Suicide and pUnit.NukeDamageLevel == -1)
  end
  return false
end

function CountAircraft(pPlot, pUnit)
  local iAircraft = 0
  local iPlayer = pUnit:GetOwner()
  
  for i = 0, pPlot:GetNumUnits()-1, 1 do
    local pPlotUnit = pPlot:GetUnit(i)
	
	if (pPlotUnit:GetOwner() == iPlayer and pPlotUnit:GetDomainType() == DomainTypes.DOMAIN_AIR) then
	  iAircraft = iAircraft + 1
	end
  end
  
  return iAircraft
end
