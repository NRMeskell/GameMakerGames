function PirateCollectorsGrateful() {
	//Pirate Ship Arrive

	with instance_create(0,0,Event)
	    {
	    myCharacter = 0
	    buttonNumber = 3
	    ds_list_add(buttons, CollectorsRun, CollectorsPay, GratefulDecline) 
	    ds_list_add(buttonStats, 0, 0, 5)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, 3])
	    ds_list_add(buttonCosts, 0, min(CargoAmount(0), 3), 0)
	    ds_list_add(buttonText, "Run away", "make payment", "delay payment")
        
	    global.allowSelect = false
	    captionText = "Cove Patrol"
	    global.moraleBoost = "Patrol" 
    
	    eventText = "Captain Hardcoin recognizes you, and only charges 3 gold as a fee."   
    
	    myShip = instance_create(-1000,0,ShipEvent)
	    with myShip
	        {
	        myShipHull = PirateCollectorsSpr
	        flagColor = c_white
	        myFlag = PirateCollectorFlag
	        }
	    }
}
