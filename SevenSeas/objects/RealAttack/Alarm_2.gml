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
    animationLength = (room_speed*sqrt(attackNumber*1/3)/global.combatRate)
    
	damageRange = GetDamageRange(object_index)
	damage = irandom_range(damageRange[0], damageRange[1])
	}
else
    {
    damage = 0
    attackPower = 0
    madeAttacks = 0
    animationLength = ((room_speed/2)/global.combatRate)
    }