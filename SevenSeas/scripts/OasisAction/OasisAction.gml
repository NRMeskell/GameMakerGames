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
		crewTarget = RandomPirate()
	    with crewTarget
	        {
			UpdateMorale(2, -1)
			maxHealth += 10
			myHealth += maxHealth
		}
        
	    ds_list_add(global.notificationList, "magical swim!", "the mystical clear water seems to have strengthened " + crewTarget.firstName + ", and increased their maximum health!")
	    }
}
