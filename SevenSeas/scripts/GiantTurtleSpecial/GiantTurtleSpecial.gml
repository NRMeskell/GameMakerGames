function GiantTurtleSpecial() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 5
	    buttonNumber = 3
	    ds_list_add(buttons, GiantTurtleFeed, GiantTurtleJewel, GiantTurtleSpecialTake) 
	    ds_list_add(buttonStats, 4, 1, 3) 
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[3, 0])
	    ds_list_add(buttonCosts, 1, 1, 0)
	    ds_list_add(buttonText, "feed the turtle food", "give the turtle jewel", "take the gift")
        
	    global.allowSelect = false
	    captionText = "Giant Sea Turtle"
	    eventText = "the sea turtle returns, with a strange gift on its back" 
        
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
