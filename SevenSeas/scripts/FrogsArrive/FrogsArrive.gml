function FrogsArrive() {
	//Merchant Arrive

	with instance_create(0,0,Event){
	    buttonNumber = 3
	    ds_list_add(buttons, FrogAttack, FrogRun, FrogNegotiate) 
	    ds_list_add(buttonStats, 0, 3, 5)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 2], global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "prepare for battle", "run away", "approach and negotiate")
        
	    global.allowSelect = false
	    captionText = "Strange ship approaching!"
    
	    eventText = "The strange ship manned by frog-men is sailing right at the ship!" 
	    global.moraleBoost = "Frogs"
	    myShip = instance_create(0,0,ShipEvent)  
	    with myShip {
	        myShipType = choose(TropicalEnemy)
	        if myShipType == TropicalEnemy
	            myShipHull = TropicalShipSpr
	        else
	            myShipHull = TropicalSwordShipSpr
        
	        flagColor = make_color_rgb(45,133,45)
	        myFlag = TropicalFlagSpr
	    }
	}
}
