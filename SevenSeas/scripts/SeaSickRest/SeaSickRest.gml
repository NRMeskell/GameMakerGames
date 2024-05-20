function SeaSickRest() {
	//guide back

	if irandom(1)
	    {
	    with Ship
	        myHealth -= 50
	    ds_list_add(global.notificationList, "The ship breaks apart!",  "without the crew, the ship was damaged by the wind")
	    }
	else
	    {
	    ds_list_add(global.notificationList, "The crew rests well", "The sick crew members feel much better!")
	    }
    

	script_execute(closeEventCode, 2)





}
