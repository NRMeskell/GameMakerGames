function PlagueShip() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, PlagueShipPass, PlagueShipSearch)
	    ds_list_add(buttonStats, 0, 3)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 1])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "pass the ship by", "search the ship")
        
	    global.allowSelect = false
	    captionText = "Abandoned Ship!"
    
	    eventText = "It's undamaged but appears to be completely empty." 
	    global.moraleBoost = "plague ship"  
	    }
    
	instance_create(0,0,ShipEvent)
}
