function DrinksFree() {
	// safely play
	if argument0 or searchReputationType("repute")[0] > 2
	    {
	    with Pirate{
	        UpdateMorale(1,-1)
	        UpdateMorale(1, global.JOLLY)
	        }
    
	    ds_list_add(global.notificationList, "persuaded!")
		if searchReputationType("repute")[0] > 2
			ds_list_add(global.notificationList, "having heard stories of your " + searchReputationType("repute")[1] + ", the stand proudly offers free drinks!")
		else
			ds_list_add(global.notificationList, "the stand-runner was convinced to give free drinks, and the crew gains morale!")
		
		}
	else
	    {
		if searchReputationType("fear")<=2{
		    with Pirate{
		        UpdateMorale(-1,-1)
		        UpdateMorale(-1, global.JOLLY)
		        }
			
		    ds_list_add(global.notificationList, "insulted!", "the stand-runner loudly refuses your request, making a scene and embarrassing the crew!")
		    }
		else if irandom(searchReputationType("fear")[0]) > 2{
			ds_list_add(global.notificationList, "the stand-runner, recalling stories of your " + searchReputationType("fear")[1] + ", timidly offers free drinks before closing shop.")
			}
		AddReputation("repute", -1, "drink-stand demands")
		}

	script_execute(closeEventCode)



}
