function StowawayFlog() {
	//Let aboard
	newPirate = CreatePirate(true)
    
	if newPirate != undefined
	    {	
	    ds_list_add(global.notificationList, "The stowaway is punished!", newPirate.name + " is flogged and loses morale and health, but is allowed to say on the ship until you land at port.")
	    with newPirate
	        {
	        UpdateMorale(-3, -1)
	        UpdateMorale(1, global.FEARSOME)
			myGoal = "leave"
	        }
	    with Pirate
	        {
	        UpdateMorale(2, global.FEARSOME)
	        }
	    }
	else
	    {
	    ds_list_add(global.notificationList, "No room on board!", "the stowaway is forced to walk the plank.")
	    with Pirate
	        {
	        UpdateMorale(1, global.FEARSOME)
	        }
	    }
    
	script_execute(closeEventCode)






}
