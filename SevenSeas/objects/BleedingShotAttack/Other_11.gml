/// @description Animate

ApplyCrewEffect("stun", targetPirate)
targetPirate.myHealth -= UpdateCrewDamage(1, targetPirate)
    
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

