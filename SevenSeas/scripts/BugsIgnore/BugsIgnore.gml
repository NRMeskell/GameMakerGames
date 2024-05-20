function BugsIgnore() {
	//ignore
    
	with Pirate
	    {
	    UpdateMorale(-1, -1)
	    }
    
	if irandom(3) == 0
	    {
	    with instance_create(0,0,ConditionTimer)
	        condition = MalariaCrewmate
	    }

	ds_list_add(global.notificationList, "Bugs persist!", "the misquitos continue to swarm the crew, lowering moral!")
	script_execute(closeEventCode, 2)




}
