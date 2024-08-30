/// @description Do Attack

i = irandom(instance_number(crewTarget)-1)
nextTargetPirate = instance_find(crewTarget, i)
repeat(damage)
    {
    nextTargetPirate.myHealth -= UpdateCrewDamage(1, nextTargetPirate)
    }
    

