function JohnnyWait() {
	if irandom(1) > 0 and searchReputationType("repute")[0] > -1
	    {
	    ds_list_add(global.notificationList, "Johnny returns!", "he proudly brings back some stuff he 'found' in the market!")
	    with Pirate
	        {
	        UpdateMorale(1, global.JOLLY)
	        }
        
	    GetRandomLoot(irandom_range(1,2), "stuff", undefined)
	    }
	else
	    {
	    ds_list_add(global.notificationList, "Johhny does not return!", "The crew wait impatiently for the rest of the day, but Johhny is not seen.")
	    with Pirate
	        {
	        UpdateMorale(-1, global.DARING)
	        UpdateMorale(-3, global.JOLLY)
	        }
        
	    with JohnnyShortsticks
	        {
	        if irandom(1)
	            instance_destroy()
	        else
	            myState = "in port"
	        }
	    }     

	script_execute(closeEventCode)






}
