/// @description Do Damage

done = true

if runSuccess
    {
    instance_destroy(ActionParent)
    instance_destroy(PlayerActionRunner)
    instance_destroy(Enemy)
    instance_destroy(EffectParent)
    instance_destroy(CombatRunner) 
    
    with Pirate
        {
        UpdateMorale(-4, -1)
        UpdateMorale(-1, global.FEARSOME)
        stunned = false
        exposed = false
        bleeding = false
        }     
        
    ds_list_add(global.notificationList, "Ran Away!", "The crew lost significant morale, and your reputation is damaged!")
    with RealAttack
		instance_destroy()
    }

