function PirateCollectorsArrive() {
	//Pirate Ship Arrive

	with instance_create(0,0,Event)
	    {
	    myCharacter = 0
	    buttonNumber = 3
	    ds_list_add(buttons, CollectorsRun, CollectorsPay, CollectorsDecline) 
	    ds_list_add(buttonStats, 0, 0, 5)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, 3])
	    ds_list_add(buttonCosts, 0, min(CargoAmount(0), 5), 0)
	    ds_list_add(buttonText, "Run away", "make payment", "delay payment")
        
	    global.allowSelect = false
	    captionText = "Cove Patrol"
    
	    eventText = "Captain Hardcoin has arrived to collect the cove sanctuary fee."  
	    global.moraleBoost = "Patrol" 
    
	    myShip = instance_create(-1000,0,ShipEvent)
	    with myShip
	        {
	        myShipHull = PirateCollectorsSpr
	        flagColor = c_white
	        myFlag = PirateCollectorFlag
	        }
	    }






}
