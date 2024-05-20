function SilverwheelArrive() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 2
	    buttonNumber = 2
	    ds_list_add(buttons, SilverwheelAccept, SilverwheelDeny) 
	    ds_list_add(buttonStats, 0, 0) 
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "accept her offer", "deline her offer")
        
	    global.allowSelect = false
	    captionText = "Captain Silverwheel"
	    if CaptainSilverwheel.myState = "free"
	        eventText = "captain silverwheel once again offers her service and equipment to you freely." 
	    else{
	        eventText = "the famous captain is always happy to help new pirates! She offers your crew some free equipment." 
	        }
    
	    myShip = instance_create(-1000,0,ShipEvent)
	    with myShip
	        {
	        myShipHull = SilverwheelShipSpr
	        flagColor = c_white
	        myFlag = SilverwheelFlagSpr
	        }
	    global.moraleBoost = "Silverwheel"
		
		CaptainSilverwheel.myState = "trade"
	    }





}
