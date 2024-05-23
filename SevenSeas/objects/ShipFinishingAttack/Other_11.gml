/// @description Animate

if myShipTarget = Ship
    damage = UpdateDamage(irandom_range(CombatRunner.enemyTurnDamage*attackPower*DamageController.damageScaler[? object_index]*DamageController.damageMin[? object_index], CombatRunner.enemyTurnDamage*attackPower*DamageController.damageScaler[? object_index]*DamageController.damageMax[? object_index]), myButton.myType)
else
    damage = UpdateEnemyDamage(irandom_range(CombatRunner.playerTurnDamage*attackPower*DamageController.damageScaler[? object_index]*DamageController.damageMin[? object_index], CombatRunner.playerTurnDamage*attackPower*DamageController.damageScaler[? object_index]*DamageController.damageMax[? object_index]), myButton.myType)
		

repeat(damage)
    {
    i = irandom(instance_number(crewTarget)-1)
    nextTargetPirate = instance_find(crewTarget, i)
    nextTargetPirate.myHealth -= 1
	}

