/// @description Vars

var mySkel = choose(0,1)
image_index = 19

maxHealth = 50
myHealth = maxHealth

event_user(0)
repeat(3){
	if mySkel == 0
		ds_list_add(myStats, choose(0,0,0,1))
	else
		ds_list_add(myStats, choose(1,2,2,2))
}
    
ds_list_add(myActions, GetSpecialAttack())

