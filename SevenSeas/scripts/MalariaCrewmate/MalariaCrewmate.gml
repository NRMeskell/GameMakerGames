function MalariaCrewmate() {
	//Malaria

	myPirate = RandomPirate()
	ds_list_add(global.notificationList, "Malaria!", myPirate.name + " got malaria from mosquito bites, and has fallen very ill!")
	global.moraleBoost = "Malaria"
	with myPirate
	    {
	    // if injured != true
	        //injured = true
	    myHealth -= 25
	    UpdateMorale(-2, -1)
	    }
    
   
	instance_destroy()
    



}
