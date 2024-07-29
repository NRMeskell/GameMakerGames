function HeatSickness() {
	//rotten planks

	ds_list_add(global.notificationList, "Heat sickness!", "Several crew members were taken by exhaustion!")
	global.moraleBoost = "Heat sickness"

	with Pirate
	    if irandom(1)
	        {
	        myHealth -= 20
            
	        UpdateMorale(-1, -1)
	        }

	instance_destroy()



}
