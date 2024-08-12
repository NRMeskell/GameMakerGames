function SilverwheelRepay() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 2
	    buttonNumber = 2
	    ds_list_add(buttons, SilverwheelDontPay, SilverwheelDelayPay, SilverwheelPay) 
	    ds_list_add(buttonStats, 0, 5, 0) 
	    ds_list_add(buttonRequires, 0, global.eventDiff[5, 1], 0)
	    ds_list_add(buttonCosts, 0, 0, CaptainSilverwheel.myVar*5)
	    ds_list_add(buttonText, "refuse her offer", "delay the repayment", "argee to her request")
        
	    global.allowSelect = false
	    captionText = "Captain Silverwheel"
	    eventText = "Silverwheel arrives, and requests repayment for her aid." 
    
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
