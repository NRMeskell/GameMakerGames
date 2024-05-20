function FrogNegotiate() {
	//intimidate

	if argument0
	    {
		if searchReputationType("nature")[0] > 2{
			ds_list_add(global.notificationList, "respect found!", "the tropical ship knows of your " + searchReputationType("nature")[1] + " and offers a gift in return for your kindness.")
			GetRandomLoot(irandom_range(1,2), "Gifts", [-1, 1, 4, 6])
		}
		else{
			ds_list_add(global.notificationList, "negotiations successful!", "The tropical ship listens to your message, and agrees to trade without conflict.") 
			GetRandomStore(irandom_range(3,4), "Trades")
		}
	    }
	else// if result < 8
	    {
	    ds_list_add(global.notificationList, "attacked!", "the tropical ship is unimpressed and they attacked!")
	    instance_create(0,0,myShip.myShipType)       
	    instance_destroy(EventDrawer)
	    }

	script_execute(closeEventCode, 2)



}
