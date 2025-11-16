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

function PirateShipEngage() {
	//engage
	if global.seaType == global.seaNames[0] and !irandom(3) and instance_exists(CoveCollector){
		ds_list_add(global.notificationList, "Cove Patrol intervenes!", "Captain Hardcoin intercepts your ship and prevents the attack")
		if CoveCollector.myVar >= 0{
			CoveCollector.myVar = 0
		}
		else{
			instance_create(0,0,EnemyCollectors)
			instance_destroy(EventDrawer)
		}
			
		
		with EventDrawer
			floatAway = true
		newShip = instance_create(-1000,0,ShipEvent)
	    with newShip
	        {
	        myShipHull = PirateCollectorsSpr
	        flagColor = c_white
	        myFlag = PirateCollectorFlag
	        }
	}
	else{
		if argument0{
			with instance_create(0,0,EnemyShip)
			    {
			    flagColor = other.myShip.flagColor
			    myShipHull = other.myShip.myShipHull
			    shipType = other.myShip.shipType
			    }
			instance_destroy(EventDrawer)
		}
		else{
			ds_list_add(global.notificationList, "Pursuit failed!", "The other ship avoided the attack.")
		}
	}
	script_execute(closeEventCode, 2)
}

function PirateShipRun() {
	//run away

	if !irandom(2){
		ds_list_add(global.notificationList, "attacked!", "the rival ship is upon us!")
			
		with instance_create(0,0,EnemyShip)
		    {
		    flagColor = other.myShip.flagColor
		    myShipHull = other.myShip.myShipHull
		    shipType = other.myShip.shipType
		    }
		instance_destroy(EventDrawer)
		}
	else{
		with EventDrawer
			floatAway = true
		}

	script_execute(closeEventCode, 2)
}

function PirateShipTrade() {
	//intimidate

	if argument0
	    {
	    GetRandomStore(choose(3, 4), "OFFERED TRADES")
	    ds_list_add(global.notificationList, "negotiations begin!", "the rival ship offered useful equipment")
	    }
	else
	    {
	    ds_list_add(global.notificationList, "attacked!", "the rival ship lures you in, and springs a surprise attack!")
	    with instance_create(0,0,EnemyShip)
	        {
	        flagColor = other.myShip.flagColor
	        myShipHull = other.myShip.myShipHull
	        shipType = other.myShip.shipType
			//CombatRunner.closeRange = true
	        }
        
	    instance_destroy(EventDrawer)
	    }

	script_execute(closeEventCode, 2)

}

