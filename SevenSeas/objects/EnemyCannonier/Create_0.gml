/// @description Vars

image_index = 5

maxHealth = 30+10*global.seaLevel
myHealth = maxHealth
event_user(0)

repeat(choose(2, 3))
    ds_list_add(myStats, choose(0,2))
    
ds_list_add(myStats, 2)
ds_list_add(myActions, GetSpecialAttack())

