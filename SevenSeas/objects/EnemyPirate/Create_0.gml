/// @description Vars

image_index = 0

maxHealth = 30
myHealth = maxHealth

event_user(0)

repeat(1 + global.seaLevel div 2){
	if CombatRunner.shipFocus=="cannon"
		ds_list_add(myStats, choose(0,1,2,2,2))
	else if CombatRunner.shipFocus=="melle"
		ds_list_add(myStats, choose(0,0,0,1,2))
	else
		ds_list_add(myStats, choose(0,1,2))
}
    
repeat(sign(irandom(global.seaLevel + 1)))
    {
    ds_list_add(myActions, GetSpecialAttack())
    }
    

