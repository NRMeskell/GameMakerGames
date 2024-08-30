/// @description heal

with ActionParent 
    {
    if other.myShipTarget == Ship and enemyAction == false{
        if waitLeft > 1 waitLeft -= 1
	}
		
	if other.myShipTarget == CombatRunner and enemyAction == true
        if waitLeft > 1 waitLeft -= 1
	}

with instance_create(50, 50, EffectParent)
    {
    if other.myShipTarget = Ship
        team = "pirate"
    else
        team = "enemy"
        
    effect = "damageMultiplier"
    multiplier = 1.5
    duration = 1
    }
