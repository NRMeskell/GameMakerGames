function OasisAction() {
	//Get Treasure

	global.moraleBoost = "swimming"

	if irandom(campPower + global.pirateNum[global.FEARSOME]) == 0
	    {
	    with Pirate
	        {
	        myHealth -= irandom_range(10,20)
	        }
		ds_list_add(global.notificationList, "fish attack!", "tropical fish were able to surprise and attack the crew!")
		}
	else if irandom(2 + global.pirateNum[global.DARING]) = 0
	    {
	    with Pirate
	        {
	        UpdateMorale(other.campPower-1, -1)
	        UpdateMorale(1, global.JOLLY)
	        }
		ds_list_add(global.notificationList, "beautiful swim!", "the crew had a grand time and gained moral")
	    }
	else
	    {
	    with Pirate
	        {
	        UpdateMorale(1, -1)
	        UpdateMorale(1, global.KEEN)
			if irandom(1){
				maxHealth += 15
				myHealth += 15
			}
		}
        
	    ds_list_add(global.notificationList, "magical swim!", "the mystical clear water seems to have strengthed some of the crew!")
	    }
}
