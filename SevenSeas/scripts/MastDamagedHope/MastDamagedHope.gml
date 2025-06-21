function MastDamagedHope() {
	//lose cargo

	result = irandom(10)
        
	if result < 4
	    {
	    ds_list_add(global.notificationList, "The mast survives!", "the mast strains, but seems to survive the gust.") 
	    }
	else if result < 8
	    {
	    ds_list_add(global.notificationList, "Sails torn loose!", "sails tear away from the mast, damaging the ship!") 
	    UpdateHealth(Ship, -30*(global.seaLevel+1))
	    }
	else
	    {
	    ds_list_add(global.notificationList, "mast cracks!", "the mast cracks and sails tear, severely damaging the ship!") 
	    UpdateHealth(Ship, -50*(global.seaLevel+1))
	    }

	script_execute(closeEventCode, 2)






}
