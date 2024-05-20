function ShiftsAllow() {
	//Pay up

	with Pirate
	    {
	    UpdateMorale(-1, global.KEEN)
	    UpdateMorale(-2, global.FEARSOME)
	    }
    
	ds_list_add(global.notificationList, "Shifts changed!", "new shifts have been implimented, and the crew adjusts to the new pattern of life")



}
