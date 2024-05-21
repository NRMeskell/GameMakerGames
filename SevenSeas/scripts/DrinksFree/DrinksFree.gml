function DrinksFree() {
	// safely play
	if argument0
	    {
	    with Pirate{
	        UpdateMorale(1,-1)
	        UpdateMorale(1, global.JOLLY)
	        }
    
	    ds_list_add(global.notificationList, "persuaded!")
		ds_list_add(global.notificationList, "the stand-runner was convinced to give free drinks, and the crew gains morale!")
		
		}
	else
	    {
		 with Pirate{
		        UpdateMorale(-1,-1)
		        UpdateMorale(-1, global.JOLLY)
		        }
			
		ds_list_add(global.notificationList, "insulted!", "the stand-runner loudly refuses your request, making a scene and embarrassing the crew!")
		}

	script_execute(closeEventCode)



}
