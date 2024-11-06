/// @description Vars

image_index = 9

maxHealth = 30
myHealth = maxHealth

event_user(0)

repeat(choose(1,2))
    ds_list_add(myStats, choose(0,1,1))
    
if irandom(2) == 0
    ds_list_add(myActions, choose(BarrageAction, LookoutAction))
    

