/// @description Vars

image_index = 23

maxHealth = 50
myHealth = maxHealth

event_user(0)

ds_list_add(myStats, 5, 1, 1)

ds_list_add(myActions, choose(DisengageAction, OutmaneuverAction, SurpriseAction))
