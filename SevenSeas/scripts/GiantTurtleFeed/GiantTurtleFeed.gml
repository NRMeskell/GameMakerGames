function GiantTurtleFeed() {
	ds_list_add(global.notificationList, "Turtle Fed!", "The turtle bows it's head and returns to the ocean.")

	AddReputation("nature", 1, "turtle feeding")
	with GiantTurtle{
		myVar += 1
	    event_user(1)
	}

	with EventDrawer
	    floatAway = true
    
	script_execute(closeEventCode)




}
