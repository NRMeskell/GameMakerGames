function GiantTurtleSmallTake() {
	if argument0{
		with EventDrawer
		    floatAway = true
    
		GetRandomLoot(1, "TURTLE GIFT", undefined)
		with Store
		    CustomSeaLoot()
		GiantTurtle.myVar = 0
	}
	else{
		ds_list_add(global.notificationList, "Item fell!", "The item was knocked off the turtle, and it dives slowly down after it")
	}
    
	script_execute(closeEventCode)




}
