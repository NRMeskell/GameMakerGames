function StowawayLetAboard() {
	//interrogate

	result = irandom(10)
	newPirate = CreatePirate(true)

	if newPirate != undefined
		{
		if argument0{
			ds_list_add(global.notificationList, "stowaway agrees!", "The crew are unhappy with this decision, but " + newPirate.name + " joins the crew.")
			with Pirate
			    {
				UpdateMorale(1, global.JOLLY)		
				UpdateMorale(-1, -1)	
			    UpdateMorale(-1, global.FEARSOME)
			    }
			}
		else{
			ds_list_add(global.notificationList, "stowaway declines!", "The stowaway says they only wanted to get out of town, and do not want to join the crew. They will leave at the next port.")
			with newPirate
				myGoal = "leave"
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
