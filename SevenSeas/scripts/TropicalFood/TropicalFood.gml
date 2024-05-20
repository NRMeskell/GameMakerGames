function TropicalFood() {
	//intimidate

	with Pirate
	    UpdateMorale(1, global.JOLLY)
    
	ds_list_add(global.notificationList, "Crew well fed", "The crew is nourished and morale is raised!") 
    

	script_execute(closeEventCode, 2)



}
