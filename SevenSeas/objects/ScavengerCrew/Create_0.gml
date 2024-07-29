/// @description Vars

image_index = 16

maxHealth = 50
myHealth = maxHealth

event_user(0)

ds_list_add(myStats, 2)
ds_list_add(myActions, GetSpecialAttack())

repeat(2)	
	ds_list_add(myStats, choose(0,1,2,2))
    

