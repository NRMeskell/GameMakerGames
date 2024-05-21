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
