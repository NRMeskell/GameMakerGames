function WildScare() {
	//Dont let play

	if argument0
	    {
	    ds_list_add(global.notificationList, "scared away", "the animals scurry away, leaving the ship and crew unharmed.")
	    with Pirate
	        UpdateMorale(1, global.FEARSOME)
	    }
	else    
	    {
	    ds_list_add(global.notificationList, "annoyed vendor!", "the owner is annoyed you scared her animals, and makes you help her round them up")
	    with Pirate{
	        UpdateMorale(-1, -1)
	        UpdateMorale(1, global.JOLLY)
	        }
	    }

	script_execute(closeEventCode)







}
