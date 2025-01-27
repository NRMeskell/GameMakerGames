function MerchantLure() {
	//intimidate

	result = irandom(10)

	if argument0
	    {
	    with instance_create(0,0,Merchant)
	        {
	        flagSprite = other.myShip.myFlag
	        myShipHull = other.myShip.myShipHull
	        shipType = other.myShip.shipType
	        }
	    instance_destroy(EventDrawer)
	    ds_list_add(global.notificationList, "they're surprised!", "the merchant ship is caught off guard!")
	    with Enemy
	        {
	        myHealth = round(myHealth*0.75)
	        ds_list_delete(myStats, 0)
	        }
	    }
	else// if result < 8
	    {
	    ds_list_add(global.notificationList, "escaped!", "the merchant ship was not fooled and sailed away!")
	    with ShipEvent
	        {
	        runAway = true
	        floatAway = true
	        }
	    with Pirate
	        UpdateMorale(-1, global.FEARSOME)
	    }

	script_execute(closeEventCode, 2)



}
