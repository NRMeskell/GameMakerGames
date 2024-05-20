function GetModifiedDamage(argument0, argument1) {
	if myType = "melle"
	    multiplier = global.totalSwordBonus
	if myType = "ranged"
	    multiplier = global.totalGunBonus
	if myType = "cannon"
	    multiplier = global.totalCannonBonus
	if myType = "ship"
	    multiplier = global.totalWheelBonus

	minDamage = string(floor(argument1 * multiplier * DamageController.damageScaler[? argument0]*DamageController.damageMin[? argument0]))
	maxDamage = string(ceil(argument1 * multiplier * DamageController.damageScaler[? argument0]*DamageController.damageMax[? argument0]))

	return minDamage + "-" + maxDamage



}
