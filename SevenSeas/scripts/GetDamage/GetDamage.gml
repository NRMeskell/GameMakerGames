function GetDamage(argument0) {
	if enemyAction == false
	    {
	    if myType = "melee"
	        multiplier = global.totalSwordBonus
	    if myType = "ranged"
	        multiplier = global.totalGunBonus
	    if myType = "cannon"
	        multiplier = global.totalCannonBonus
	    if myType = "ship"
	        multiplier = global.totalWheelBonus
			
		if (object_index = FinishingStabAction or object_index = ShipFinishingAttack)		
			multiplier = 1
		
	    minDamage = UpdateDamage(floor(multiplier * DamageController.damageScaler[? argument0]*DamageController.damageMin[? argument0]), myType)
	    maxDamage = UpdateDamage(ceil(multiplier * DamageController.damageScaler[? argument0]*DamageController.damageMax[? argument0]), myType)
	    }
	else
	    {
	    if myType = "melee"
	        multiplier = CombatRunner.myStats[0]
	    if myType = "ranged"
	        multiplier = CombatRunner.myStats[1]
	    if myType = "cannon"
	        multiplier = CombatRunner.myStats[2]
	    if myType = "ship"
	        multiplier = CombatRunner.myStats[3]
        
	    minDamage = UpdateEnemyDamage(floor(multiplier * DamageController.damageScaler[? argument0]*DamageController.damageMin[? argument0]), myType)
	    maxDamage = UpdateEnemyDamage(ceil(multiplier * DamageController.damageScaler[? argument0]*DamageController.damageMax[? argument0]), myType)
	    }
    

	return string(minDamage) + "-" + string(maxDamage)




}
