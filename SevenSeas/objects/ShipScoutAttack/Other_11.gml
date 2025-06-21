/// @description Do Attack

         
SpreadDamage(crewTarget, damage)
    
//Add damage multiplier
with instance_create(50,50,EffectParent)
    {
    if other.myShipTarget == Ship
        team = "pirate"
    else
        team = "enemy"
        
    effect = "damageMultiplier"
    multiplier = 1.75
    duration = 1 
    }


