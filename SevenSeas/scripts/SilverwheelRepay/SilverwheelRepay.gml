function SilverwheelRepay() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 2
	    buttonNumber = 2
	    ds_list_add(buttons, SilverwheelDontPay, SilverwheelPay) 
	    ds_list_add(buttonStats, 0, 0) 
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, CaptainSilverwheel.myVar*4)
	    ds_list_add(buttonText, "refuse her offer", "argee to repay")
        
	    global.allowSelect = false
	    captionText = "Captain Silverwheel"
	    eventText = "Now that you're a successful pirate, silverwheel asks for recognition and repayment for her earlier aid." 
    
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
