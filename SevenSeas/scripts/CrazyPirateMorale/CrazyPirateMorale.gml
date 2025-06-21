function CrazyPirateMorale() {
	//let be

	if !argument0{
		if irandom(1)
			with instance_create(0,0,ConditionTimer)
			    {
			    condition = CrazyPirate
			    }
        ds_list_add(global.notificationList, "Poor speech!", "Hopefully it's enough...")
		UpdateMorale(-1, -1)
	}
	else{
        ds_list_add(global.notificationList, "Good Speech!", "The crew seems to be doing better!")
		UpdateMorale(1, -1)
	}
}
