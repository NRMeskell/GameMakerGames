/// @description Animate

with crewTarget
    {   
    if AreAdjacent(nextTargetPirate, targetPirate)
        {
        ApplyCrewEffect(choose("stun", "expose", "bleed"), id)
        }
    }
    
UpdateHealth(shipTarget, -damage)
    

