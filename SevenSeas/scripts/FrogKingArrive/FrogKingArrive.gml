function FrogKingArrive() {
	with instance_create(0,0,Event){
	    myCharacter = 4
	    buttonNumber = 3
	    ds_list_add(buttons, FrogKingPay, FrogKingRequest, FrogKingBefreind) 
	    ds_list_add(buttonStats, 0, 5, 7) 
	    ds_list_add(buttonRequires, 0, global.eventDiff[5, 2], 0)
	    ds_list_add(buttonCosts, 10, 0, 5)
	    ds_list_add(buttonText, "pay for passage", "request free passage", "befriend with a gift")
        
		//check for crown
		if ItemExists("Tropical Crown"){
			ds_list_replace(buttons, 0, FrogKingCrown)
			ds_list_replace(buttonStats, 0, 0)
			ds_list_replace(buttonRequires, 0, 0)
			ds_list_replace(buttonCosts, 0, 0)
			ds_list_replace(buttonText, 0, "give king tropical crown")
			}
			
		
	    global.allowSelect = false
	    captionText = "Frog King"
	    if FrogKing.myState = "unmet"
	        eventText = "The frog king arrives and demands you either leave his kingdom, or pay a fee."
	    else if FrogKing.myState = "payment"
	        eventText = "the king of frogs claims the first payment has expired, and requires another." 
	    else if FrogKing.myState = "leave"
	        eventText = "annoyed at your return, the frog king demands you leave or pay!" 
        else if FrogKing.myState = "annoyed"
	        eventText = "the king demands you leave, and has sent a royal hunt for your ship!" 
		else
	        eventText = "the king returns, and informs you that you've overstayed your welcome." 
        
	    myShip = instance_create(-1000,0,ShipEvent)
	    with myShip
	        {
	        myShipHull = FrogKingShipSpr
	        flagColor = c_purple
	        myFlag = TropicalFlagSpr
	        }
	    global.moraleBoost = "frog king"
	    }

	with FrogKing
		event_user(1)
}


function FrogKingPay() {
	ds_list_add(global.notificationList, "Payment Accepted!", "The king accepts the payment, and will allow you to remain in his sea.")
	FrogKing.myState = "payment"
    
	script_execute(closeEventCode)
}


function FrogKingBefreind(){
	
	if FrogKing.myState != "annoyed"
		ds_list_add(global.notificationList, "Pearls delivered!", "The frog king is quite delighted, and promises free passage for your ship!")
	else
		ds_list_add(global.notificationList, "Pearls delivered!", "The frog king graciously accepts your gift, and promises to cease the royal hunt for your ship.")
	
	//conquer the sea
	with MapCreator{
		event_user(1)
	}
	
	instance_destroy(FrogKing)
	script_execute(closeEventCode)
}


function FrogKingRequest() {
	if argument0{
		ds_list_add(global.notificationList, "Request accepted!", "The Frog King allows you to sail freely, but will return if you linger too long.")
		FrogKing.myState = "free"
	}
	else{
		ds_list_add(global.notificationList, "Request Refused!", "The Frog King is unhappy with your request, and escorts you out of the Tropical Waters")
			
		pSeaX = MapCreator.mapStart + MapCreator.mapSizeX/2 + ds_map_find_value(MapCreator.seas[0], "x")
		pSeaY = MapCreator.mapSizeY/2 + ds_map_find_value(MapCreator.seas[0], "y")
		tSeaX = MapCreator.mapStart + MapCreator.mapSizeX/2 + ds_map_find_value(MapCreator.seas[1], "x")
		tSeaY = MapCreator.mapSizeY/2 + ds_map_find_value(MapCreator.seas[1], "y")

		with MapShip{
			path_end()
			x = (other.pSeaX + other.tSeaX)/2
			y = (other.pSeaY + other.tSeaY)/2
			}
    
		if global.inPort
			with Store
			    event_user(0)
					
		with MapShip
			{
			//reset islands
			event_user(0)
			targetPort = instance_find(LandingSpot, 0)
			FindPath(sailPath, x, y, x, y)
			if path_get_number(sailPath) > 0 {                    
			    toPort = true

			    global.portType = targetPort.myIndex
			    global.mapPause = false
                
			    path_start(sailPath, 0, path_action_stop, false)
			    }
			//create new islands
			event_user(1)
			}
    
		if FrogKing.myState == "leave"
			FrogKing.myState = "annoyed"
		else
			FrogKing.myState = "leave"
	}
	script_execute(closeEventCode)
}


function FrogKingAttack() {
	with instance_create(0, 0, TropicalEnemyRoyal){
	        pirateMoved = true
	        playerTurn = false
	        event_user(0)
	        }
        
	ds_list_add(global.notificationList, "Royal Ambush!", "A Royal Frog Ship, sent by the King himself, has been sent to sink your ship!")
}


function FrogKingCrown() {	
	
	ds_list_add(global.notificationList, "Crown Returned!", "The frog king leaps in delight! He promises free passage and presents a royal gift!")
	FrogKing.myState = "frog gift"
	GetRandomLoot(4, "GIFTS", undefined)
	CustomSeaLoot(true)
	CustomSeaLoot(true)
	CustomSeaLoot(true)
	CustomSeaLoot(true)
	
	with ItemParent
		if itemName == "Tropical Crown"{
			UnequipItem(id)
	        while ds_list_find_index(ItemRunner.floatingItems, id) != -1
	            ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, self.id))
	        instance_destroy()
		}

	instance_destroy(FrogKing)
	script_execute(closeEventCode)
}


