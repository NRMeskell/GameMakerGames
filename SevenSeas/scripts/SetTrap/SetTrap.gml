function SetTrap() {
	//Rats

	if irandom(2) == 0
	    {
	    ds_list_add(global.notificationList, "Rats caught on board!", "rats were caught outside the container, and the strangers noises stop.")
	    instance_destroy()
	    }
	else
	    {
	    petType = irandom(1)
	    ds_list_add(ItemRunner.floatingItems, MakeRandomPetItem(petType))
    
	    if petType
	        petName = "monkey"
	    else
	        petName = "parrot"
        
	    ds_list_add(global.notificationList, petName + " caught on board!", "A monkey caught outside the container! After being freed, it joins the crew.")
	    global.moraleBoost = petName + " caught"
	    with Pirate
	        UpdateMorale(1, global.JOLLY)
	    }
    



}
