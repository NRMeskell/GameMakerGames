function GiantTurtleMedium() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 5
	    buttonNumber = 2
	    ds_list_add(buttons, GiantTurtleIgnore, GiantTurtleMediumTake) 
	    ds_list_add(buttonStats, 0, 3) 
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 1])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "ingore the turtle", "take the gift")
        
	    global.allowSelect = false
	    captionText = "Giant Sea Trutle"
	    eventText = "the sea turtle returns, with what appears to be a large gift on its back" 
        
	    with instance_create(0,0,GiantTurtleDrawer)
	        {
	        floatAway = false
	        }
	    global.moraleBoost = "turtle"
    
	    with Pirate{
	        UpdateMorale(1, global.JOLLY)
	        UpdateMorale(1, global.KEEN)
	        }
	    }





}
