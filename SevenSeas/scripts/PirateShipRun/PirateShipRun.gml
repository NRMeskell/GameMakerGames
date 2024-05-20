function PirateShipRun() {
	//run away

	if searchReputationType("patrol")[0] < -1 or !irandom(2){
		if searchReputationType("patrol")[0] < -1 {
			ds_list_add(global.notificationList, "attacked!", "the rival ship attacks, hoping to collect a bounty from the patrol!")
		}
		else
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
