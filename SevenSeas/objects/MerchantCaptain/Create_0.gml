/// @description Vars

image_index = 2

maxHealth = 50
myHealth = maxHealth
event_user(0)

ds_list_add(myStats, 5)
repeat(choose(1, 2))
    ds_list_add(myStats, choose(1,5))
    
repeat(sign(irandom(global.seaLevel)))
    {
    ds_list_add(myActions, choose(OutmaneuverAction, CauseChaosAction))
    }

