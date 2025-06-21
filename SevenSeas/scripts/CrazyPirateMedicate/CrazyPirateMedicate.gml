function CrazyPirateMedicate() {
	//let be

	if !argument0{
		if irandom(1)
			with instance_create(0,0,ConditionTimer)
			    {
			    condition = CrazyPirate
			    }
				
		with Pirate
			UpdateHealth(id, -myHealth*0.2)
		ds_list_add(global.notificationList, "The crew seem unaided!", "The medicine is awful, and does not seem to help.")
		UpdateMorale(-1, -1)
	}
	else{
        ds_list_add(global.notificationList, "The crew be helped!", "The crew seems to be doing better...")
		UpdateMorale(1, -1)
	}
}
