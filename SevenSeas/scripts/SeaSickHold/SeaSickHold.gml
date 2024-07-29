function SeaSickHold() {
	//swim back
    
	with sickPirate
		UpdateMorale(-3, -1)
	ds_list_add(global.notificationList, sickPirate.firstName + " is very ill!",  "the nausea is horrible, and they lose significant morale")
	script_execute(closeEventCode, 2)
}
