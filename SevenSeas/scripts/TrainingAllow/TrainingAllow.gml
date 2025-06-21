function TrainingAllow() {
	with Pirate{
	    UpdateMorale(-1,global.JOLLY)
	    UpdateMorale(1,global.FEARSOME)
	    }

	if irandom(3) == 0
	    {
	    injuredMember = RandomPirate()
	    ds_list_add(global.notificationList, "Injured Crew Member!", injuredMember.name + " was injured, and the training was halted.")
	    UpdateHealth(injuredMember,  -injuredMember.maxHealth div 4)
	    }
	else if irandom(1)
	    {
	    pirate = RandomPirate()
	    ds_list_add(global.notificationList, "hardened crew!", "the crew trains hard, and " + pirate.name + " improved their maximum health!")
    
	    with pirate
	        {
	        maxHealth = (maxHealth*1.2) div 1
			myHealth = (myHealth*1.2) div 1
	        }
	    }
	else{
	    ds_list_add(global.notificationList, "tired crew!", "the crew trains hard and gain camaraderie!")
	    with Pirate{
	        UpdateMorale(1, global.FEARSOME)
	        UpdateMorale(1, global.DARING)
	        UpdateMorale(1, global.JOLLY)
	        }
	    }



}
