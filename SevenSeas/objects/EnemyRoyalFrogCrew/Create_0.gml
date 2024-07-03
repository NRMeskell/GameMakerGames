/// @description Vars

image_index = 10

maxHealth = 60
myHealth = maxHealth

event_user(0)

ds_list_add(myStats, 0, 0)
ds_list_add(myStats, choose(1, 5))
    
ds_list_add(myActions, GetSpecialAttack())
    

