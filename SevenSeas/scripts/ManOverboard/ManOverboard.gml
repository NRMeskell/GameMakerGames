function ManOverboard() {
	with instance_create(0, 0, Event)
	    {
	    pirateOverboard = RandomPirate()
	
	    buttonNumber = 3
	    ds_list_add(buttons, ManOverboardRope, ManOverboardSave)
	    ds_list_add(buttonStats, 3, 5)
	    ds_list_add(buttonRequires, global.eventDiff[3,0], global.eventDiff[5,1])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "Throw them a rope!", "Stear towards them!")
        
	    global.allowSelect = false
	    captionText = pirateOverboard.firstName + " overboard!"
	    eventText = pirateOverboard.name + " will drown if they don't make it back!" 
	    global.moraleBoost = "overboard"  
	    } 
}
