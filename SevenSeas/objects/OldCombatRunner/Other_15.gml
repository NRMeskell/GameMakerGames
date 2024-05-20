/// @description Destroyed

instance_destroy(ActionParent)
instance_destroy(PlayerActionRunner)
instance_destroy(Enemy)
instance_destroy(EffectParent)

GetRandomLoot((lootMod*(2 + enemyLevel + irandom(1))) div 1, "LOOT", undefined)
    
with Pirate
    {
    UpdateMorale(other.enemyLevel + 1, -1)
    UpdateMorale(1, global.FEARSOME)
    stunned = false
    exposed = false
    bleeding = false
    }
    
GameStatsController.enemiesDefeated += 1
    
event_user(12)

instance_destroy()

