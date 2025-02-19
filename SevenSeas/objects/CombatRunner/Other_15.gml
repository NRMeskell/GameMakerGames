/// @description Destroyed

instance_destroy(ActionParent)
instance_destroy(PlayerActionRunner)
instance_destroy(Enemy)
instance_destroy(EffectParent)

GetRandomLoot((lootMod*(2 + enemyLevel + irandom(1))) div 1, "LOOT", undefined)
    
with Pirate
    {
    UpdateMorale((other.enemyLevel + irandom(1)), -1)
    //event_user(5)
	stunned = false
    exposed = false
    bleeding = false
	global.moraleBoost = "surrender"
	UpdateMorale(other.lootMod != 1, -1)
    }
    
GameStatsController.enemiesDefeated += 1
event_user(12)

instance_destroy()

