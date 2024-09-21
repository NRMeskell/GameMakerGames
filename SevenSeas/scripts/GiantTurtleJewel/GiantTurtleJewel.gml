function GiantTurtleJewel() {
	ds_list_add(global.notificationList, "Jewel Given!", "The turtle bows its head and returns to the ocean.")

	with GiantTurtle{
		myVar += 3
	    event_user(1)
	}

	with EventDrawer
	    floatAway = true
    
	script_execute(closeEventCode)



}
