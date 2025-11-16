function LavaShipArrive() {
	//Pirate Ship Arrive
	if Volcano.myVar > 0{
		script_execute(choose(FloatingBarrel, SmokeyWater, SmokeyWater, MiningRockArrive))
	}
	else{

		with instance_create(0,0,Event)
		    {
		    buttonNumber = 3
		    ds_list_add(buttons, closeEventCode, LavaShipTrade, LavaShipEngage) 
		    ds_list_add(buttonStats, 0, 5, 3)
		    ds_list_add(buttonRequires, 0, global.eventDiff[5, 1], global.eventDiff[3, 1])
		    ds_list_add(buttonCosts, 0, 0, 0)
		    ds_list_add(buttonText, "sail around the ship", "trade with the other ship", "attack the other ship")
        
		    global.allowSelect = false
		    captionText = "Trading Ship!"
    
		    eventText = "A ship brings goods between two ports while the volcano lies dormant."   
		    global.moraleBoost = "traders"
		    myShip = instance_create(-1000,0,ShipEvent)
			myShip.myShipHull = LavaShipSpr
			myShip.myFlag = LavaFlagSpr
		}
	}
}

function LavaShipEngage() {
	//engage
	if argument0{
		with ChildOfTheMountain{
			if myState == "annoyed"
				myState = "attacking"
			else 
				myState = "annoyed"
		}
		with instance_create(0,0,LavaShip)
			{
			flagColor = other.myShip.flagColor
			myShipHull = other.myShip.myShipHull
			}
		instance_destroy(EventDrawer)
	}
	else{
		ds_list_add(global.notificationList, "Pursuit failed!", "The other ship avoided the attack.")
	}
	script_execute(closeEventCode, 2)
}

function LavaShipTrade() {
	//intimidate

	if argument0
	    {
	    GetRandomStore(choose(3, 4), "OFFERED TRADES")
	    ds_list_add(global.notificationList, "negotiations begin!", "the traders ")
	    }
	else
	    {
	    ds_list_add(global.notificationList, "trade declined!", "The traders refuse to trade, hoping to get to port before the volcano erupts.")
	    }

	script_execute(closeEventCode, 2)

}

