function PirateCollectorsRoyals() {
	//TEMP

	with instance_create(0,0,Event)
	    {
	    myCharacter = 0
	    buttonNumber = 2
	    ds_list_add(buttons, CollectorsRun, CollectorsAttack) 
	    ds_list_add(buttonStats, 0, 0, 5)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, 3])
	    ds_list_add(buttonCosts, 0, min(CargoAmount(0), 15), 0)
	    ds_list_add(buttonText, "Run away", "attack")
        
	    global.allowSelect = false
	    captionText = "Captain Hardcoin"
	    global.moraleBoost = "Collectors" 
    
	    eventText = "Captain Hardcoin is spotted in a "   
    
	    myShip = instance_create(-1000,0,ShipEvent)
	    with myShip
	        {
	        myShipHull = PirateCollectorsSpr
	        flagColor = c_white
	        myFlag = PirateCollectorFlag
	        }
	    }
}
