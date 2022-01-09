DELETE FROM UnitCombatInfosEx WHERE CombatClass NOT IN (SELECT Type FROM UnitCombatInfos);

-- Fix the crap that the Firaxis programmers leave us by not knowing how to use their own software!
UPDATE UnitPromotions SET PromotionPrereqOr1=PromotionPrereq, PromotionPrereq=NULL WHERE PromotionPrereq IS NOT NULL AND PromotionPrereqOr1 IS NULL;
