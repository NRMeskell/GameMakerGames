function StrangeOpen() {
	//run away

	result = irandom(3)
    
	if result < 3
	    {
	    ds_list_add(global.notificationList, "The container was filled with rats!", "They swarm out and disappear below deck!")
	    with instance_create(0,0,ConditionTimer)
	        condition = RatsEvent
	    }
	else if result == 3
	    {
	    petType = irandom(1)
	    ds_list_add(ItemRunner.floatingItems, MakeRandomPetItem(petType))
	    if petType
	        petName = "monkey"
	    else
	        petName = "parrot"
        
	    ds_list_add(global.notificationList, petName + " inside!", "it jumps out the barrel and joins the crew!") 
	    
		
		}
	audio_stop_sound(ScratchingSnd)
	script_execute(closeEventCode, 2)

}
