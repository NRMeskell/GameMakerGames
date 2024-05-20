function RatsEvent() {
	//Rats

	foodEaten = min(irandom_range(1,2*(global.seaLevel+1)), CargoAmount(4))

	if irandom(2) == 0
	    {
	    ds_list_add(global.notificationList, "Rats caught on board!", "they ate " + string(foodEaten) + " food before the crew was able to kill some of them")
	    timer = room_speed*random_range(1,5)
    
	    LoseCargo(4, foodEaten)
	    }
	else
	    {
	    if irandom(10) == 0
	        {
	        ds_list_add(global.notificationList, "Monkey caught on board!", "A monkey was found hiding with rats and will join the crew!")
	        ds_list_add(ItemRunner.floatingItems, MakeRandomPetItem(1))
	        global.moraleBoost = "monkey caught"
	        with Pirate
	        UpdateMorale(1, global.JOLLY)
	        }
	    else
	        {
	        ds_list_add(global.notificationList, "Rats caught on board!", "they ate " + string(foodEaten) + " food before the crew was able to kill them all")
	        LoseCargo(4, foodEaten)
	        }
        
	    if object_index = ConditionTimer
	        instance_destroy()
	    }
    



}
