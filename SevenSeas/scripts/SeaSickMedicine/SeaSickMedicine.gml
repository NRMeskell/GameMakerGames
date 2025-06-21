function SeaSickMedicine() {
	//guide back

	if !argument0{
	    with sickPirate{
			UpdateHealth(Ship, -20-10*global.seaLevel)
			UpdateMorale(-2, -1)
		}
    
	    ds_list_add(global.notificationList, "The medicine is bad!", sickPirate.name + " becomes more ill and loses health and morale!")
	}
	else {
	    ds_list_add(global.notificationList, "The medicine works!", sickPirate.name + " feels much better!")
	}

	script_execute(closeEventCode, 2)



}
