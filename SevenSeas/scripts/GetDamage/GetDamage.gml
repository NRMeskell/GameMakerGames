function GetDamageString(attackType){
	var damageRange = GetDamageRange(attackType)
	return string(damageRange[0]) + "-" + string(damageRange[1])
}

function GetAttackPower(type, pirate){
	if pirate
	    {
	    if type = "melee"
	        return global.totalSwordBonus
	    if type = "ranged"
	        return global.totalGunBonus
	    if type = "cannon"
	        return global.totalCannonBonus
	    if type = "ship"
	        return global.totalWheelBonus
		}
	else{
		if type = "melee"
	        return CombatRunner.myStats[0]
	    if type = "ranged"
	        return CombatRunner.myStats[1]
	    if type = "cannon"
	        return CombatRunner.myStats[2]
	    if type = "ship"
	        return CombatRunner.myStats[3]
	}
}

function GetDamageRange(attackType) {
	// find attack type
	var isPirate;
	if object_is_ancestor(object_index, ActionParent){
		isPirate = !enemyAction
	}
	else if object_is_ancestor(object_index, RealAttack){
		isPirate = (shipTarget == CombatRunner)
	}
	
	// get base damage multiplier
	var multiplier = GetAttackPower(actionType, isPirate)
	multiplier = power(multiplier, 0.8)
		
	
	var minDamage = UpdateDamage(floor(multiplier * DamageController.damageScaler[? attackType]*DamageController.damageMin[? attackType]), isPirate)
	var maxDamage = UpdateDamage(ceil(multiplier * DamageController.damageScaler[? attackType]*DamageController.damageMax[? attackType]), isPirate)
	
	return [minDamage, maxDamage]
}

function UpdateDamage(oldDamage, pirateAttack) {
	//Update damage to target

	var newDamage = oldDamage

	for(i=0; i<instance_number(EffectParent); i++)
	    {
	    with instance_find(EffectParent, i)
	        {
	        if team == "pirate" and pirateAttack{
	            if effect == "damageMultiplier"
	                newDamage = newDamage*multiplier
	        }
			else if team = "enemy" and pirateAttack{
				if effect == "damageMultiplier"
	                newDamage = newDamage*multiplier
			}	
	    }
	}
    
	return (newDamage div 1)
}

function SpreadDamage(targets, damage){
	var damEach = damage div instance_number(targets)
	var damOver = damage mod instance_number(targets)
	
	with targets
		UpdateHealth(id, -AddCrewEffects(id, damEach))
	
	for(var num=0; num<damOver; num++)
		with instance_find(targets, irandom(instance_number(targets)-1))
			UpdateHealth(id, -AddCrewEffects(id, 1))
}

function AddCrewEffects(target, damage) {
	//Update damage to target
	if target.object_index == Pirate{
		if target.myPet.itemPower == "defense"
			damage *= 0.75
	}
	
	return (damage div 1)
}
