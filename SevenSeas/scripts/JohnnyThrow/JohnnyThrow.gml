function JohnnyThrow() {
	ds_list_add(global.notificationList, "Johnny overboard!", "Johnny shortsticks is thrown overboard, and the crew have mixed reactions!")

	with Pirate
	    {
	    UpdateMorale(2, global.FEARSOME)
	    UpdateMorale(-2, global.JOLLY)
	    }
    
	with JohnnyShortsticks
	    {
	    if irandom(4) > 0
	        {
	        instance_destroy()
	        }
	    else
	        myState = "revenge"
	    }

	script_execute(closeEventCode)






}
