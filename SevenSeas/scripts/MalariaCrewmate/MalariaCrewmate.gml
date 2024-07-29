function MalariaCrewmate() {
	//Malaria

	myPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
	ds_list_add(global.notificationList, "Malaria!", myPirate.name + " got malaria from misquito bites, and has fallen very ill!")
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
