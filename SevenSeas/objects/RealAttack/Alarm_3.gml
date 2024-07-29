/// @description Switch turns
with myButton
	AttackEvents()

if ds_list_size(global.notificationList) == 0{
	
	if (actionType == "cannon" and shipTarget == CombatRunner)
		LoseCargo(2, 1);

	if endRound
	    with RealAttack
	        instance_destroy()
			
	instance_destroy()
	
	with CombatRunner
	    event_user(3)
}
else{
	alarm[3] = room_speed/2
}

