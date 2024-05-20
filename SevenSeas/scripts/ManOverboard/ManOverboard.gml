function ManOverboard() {
	with instance_create(0, 0, Event)
	    {
	    pirateOverboard = instance_find(Pirate, irandom(instance_number(Pirate) - 1))
		pirateOverboard.injured = true
	
	    buttonNumber = 3
	    ds_list_add(buttons, ManOverboardSwim, ManOverboardSave, ManOverboardRope)
	    ds_list_add(buttonStats, 0, 3, 5)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3,1], global.eventDiff[5,2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "let them swim!", "Throw them a rope!", "Steer towards them!")
        
	    global.allowSelect = false
	    captionText = "overboard!"
	    eventText = pirateOverboard.name + " will drown if they don't make it back!" 
	    global.moraleBoost = "overboard"  
	    } 





}
