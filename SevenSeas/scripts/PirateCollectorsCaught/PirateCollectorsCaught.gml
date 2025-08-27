function PirateCollectorsCaught() {
	//Pirate Ship Arrive

	with instance_create(0,0,Event)
	    {
	    myCharacter = 0
	    buttonNumber = 2
	    ds_list_add(buttons, CollectorsAttack, CollectorsRun) 
	    ds_list_add(buttonStats, 0, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 2])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "turn and fight", "run away")
        
	    global.allowSelect = false
	    captionText = "Cove Patrol"
	    global.moraleBoost = "Patrol" 
    
	    eventText = "Captain Hardcoin caught back up, and starts to aim his cannons!"   
    
	    myShip = instance_create(-1000,0,ShipEvent)
	    with myShip
	        {
	        myShipHull = PirateCollectorsSpr
	        flagColor = c_white
	        myFlag = PirateCollectorFlag
	        }
	    }
}
