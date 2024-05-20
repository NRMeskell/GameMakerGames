/// @description Animate
  
damage = damage*instance_number(crewTarget)  
  
repeat(damage)
    {
    i = irandom(instance_number(crewTarget)-1)
    targetPirate = instance_find(crewTarget, i)
    targetPirate.myHealth -= UpdateCrewDamage(1, targetPirate)
    }
    
shipTarget.myHealth -= damage

