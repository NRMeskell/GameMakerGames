/// @description clean up the mess

function SkippingAbout(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
		otherPirate = RandomPirate()
		
			
	    buttonNumber = 2
	    ds_list_add(buttons, SkippingAllow) 
	    global.allowSelect = false
	    eventText = "Sprinting about the ship is so much faster, but " + otherPirate.name + " doesn't like it. Can I keep running?"
    
	    global.moraleBoost = "sprinting"
	    }
}


function SkippingAllow() {
	ds_list_add(global.notificationList, "Running Allowed!", myPirate.firstName + " continues to run, much to " +  otherPirate.firstName + "'s annoyance.")
	
	with myPirate
		UpdateMorale(1, -1)
	with otherPirate
		UpdateMorale(-2, -1)
}
