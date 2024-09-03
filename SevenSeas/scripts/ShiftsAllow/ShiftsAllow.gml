function ShiftsAllow() {
	//Pay up

	with Pirate
	    {
	    UpdateMorale(1, global.KEEN)
	    UpdateMorale(-1, global.FEARSOME)
		UpdateMorale(-1, global.DARING)
		UpdateMorale(choose(-1, 0), global.JOLLY)
	    }
    
	ds_list_add(global.notificationList, "Shifts changed!", "the crew adjusts to the new pattern of life")



}
