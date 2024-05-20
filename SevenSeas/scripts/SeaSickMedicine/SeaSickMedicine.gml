function SeaSickMedicine() {
	//guide back

	if !argument0
	    {
	    with Pirate
	        if irandom(1)
	            myHealth -= 10 + 5*global.seaLevel
    
	    ds_list_add(global.notificationList, "The medicine is bad!",  "the pirates become more ill and lose health!")
	    }
	else
	    {
	    ds_list_add(global.notificationList, "The medicine works!", "The sick crew members feel much better!")
	    }

	script_execute(closeEventCode, 2)



}
