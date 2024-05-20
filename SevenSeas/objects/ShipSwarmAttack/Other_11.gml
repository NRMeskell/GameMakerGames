/// @description Do Attack

repeat(damage)
    {
    i = irandom(instance_number(crewTarget)-1)
    nextTargetPirate = instance_find(crewTarget, i)
    while !AreAdjacent(targetPirate, nextTargetPirate)
        {
        i = irandom(instance_number(crewTarget)-1)
        nextTargetPirate = instance_find(crewTarget, i)
        }

    nextTargetPirate.myHealth -= UpdateCrewDamage(1, nextTargetPirate)
    }
	
ApplyCrewEffect("stun", targetPirate)
    

