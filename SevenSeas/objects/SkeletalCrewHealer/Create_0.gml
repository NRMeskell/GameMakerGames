/// @description Vars

myType = choose(0,1)
image_index = 20

maxHealth = 25
myHealth = maxHealth

event_user(0)
ds_list_add(myStats, choose(0,1,2))
    
ds_list_add(myActions, choose(HealDeadAction,RaiseDeadAction))

