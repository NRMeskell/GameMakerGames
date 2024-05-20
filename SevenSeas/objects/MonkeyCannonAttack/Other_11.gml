/// @description Animate

with crewTarget
    {   
    if AreAdjacent(nextTargetPirate, targetPirate)
        {
        ApplyCrewEffect(choose("stun", "expose", "bleed"), id)
        }
    }
    
shipTarget.myHealth -= damage
    

