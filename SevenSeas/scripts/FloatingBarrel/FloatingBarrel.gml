function FloatingBarrel() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, FloatingBarrelLetFloat, FloatingBarrelGrab)
	    ds_list_add(buttonStats, 0, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 0])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "Let the barrel float by", "Bring the barrel aboard")
        
	    global.allowSelect = false
	    captionText = "A barrel be floating by!"
	    eventText = "It could contain anything: treasure, booty, rats!"   
	    global.moraleBoost = "barrel"
	    }

	with instance_create(0,0,Barrel)
	    {
	    floatAway = false
	    placeX = 50
	    }






}
