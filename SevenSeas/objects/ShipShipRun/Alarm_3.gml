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
    
	global.moraleBoost = "run away"
    with Pirate
        {
        UpdateMorale(-3, -1)
        UpdateMorale(-1, global.FEARSOME)
        stunned = false
        exposed = false
        bleeding = false
        }     
        
    ds_list_add(global.notificationList, "Ran Away!", "The crew lose significant morale.")
    alarm[4] = -1
	
	with RealAttack
		instance_destroy()
	with AttackAnimation
		instance_destroy()
	
}

