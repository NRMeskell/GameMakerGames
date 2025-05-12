/// @description Animate

var enemyKilled = false
repeat(damage){
    i = irandom(instance_number(crewTarget)-1)
    nextTargetPirate = instance_find(crewTarget, i)
    nextTargetPirate.myHealth -= 1
	if nextTargetPirate.myHealth <= 0
		enemyKilled = true
}
	
if !enemyKilled{
	repeat(damage div 2){
	    i = irandom(instance_number(myCrewTarget)-1)
	    nextTargetPirate = instance_find(myCrewTarget, i)
	    nextTargetPirate.myHealth -= 1
	}
}

