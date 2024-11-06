function FrogNegotiate() {
	//intimidate

	if argument0
	    {
		ds_list_add(global.notificationList, "negotiations successful!", "The tropical ship listens to your message, and agrees to trade.") 
		GetRandomStore(irandom_range(3,4), "Trades")
		with Store{
			var pearlTrade = instance_create(0,0,StoreObjectTrade)
			pearlTrade.alarm[0] = 1
			
			ds_list_replace(items, 0, pearlTrade)
		}
	}
	else// if result < 8
	    {
	    ds_list_add(global.notificationList, "attacked!", "the tropical ship is unimpressed and begin to board the ship!")
	    with instance_create(0,0,myShip.myShipType)  
			//CombatRunner.closeRange = true
	    instance_destroy(EventDrawer)
	}

	script_execute(closeEventCode, 2)



}
