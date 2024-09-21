function PirateShipTrade() {
	//intimidate

	if argument0
	    {
	    GetRandomStore(choose(3, 4), "OFFERED TRADES")
	    ds_list_add(global.notificationList, "negotiations begin!", "the rival ship offered useful equipment")
	    }
	else
	    {
	    ds_list_add(global.notificationList, "attacked!", "the rival ship lures you in, and springs a suprise attack!")
	    with instance_create(0,0,EnemyShip)
	        {
	        flagColor = other.myShip.flagColor
	        myShipHull = other.myShip.myShipHull
	        shipType = other.myShip.shipType
			CombatRunner.closeRange = true
	        }
        
	    instance_destroy(EventDrawer)
	    }

	script_execute(closeEventCode, 2)

}
