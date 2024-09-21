function BirdsScareAway() {
	//Stop Birds

	with Pirate
	    {
	    UpdateMorale(-1, -1)
	    UpdateMorale(1, global.DARING)
	    }
        
	ds_list_add(global.notificationList, "The birds were scared away!", "The crew grumpily chase the birds off the ship.")

	EventDrawer.floatAway = true
	script_execute(closeEventCode)
}
