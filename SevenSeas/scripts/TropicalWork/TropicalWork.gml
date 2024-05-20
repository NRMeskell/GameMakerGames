function TropicalWork() {
	//engage

	with Pirate
	    {
	    UpdateMorale(-1, global.FEARSOME)
	    UpdateMorale(-1, global.DARING)
	    with instance_create(0,0,ConditionTimer)
	        condition = HeatSickness
	    }
    
	ds_list_add(global.notificationList, "Crew suffers!", "morale is lowered and some crew suffers from exhaustion!")
    
	script_execute(closeEventCode, 2)







}
