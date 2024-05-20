/// @description Vars

image_index = 8

maxHealth = 30
myHealth = maxHealth

event_user(0)

repeat(2)
    ds_list_add(myStats, 2)
    
if irandom(2) == 0
    ds_list_add(myActions, choose(CannonSprayAction, BroadsideAction))
    

