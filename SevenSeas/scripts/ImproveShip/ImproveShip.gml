function ImproveShip(argument0) {
	//Learn

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
	    newHealth = (Ship.myHealth * 0.1) div 1
    
	    buttonNumber = 2
	    ds_list_add(buttons, ImproveAllow)    
	    global.allowSelect = false

	    eventText = "This ship is quite disappointing. Can I try to upgrade the hull?"
	    global.moraleBoost = "upgrade"
	    }






}
