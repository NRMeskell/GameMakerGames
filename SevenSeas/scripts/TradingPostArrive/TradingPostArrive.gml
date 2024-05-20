function TradingPostArrive() {
	//Pirate Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, TradingPostTrade, TradingPostRest, TradingPostRequest)
	    ds_list_add(buttonStats, 0, 0, 5)
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, (global.seaLevel + 1)*5, 0)
	    ds_list_add(buttonText, "start trading", "rest and repair", "request supplies")
        
	    global.allowSelect = false
	    captionText = "Pirate Post!"
	    eventText = "The crew spotted a small sanctuary at sea."   
	    global.moraleBoost = "Post"
	    myShip = instance_create(-1000,0,TradingPostEvent)
	    }






}
