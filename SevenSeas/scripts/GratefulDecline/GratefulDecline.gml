function GratefulDecline() {
	//intimidate
	
	AddReputation("patrol", -1, "cove payment delay")

	if argument0
	    {
	    ds_list_add(global.notificationList, "convinced!", "the Patrol agree to let you pay the fee later")
	    }
	else
	    {
	    ds_list_add(global.notificationList, "unimpressed!", "the cove Patrol are unimpressed and charge you a normal rate!")
	    LoseCargo(0, min(CargoAmount(0), 10))
	    }

	script_execute(closeEventCode, 2)




}
