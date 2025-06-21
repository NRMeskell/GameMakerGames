function StrangeTrap() {
	//intimidate

	if argument0{
		ds_list_add(global.notificationList, "The traps are set!", "who knows what creatures they will catch.") 
		with instance_create(0,0,ConditionTimer)
		    condition = SetTrap    

		script_execute(closeEventCode, 2)
	}
	else{
		member = RandomPirate()
		ds_list_add(global.notificationList, "pirate caught!", member.firstName + " was snapped by a trap, and they lost health and morale!")
		with member{
			UpdateMorale(-1, -1)
			UpdateHealth(Ship, -20)
		}
	}
	audio_stop_sound(ScratchingSnd)
}
