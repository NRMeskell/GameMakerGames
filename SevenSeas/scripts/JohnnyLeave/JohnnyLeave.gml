function JohnnyLeave() {
	ds_list_add(global.notificationList, "Change docking!", "Your crew docks in a different part of town, and Johnny does not return.")
	with Pirate
	    {
	    UpdateMorale(2, global.FEARSOME)
	    UpdateMorale(-1, global.JOLLY)
	    }
    
	with JohnnyShortsticks
	    {
	    if irandom(1) == 0
	        {
	        if irandom(2) != 0
	            JohnnyShortsticks.myState = "in port"
	        else
	            JohnnyShortsticks.myState = "revenge"
	        }
	    else
	        instance_destroy()
	    }

	script_execute(closeEventCode)



}
