function script109() {
	// safely play

	ds_list_add(global.notificationList, "fight stopped", "the fight is broken up, and all parties leave satisfied!")
	with Pirate
	    UpdateMorale(1, 0)

	script_execute(closeEventCode)



}
