/// @description Do attack

repeat(damage*priority)
    {
    i = irandom(instance_number(crewTarget)-1)
    targetPirate = instance_find(crewTarget, i)
    targetPirate.myHealth -= UpdateCrewDamage(1, targetPirate)
    }


//Add damage multiplier
with instance_create(50,50,EffectParent)
    {
    if other.myShipTarget == Ship
        team = "pirate"
    else
        team = "enemy"

    effect = "damageMultiplier"
    multiplier = 1.5
    duration = 1
    }

