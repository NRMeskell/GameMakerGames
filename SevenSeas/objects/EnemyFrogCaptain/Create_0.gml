/// @description Vars

image_index = 7

maxHealth = 50
myHealth = maxHealth

event_user(0)

ds_list_add(myStats, 5, 5)

repeat(1)
    ds_list_add(myStats, choose(0,1))
    
if irandom(1)
    ds_list_add(myActions, choose(EngageAction, OutmaneuverAction))
   
    

