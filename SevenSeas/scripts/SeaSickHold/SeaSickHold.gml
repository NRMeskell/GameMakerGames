function SeaSickHold() {
	//swim back

	sickPirates = 0

	with Pirate
	    {
	    if irandom(2) == 0
	        {
	        myHealth -= irandom_range(10,15)
	        UpdateMorale(-1, -1)
	        other.sickPirates ++
	        }
	    }
    
	ds_list_add(global.notificationList, "The crew is very ill!",  string(sickPirates) + "lost health and morale")

	script_execute(closeEventCode, 2)






}
