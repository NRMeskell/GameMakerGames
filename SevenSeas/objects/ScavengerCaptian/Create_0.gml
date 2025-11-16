/// @description Vars

image_index = 18

maxHealth = 50
myHealth = maxHealth

event_user(0)

ds_list_add(myStats, 5, 1, 1)

ds_list_add(myActions, choose(DisengageAction, OutmaneuverAction))
if ds_list_find_index(myStats, 2) != -1{
	ds_list_add(myActions, choose(BroadsideAction, ShrapnelAction, ConcentratedFireAction))
}
