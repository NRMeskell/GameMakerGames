function Checkers(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
	    otherPirate = RandomPirate()
	    while otherPirate == myPirate and instance_number(Pirate) > 1
	        otherPirate = RandomPirate()
        
	    buttonNumber = 2
	    ds_list_add(buttons, CheckersAllow)
     
	    global.allowSelect = false
		myGame = choose("dice", "checkers", "chess")
	    eventText = "I have been thinking of new " + myGame + " strategies. Can I try them on " + otherPirate.name + "?"
	    global.moraleBoost = myGame
	    }




}
