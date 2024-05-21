function JohnnyCall() {
	if irandom(2) > 0
	    {
	    ds_list_add(global.notificationList, "Johnny returns!", "he's dissapointed to not go shopping, but returns to the ship.")
	    with Pirate
	        {
	        UpdateMorale(-1, global.FEARSOME)
	        UpdateMorale(1, global.JOLLY)
	        }
	    }
	else
	    {
	    ds_list_add(global.notificationList, "Johhny leaves!", "He does not listen, and dissapears into the crowd")
	    with Pirate
	        {
	        UpdateMorale(1, global.FEARSOME)
	        UpdateMorale(-1, global.JOLLY)
	        }
        
	    JohnnyShortsticks.myState = "at port"
	    }  

	script_execute(closeEventCode)






}
