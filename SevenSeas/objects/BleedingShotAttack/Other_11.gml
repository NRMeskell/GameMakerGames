/// @description Animate

repeat(damage)
    {
    i = irandom(instance_number(crewTarget)-1)
    newTargetPirate = instance_find(crewTarget, i)
    newTargetPirate.myHealth -= UpdateCrewDamage(1, newTargetPirate)
    }     
    
if !instance_exists(targetPirate){
    with instance_create(0, 0, object_index){
        priority = other.priority
        crewTarget = other.crewTarget
        shipTarget = other.shipTarget
        myCrewTarget = other.myCrewTarget
        myShipTarget = other.myShipTarget
        targetPirate = instance_find(crewTarget, irandom(instance_number(crewTarget)-1))
        myPirate = other.myPirate
        
        attackPower = other.attackPower  
        event_user(3)
    }
}
else{
	ApplyCrewEffect("stun", targetPirate)
}
    

