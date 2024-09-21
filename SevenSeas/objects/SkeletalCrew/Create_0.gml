/// @description Vars

myType = choose(0,1)
image_index = 19

maxHealth = 30
myHealth = maxHealth

event_user(0)
repeat(2){
	if myType == 0
		ds_list_add(myStats, choose(0,0,0,1))
	else
		ds_list_add(myStats, choose(1,2,2,2))
}
    
ds_list_add(myActions, GetSpecialAttack())

