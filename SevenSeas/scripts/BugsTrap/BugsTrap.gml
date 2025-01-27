function BugsTrap() {

	if argument0{
		with Pirate
		    UpdateMorale(irandom(1), -1)

		ds_list_add(global.notificationList, "bugs trapped!", "the traps work well, and the mosquitoes all all killed.")
		script_execute(closeEventCode, 2)
	}
	else{
		with Pirate{
			UpdateMorale(-1, -1)
			myHealth -= 10
		}
	ds_list_add(global.notificationList, "bugs attracted", "the traps attract the bugs, making them more aggressive. They continue to bite the crew!")
	
	if irandom(1)
		with instance_create(0,0,ConditionTimer)
	        condition = MalariaCrewmate
	}
	
	audio_stop_sound(BugsBuzzingSnd)
	script_execute(closeEventCode)
}
