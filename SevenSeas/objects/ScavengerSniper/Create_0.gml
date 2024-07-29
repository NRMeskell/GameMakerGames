/// @description Vars

image_index = 17

maxHealth = 40
myHealth = maxHealth

event_user(0)

ds_list_add(myStats, 1)
ds_list_add(myActions, choose(SniperAction, TargetedFireAction, LookoutAction))

repeat(2)	
	ds_list_add(myStats, choose(0,1,2,2))
    

