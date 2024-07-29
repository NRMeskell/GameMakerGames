/// @description Control Animation Length & set damage

waiting = false
alarm[1] = 1
event_user(3)
if ds_map_find_value(DamageController.damageScaler, object_index) != undefined
    {
    if !singleAttack
        attackNumber = attackPower*(1+criticalHit)
    else
        attackNumber = 1*(1+criticalHit)
    
    madeAttacks = attackPower
    animationLength = room_speed*sqrt(attackNumber*1/3)
    
    if shipTarget == CombatRunner{
        damage = UpdateDamage(irandom_range(attackPower*DamageController.damageScaler[? object_index]*DamageController.damageMin[? object_index], attackPower*DamageController.damageScaler[? object_index]*DamageController.damageMax[? object_index]), myButton.myType)
	}
	else
        damage = UpdateEnemyDamage(irandom_range(attackPower*DamageController.damageScaler[? object_index]*DamageController.damageMin[? object_index], attackPower*DamageController.damageScaler[? object_index]*DamageController.damageMax[? object_index]), myButton.myType)
	}
else
    {
    damage = 0
    attackPower = 0
    madeAttacks = 0
    animationLength = room_speed/2
    }