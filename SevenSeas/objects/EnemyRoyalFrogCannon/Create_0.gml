/// @description Vars

image_index = 10

maxHealth = 60
myHealth = maxHealth

event_user(0)

repeat(3)
    ds_list_add(myStats, 2)
ds_list_add(myStats, 1)
    
ds_list_add(myActions, GetSpecialAttack())
    

