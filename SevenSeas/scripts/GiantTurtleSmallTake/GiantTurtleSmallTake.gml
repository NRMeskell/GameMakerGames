function GiantTurtleSmallTake() {
	if argument0{
		with EventDrawer
		    floatAway = true
    
		GetRandomLoot(1, "TURTLE GIFT", undefined)
		with Store
		    CustomSeaLoot()
	}
	else{
		ds_list_add(global.notificationList, "Item fell!", "The item was knocked off the turtle, and it dives slowly down after it")
	}


	with GiantTurtle
	    event_user(1)
    
	script_execute(closeEventCode)




}
