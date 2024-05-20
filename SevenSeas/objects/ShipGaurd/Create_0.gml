/// @description Vars

image_index = 3

maxHealth = 50
myHealth = maxHealth

event_user(0)


ds_list_add(myStats, 1)
ds_list_add(myActions, GetSpecialAttack())

repeat(choose(1, 2))
    ds_list_add(myStats, 0)
    

