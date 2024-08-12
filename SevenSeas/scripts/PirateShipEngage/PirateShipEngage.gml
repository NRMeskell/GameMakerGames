function PirateShipEngage() {
	//engage
	if global.seaType == global.seaNames[0] and !irandom(3) and instance_exists(CoveCollector){
		ds_list_add(global.notificationList, "Cove Patrol intervenes!", "Captain Hardcoin intercepts your ship and prevents the attack")
		if CoveCollector.myVar >= 0 
			CoveCollector.myVar = 0
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
