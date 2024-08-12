function OasisAction() {
	//Get Treasure

	global.moraleBoost = "swimming"

	if irandom(3) == 0
	    {
	    with Pirate
	        {
	        myHealth -= irandom_range(10,20)
	        }
		ds_list_add(global.notificationList, "fish attack!", "tropical fish were able to surprise and attack the crew!")
		}
	else if irandom(1) == 0
	    {
	    with Pirate
	        {
	        UpdateMorale(1, -1)
	        UpdateMorale(1, global.JOLLY)
	        }
		ds_list_add(global.notificationList, "beautiful swim!", "the crew had a grand time and gained moral")
	    }
	else
	    {
		crewTarget = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	    with crewTarget
	        {
			UpdateMorale(2, -1)
			maxHealth += 20
			myHealth += 20
		}
        
	    ds_list_add(global.notificationList, "magical swim!", "the mystical clear water seems to have strengthed " + crewTarget.firstName + ", and increased their maximum health!")
	    }
}
