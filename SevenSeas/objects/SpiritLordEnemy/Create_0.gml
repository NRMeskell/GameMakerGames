/// @description Vars

image_index = 22

maxHealth = 150
myHealth = maxHealth

event_user(0)

ds_list_add(myStats, 5)
repeat(2){
	ds_list_add(myStats, 0)
}

GetSpecialAttack() 
ds_list_add(myActions, KnockOfDeathAction)

