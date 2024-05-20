/// @description Switch turns
with myButton
	AttackEvents()

if ds_list_size(global.notificationList) == 0{
	instance_destroy()

	if endRound
	    with RealAttack
	        instance_destroy()

	with CombatRunner
	    event_user(3)
}
else{
	alarm[3] = room_speed/2
}

