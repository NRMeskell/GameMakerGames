function PlagueShip() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, PlagueShipPass, PlagueShipSearch, PlagueShipLook)
	    ds_list_add(buttonStats, 0, 3, 5)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 2], global.eventDiff[5, 2])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "pass the ship by", "search the entire ship", "search only treasure hold")
        
	    global.allowSelect = false
	    captionText = "Abandoned Ship!"
    
	    eventText = "It's undamaged but appears to be completely empty." 
	    global.moraleBoost = "ship"  
	    }
    
	instance_create(0,0,ShipEvent)






}
