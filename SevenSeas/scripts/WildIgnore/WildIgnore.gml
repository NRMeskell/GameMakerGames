function WildIgnore() {

	if irandom(2) == 0
	    {
	    ds_list_add(global.notificationList, "animals on board!", "several animals climbed onto the ship!")
	    with instance_create(0,0,ConditionTimer)
	            condition = RatsEvent
	    }
	else{
		ds_list_add(global.notificationList, "annoyed locals", "The locals note your lack of help.")
		AddReputation("repute", -1, "annoyed locals")
	}

	script_execute(closeEventCode)
}
