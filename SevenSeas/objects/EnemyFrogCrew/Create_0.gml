/// @description Vars

image_index = 10

maxHealth = 40
myHealth = maxHealth

event_user(0)

repeat(choose(1,2))
    ds_list_add(myStats, choose(0,0,1))
    
if irandom(1)
    ds_list_add(myActions, choose(SwarmAction, HeavyBoardingAction))
    

