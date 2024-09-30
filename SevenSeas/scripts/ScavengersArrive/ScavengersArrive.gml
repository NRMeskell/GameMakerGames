function ScavengersArrive() {
	//Pirate Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, ScavengersEngage, ScavengersAvoid, ScavengersTrap) 
	    ds_list_add(buttonStats, 0, 3, 5)
	    ds_list_add(buttonRequires, 0, global.eventDiff[3, 2], global.eventDiff[5, 3])
	    ds_list_add(buttonCosts, 0, 0, 0)
	    ds_list_add(buttonText, "Engage the ship", "hide amongst the rocks", "Lead their ship aground")
        
	    global.allowSelect = false
	    captionText = "Scavengers!"
    
	    eventText = "A Scavenger Ship appears to be patrolling this area."   
	    global.moraleBoost = "Scavengers"
	    myShip = instance_create(-1000,0,ShipEvent)
		with myShip{
			myShipType = ScavengerShip        
	        myShipHull = ScavengerShipSpr
			flagColor = c_white
	        myFlag = ScavengerFlagSpr
		}
	}
}

function ScavengersAvoid() {
	//engage
	if !argument0{
		ds_list_add(global.notificationList, "Caught!", "The Scavenger Ship sails around the rocks, and begins to engage.")
		with instance_create(0,0,ScavengerShip)
			{
			flagColor = other.myShip.flagColor
			myShipHull = other.myShip.myShipHull
			shipType = other.myShip.shipType
			}
		instance_destroy(EventDrawer)
	}
	else{
		ds_list_add(global.notificationList, "Hidden!", "Your crew successfully avoids the scavenger ship, raising spirits!")
		UpdateMorale(1, -1)
		
		with EventDrawer
			floatAway = true
	}
	script_execute(closeEventCode, 2)	
}

function ScavengersEngage() {
	//engage
	with instance_create(0,0,ScavengerShip){
		flagColor = other.myShip.flagColor
		myShipHull = other.myShip.myShipHull
		shipType = other.myShip.shipType
		}
	instance_destroy(EventDrawer)
	script_execute(closeEventCode, 2)
}

function ScavengersTrap() {
	//engage
	if !argument0{
		ds_list_add(global.notificationList, "Engaged!", "The risky maneuver brought your ships close, and the scavengers attacked!")
		with instance_create(0,0,ScavengerShip)
			{
			flagColor = other.myShip.flagColor
			myShipHull = other.myShip.myShipHull
			shipType = other.myShip.shipType
			//CombatRunner.closeRange = true
			}
		instance_destroy(EventDrawer)
	}
	else{
		ds_list_add(global.notificationList, "Lead into rocks!", "The scavenger ship crashes, and several barrels float from the wreckage!")
		GetRandomLoot(irandom(2), "Barrels", [-1, 0, 1, 2, 3, 4, 5])
		
		with EventDrawer{
			floatAway = true
			image_index = 2
		}
	}
	script_execute(closeEventCode, 2)	
}

