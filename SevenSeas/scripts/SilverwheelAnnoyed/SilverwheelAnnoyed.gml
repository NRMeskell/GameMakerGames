function SilverwheelAnnoyed() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 2
	    buttonNumber = 2
	    ds_list_add(buttons, SilverwheelDeny, SilverwheelTradeRequest) 
	    ds_list_add(buttonStats, 0, 0, 5) 
	    ds_list_add(buttonRequires, 0, global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "pass her ship by", "request to trade")
        
	    global.allowSelect = false
	    captionText = "Captain Silverwheel"
	    eventText = "unhappy with your recent " + searchReputationType("repute")[1] + " silverwheel refuses to trade!"
    
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
