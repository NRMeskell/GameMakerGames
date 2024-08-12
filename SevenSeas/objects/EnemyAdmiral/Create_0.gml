/// @description Vars

image_index = 6

maxHealth = 50+20*global.seaLevel
myHealth = maxHealth
event_user(0)

repeat(choose(2, 3))
    ds_list_add(myStats, choose(0,1))
    
ds_list_add(myStats, 5)

repeat(sign(irandom(global.seaLevel)))
    {
    ds_list_add(myActions, GetSpecialAttack())
    }

