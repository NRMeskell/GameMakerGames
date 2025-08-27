function PirateCollectorsZombie() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 13
	    buttonNumber = 2
	    ds_list_add(buttons, CollectorsRun, CollectorsAttack) 
	    ds_list_add(buttonStats, 0, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 3])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "turn and fight", "run away")
        
	    global.allowSelect = false
	    captionText = "Skeletal Hardcoin"
	    global.moraleBoost = "Hardcoin" 
    
	    eventText = "The skeleton of a familiar collector approaches! His unsettling appearance strikes fear in the crew."  
		UpdateMorale(-1, -1)
    
	    myShip = instance_create(-1000,0,ShipEvent)
	    with myShip
	        {
	        myShipHull = SkeletalCollectorsSpr
	        flagColor = c_ltgray
	        myFlag = PirateCollectorFlag
	        }
	    }
}
