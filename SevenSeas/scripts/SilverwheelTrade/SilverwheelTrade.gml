function SilverwheelTrade() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 2
	    buttonNumber = 2
	    ds_list_add(buttons, SilverwheelDeny, SilverwheelTradeGood, SilverwheelRelent) 
	    ds_list_add(buttonStats, 0, 0, 5) 
	    ds_list_add(buttonRequires, 0, 0, global.eventDiff[5, max(0, min(CaptainSilverwheel.myVar div 2, 3))])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "decline her offer", "start to trade", "request free goods")
        
	    global.allowSelect = false
	    captionText = "Captain Silverwheel"
	    eventText = "happy with your progress, she offers to trade at a fair price!" 
    
	    myShip = instance_create(-1000,0,ShipEvent)
	    with myShip
	        {
	        myShipHull = SilverwheelShipSpr
	        flagColor = c_white
	        myFlag = SilverwheelFlagSpr
	        }
	    global.moraleBoost = "Silverwheel"
	    }





}
