function HeatSickness() {
	//rotten planks

	ds_list_add(global.notificationList, "Heat sickness!", "Several crew members were taken by exhaustion!")
	global.moraleBoost = "Heat sickness"

	with Pirate
	    if irandom(1)
	        {
	        if irandom(4) == 0
	            injured = true
	        else
	            myHealth -= 20
            
	        UpdateMorale(-1, -1)
	        }

	instance_destroy()



}
