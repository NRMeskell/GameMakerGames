/// @description Vars

image_index = 1

maxHealth = 50+15*global.seaLevel
myHealth = maxHealth
event_user(0)

repeat(1+irandom(global.seaLevel+1))
    ds_list_add(myStats, choose(CombatRunner.shipFocus=="cannon",1))
    
ds_list_add(myStats, 5)

repeat(sign(irandom(global.seaLevel + 1))+1)
    {
    ds_list_add(myActions, GetSpecialAttack())
    }

