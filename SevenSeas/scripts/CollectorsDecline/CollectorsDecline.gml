function CollectorsDecline() {
	//intimidate
	AddReputation("patrol", -1, "payment delay")

	if argument0
	    {
	    ds_list_add(global.notificationList, "convinced!", "the Patrol agree to let you pay the fee later.")
	    }
	else
	    {
	    ds_list_add(global.notificationList, "unimpressed!", "the cove Patrol are unimpressed and charge you 8 gold instead!")
	    LoseCargo(0, min(CargoAmount(0), 8))
	    }
    
	with EventDrawer
	        floatAway = true
	script_execute(closeEventCode, 2)




}
