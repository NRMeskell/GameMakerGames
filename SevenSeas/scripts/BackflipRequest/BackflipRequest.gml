function BackflipRequest(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
		otherPirate = RandomPirate()
	    while otherPirate == myPirate and instance_number(Pirate) > 1
	        otherPirate = RandomPirate()
			
	    buttonNumber = 2
	    ds_list_add(buttons, BackflipAllow) 
	    global.allowSelect = false
	    eventText = "'Can I teach " + otherPirate.name + " to do a backflip? It would be so cool!'"
    
	    global.moraleBoost = "backflip"
	    }






}
