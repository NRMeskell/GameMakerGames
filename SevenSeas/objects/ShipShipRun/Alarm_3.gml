/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if runSuccess
    {
    instance_destroy(ActionParent)
    instance_destroy(PlayerActionRunner)
    instance_destroy(Enemy)
    instance_destroy(EffectParent)
    instance_destroy(CombatRunner) 
	
	var totalCargo = 0
	for(var j=0; j<array_length(ItemRunner.cargoCost); j++)
		totalCargo += CargoAmount(j)
	var lostCargo = LoseRandomCargo(totalCargo div 2)
    
	global.moraleBoost = "Surrender"
	with Pirate
        {
        UpdateMorale(-3, -1)
        UpdateMorale(-1, global.FEARSOME)
        stunned = false
        exposed = false
        bleeding = false
        }     
        
    ds_list_add(global.notificationList, "Surrendered!", "The crew unload " + lostCargo + ", and lose significant morale.")
    alarm[4] = -1
	
	with RealAttack
		instance_destroy()
	with AttackAnimation
		instance_destroy()
	
}

