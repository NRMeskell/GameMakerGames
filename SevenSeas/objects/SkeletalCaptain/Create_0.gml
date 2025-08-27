/// @description Vars

image_index = 21

maxHealth = 120
myHealth = maxHealth

event_user(0)

ds_list_add(myStats, 5)
repeat(2){
	ds_list_add(myStats, choose(0,1))
}

GetSpecialAttack()
ds_list_add(myActions, RaiseDeadAction)

