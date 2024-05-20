/// @description Animate

repeat(round(damage * 0.2))
    {
    i = irandom(instance_number(crewTarget)-1)
    targetPirate = instance_find(crewTarget, i)
    targetPirate.myHealth -= UpdateCrewDamage(1, targetPirate)
    }
    
shipTarget.myHealth -= damage
    

