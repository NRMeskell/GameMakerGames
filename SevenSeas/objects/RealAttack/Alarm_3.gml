/// @description Switch turns
with myButton
	AttackEvents()

if ds_list_size(global.notificationList) == 0{
	
	activated = true
	var loseCBall = false;
	if (actionType == "cannon" and shipTarget == CombatRunner)
		loseCBall = true;

	 /* MONKEY */
	 if myPirate != noone and myPirate.object_index == Pirate and myPirate.myPet.itemInfo == "a cute climbing companion, happy to hop in a cannon or two"
		loseCBall = false;
		
	if loseCBall
		LoseCargo(2, 1);

	if endRound
	    instance_destroy(RealAttack)
			
	instance_destroy()
	
	with CombatRunner
	    event_user(3)
}
else{
	alarm[3] = room_speed/(2*global.combatRate)
}

