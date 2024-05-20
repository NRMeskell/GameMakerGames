function FrogKingDemandLeave() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 4
	    buttonNumber = 3
	    ds_list_add(buttons, FrogKingLeave, FrogKingEnrage) 
	    ds_list_add(buttonStats, 0, 0, 5) 
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5,3])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "agree to leave", "refuse to leave")
        
	    global.allowSelect = false
	    captionText = "Frog King"
	    eventText = "the king approaches again. He threatens to display his full power unless you leave his kingdom!" 
    
		//check for crown
		with ItemParent 
			if itemName == "Tropical Crown"{
				ds_list_add(other.buttons, FrogKingCrown)
				ds_list_add(other.buttonStats, 0)
				ds_list_add(other.buttonRequires, 0)
				ds_list_add(other.buttonCosts, 0)
				ds_list_add(other.buttonText, "give king tropical crown")
			}
		
	    myShip = instance_create(-1000,0,ShipEvent)
	    with myShip
	        {
	        myShipHull = FrogKingShipSpr
	        flagColor = c_purple
	        myFlag = TropicalFlagSpr
	        }
	    global.moraleBoost = "frog king"
	    }
		
	with FrogKing
		event_user(1)

}
