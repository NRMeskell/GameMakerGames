function MerchantArrive() {
	//Merchant Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, MerchantLetGo, MerchantChase, MerchantLure)
	    ds_list_add(buttonStats, 0, 3, 5)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 1], global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "let them go", "try to catch them", "lure them with fake flags")
        
	    global.allowSelect = false
	    captionText = "A merchant ship sails by!"
	    global.moraleBoost = "merchant"
    
	    eventText = "They have seen us and are sailing past quickly." 
    
	    myShip = instance_create(0,0,ShipEvent)  
	    with myShip{
	        myFlag = MerchantFlagSpr
	        if global.seaLevel == 0
	            myShipHull = MerchantSmallSpr
	        else if global.seaLevel == 1
	            myShipHull = MerchantMediumSpr
	        else
	            myShipHull = MerchantLargeSpr
	        }
	    }






}
