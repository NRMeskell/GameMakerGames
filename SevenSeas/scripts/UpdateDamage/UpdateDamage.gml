function UpdateDamage(argument0, argument1) {
	//Update damage to target

	var newDamage = argument0

	for(i=0; i<instance_number(EffectParent); i++)
	    {
	    with instance_find(EffectParent, i)
	        {
	        if team == "pirate"
	            {
	            if effect == "damageMultiplier" and (attackType == argument1 or attackType == "all")
	                newDamage = newDamage*multiplier
	            }
	        }
	    }
    
	if (object_is_ancestor(id.object_index, RealAttack))
	    return (newDamage*(1+criticalHit*(1+0.1*global.totalRiggingBonus)) div 1)
	else
	    return (newDamage div 1)




}
