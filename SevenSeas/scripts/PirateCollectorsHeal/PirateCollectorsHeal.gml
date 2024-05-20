function PirateCollectorsHeal() {
	//Pirate Ship Arrive

	with instance_create(0,0,Event)
	    {
	    myCharacter = 0
	    buttonNumber = 2
	    ds_list_add(buttons, closeEventCode, TradingPostTrade, TradingPostRest) 
	    ds_list_add(buttonStats, 0, 0, 0)
	    ds_list_add(buttonRequires, 0, 0, 0)
	    ds_list_add(buttonCosts, 0, 0, 10)
	    ds_list_add(buttonText, "decline the offer", "purchase equipment", "purchase medical aid")
        
	    global.allowSelect = false
	    captionText = "Cove Patrol"
	    global.moraleBoost = "Patrol" 
    
	    eventText = "Captain Hardcoin arrives, and offers his aid in return for your " + searchReputationType("patrol")[1] + "!"
    
	    myShip = instance_create(-1000,0,ShipEvent)
	    with myShip
	        {
	        myShipHull = PirateCollectorsSpr
	        flagColor = c_white
	        myFlag = PirateCollectorFlag
	        }
	    }





}
