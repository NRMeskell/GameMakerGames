/// @description Vars

image_index = 11

maxHealth = 75
myHealth = maxHealth
event_user(0)

repeat(2)
    ds_list_add(myStats, choose(0,1,2))
    
ds_list_add(myStats, 5, 2)

ds_list_add(myActions, WarningShotAction)

