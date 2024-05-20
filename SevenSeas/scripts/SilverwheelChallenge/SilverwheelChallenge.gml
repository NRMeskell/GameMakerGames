function SilverwheelChallenge() {
	with instance_create(0,0,Event)
	    {
	    myCharacter = 3
	    buttonNumber = 2
	    ds_list_add(buttons, SilverwheelDontPay, SilverwheelPay) 
	    ds_list_add(buttonStats, 0, 0) 
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, CaptainSilverwheel.myVar*5)
	    ds_list_add(buttonText, "challenge combat", "argee to repay her")
        
	    global.allowSelect = false
	    captionText = "Captain Silverwheel"
	    eventText = "having heard about your "+ searchReputationType("repute")[1] + ", she demands you return her goods and her honor!" 
    
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
