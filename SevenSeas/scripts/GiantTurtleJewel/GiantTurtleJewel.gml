function GiantTurtleJewel() {
	ds_list_add(global.notificationList, "Jewel Given!", "The turtle bows it's head and returns to the ocean.")

	AddReputation("nature", 2, "turtle gifting")
	with GiantTurtle{
		myVar += 2
	    event_user(1)
	}

	with EventDrawer
	    floatAway = true
    
	script_execute(closeEventCode)



}
