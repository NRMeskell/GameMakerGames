function TrainingAllow() {
	with Pirate{
	    UpdateMorale(-1,global.JOLLY)
	    UpdateMorale(1,global.FEARSOME)
	    }

	if irandom(3) == 0
	    {
	    injuredMember = instance_find(Pirate, irandom(instance_number(Pirate)))
	    ds_list_add(global.notificationList, "Injured Crew Member!", injuredMember.name + " was injured, and the training was halted.")
	    injuredMember.myHealth -= (injuredMember.maxHealth div 4)
	    }
	else if irandom(1)
	    {
	    pirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	    training = choose("swordsmanship", "gunmanship")
	    ds_list_add(global.notificationList, "hardened crew!", "the crew trains hard, and " + pirate.name + " improved their " + training + "!")
    
	    with pirate
	        {
	        if other.training == "swordsmanship"
	            stat[0] ++
	        else
	            stat[1] ++
	        }
	    }
	else{
	    ds_list_add(global.notificationList, "tired crew!", "the crew trains hard and gain comradery!")
	    with Pirate{
	        UpdateMorale(1, global.FEARSOME)
	        UpdateMorale(1, global.DARING)
	        UpdateMorale(1, global.JOLLY)
	        }
	    }



}