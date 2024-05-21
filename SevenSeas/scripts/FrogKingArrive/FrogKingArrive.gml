function FrogKingArrive() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 4
	    buttonNumber = 3
	    ds_list_add(buttons, FrogKingLeave, FrogKingPay, FrogKingRefuse) 
	    ds_list_add(buttonStats, 0, 0, 5) 
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, 3])
	    ds_list_add(buttonCosts, 0, 10, 0)
	    ds_list_add(buttonText, "agree to leave", "pay passage fee", "request to stay free")
        
		//check for crown
		with ItemParent 
			if itemName == "Tropical Crown"{
				ds_list_replace(other.buttons, 2, FrogKingCrown)
				ds_list_replace(other.buttonStats, 2, 0)
				ds_list_replace(other.buttonRequires, 2, 0)
				ds_list_replace(other.buttonCosts, 2, 0)
				ds_list_replace(other.buttonText, 2, "give king tropical crown")
			}
			
		
	    global.allowSelect = false
	    captionText = "Frog King"
	    if FrogKing.myState = "unmet"
	        eventText = "a royal frogship approaches. The frog king demands you either leave his kingdom, or pay a passage fee."
	    else if FrogKing.myState = "payment"
	        eventText = "the king of frogs returns. He claims the first payment has expired, and he requires another!" 
	    else if FrogKing.myState = "leave"
	        eventText = "the king is unhappy you returned! He demands you leave or pay - with an additional cost for returning!" 
        else
	        eventText = "the king returns, and informs you that you've overstayed your welcome." 
        
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
