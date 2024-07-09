/// @description Switch turns
with myButton
	AttackEvents()
	
if myShipTarget == CombatRunner
	with Pirate
		stunned = false
else
	with Enemy
		stunned = false

if ds_list_size(global.notificationList) == 0{
	instance_destroy()
	
	if (actionType == "cannon" and shipTarget == CombatRunner)
		LoseCargo(2, 1);

	if endRound
	    with RealAttack
	        instance_destroy()

	with CombatRunner
	    event_user(3)
}
else{
	alarm[3] = room_speed/2
}

