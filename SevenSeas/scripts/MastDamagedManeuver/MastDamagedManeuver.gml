function MastDamagedManeuver() {
	//save all cargo

	if argument0
	    {
	    ds_list_add(global.notificationList, "wind gusts avoided!", "the ship was maneuvered to a safer position.") 
	    }
	else
	    {
	    ds_list_add(global.notificationList, "wind not avoided!", "sails tear away from the mast, damaging the ship!") 
	    Ship.myHealth -= 75*(global.seaLevel+1)
	    }
    
	script_execute(closeEventCode, 2)



}