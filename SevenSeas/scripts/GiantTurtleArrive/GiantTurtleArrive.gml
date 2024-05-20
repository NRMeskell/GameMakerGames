function GiantTurtleArrive() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 5
	    buttonNumber = 3
	    ds_list_add(buttons, GiantTurtleIgnore, GiantTurtleFeed, GiantTurtleJewel) 
	    ds_list_add(buttonStats, 0, 4, 1) 
	    ds_list_add(buttonRequires, 0, 0, 0)
	    ds_list_add(buttonCosts, 0, 1, 1)
	    ds_list_add(buttonText, "ingore the turtle", "feed the turtle food", "give the turtle jewel")
        
	    global.allowSelect = false
	    captionText = "Giant Sea Trutle"
	    if GiantTurtle.myState == "unmet"
	        eventText = "a massive sea turtle arrives, and begins to swim alongside the ship" 
	    else
	        eventText = "the sea turtle returns, and once again begins to swim alongside the ship" 
        
		GiantTurtle.myState = "waiting"
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
