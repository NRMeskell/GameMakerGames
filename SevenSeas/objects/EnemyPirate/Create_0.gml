/// @description Vars

image_index = 0

maxHealth = 30
myHealth = maxHealth

event_user(0)

repeat(choose(1))
    ds_list_add(myStats, choose(0,1,2))
    
repeat(sign(irandom(global.seaLevel + 1)))
    {
    ds_list_add(myActions, GetSpecialAttack())
    }
    

