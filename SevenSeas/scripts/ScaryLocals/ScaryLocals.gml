function ScaryLocals() {
	global.moraleBoost = "port"

	with Pirate
	    {
	    UpdateMorale(-1, -1)
	    UpdateMorale(1, global.FEARSOME)
		UpdateMorale(2, global.KEEN)
	    }

	ds_list_add(global.notificationList, "Strange Port!", "The unsettling dock and skeletal locals cause shivers among the crew.")
}
