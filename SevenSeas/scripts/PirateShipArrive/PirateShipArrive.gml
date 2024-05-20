function PirateShipArrive() {
	//Pirate Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, PirateShipRun, PirateShipEngage, PirateShipTrade) 
	    ds_list_add(buttonStats, 0, 3, 5)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 1], global.eventDiff[5, 1])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "sail around the ship", "attack the other ship", "trade with the other ship")
        
	    global.allowSelect = false
	    captionText = "Rival pirates!"
    
	    eventText = "A rival pirate ship appears on the horizon."   
	    global.moraleBoost = "Pirates"
	    myShip = instance_create(-1000,0,ShipEvent)
	    }






}
