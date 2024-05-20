function MerchantChase() {
	//run away

	if !argument0
	    {
	    with ShipEvent
	        {
	        runAway = true
	        floatAway = true
	        }
	    with Pirate
	        UpdateMorale(-1, global.FEARSOME)
	    ds_list_add(global.notificationList, "They got away!", "the merchant ship is surprisingly quick, and they escaped!")
	    }
	else
	    {
	    with instance_create(0,0,Merchant)
	        {
	        flagColor = other.myShip.flagColor
	        myShipHull = other.myShip.myShipHull
	        shipType = other.myShip.shipType
	        }
	    instance_destroy(EventDrawer)
	    ds_list_add(global.notificationList, "They be ours!", "Man yer stations!")
	    }

	script_execute(closeEventCode, 2)







}
