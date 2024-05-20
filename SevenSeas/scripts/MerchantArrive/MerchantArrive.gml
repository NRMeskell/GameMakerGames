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
	    with myShip
	        {
	        if global.seaLevel == 0
	            myShipHull = MerchantSmallSpr
	        else if global.seaLevel == 1
	            myShipHull = MerchantMediumSpr
	        else
	            myShipHull = MerchantLargeSpr
            
	        color[0] = make_color_rgb(155,0,0)
	        color[1] = make_color_rgb(128,0,0)
	        color[2] = make_color_rgb(0,44,119)
	        color[3] = make_color_rgb(158,126,2)
	        color[4] = make_color_rgb(140,0,145)
        
	        flagColor = color[irandom(array_length_1d(color)-1)]
	        }
	    }






}
