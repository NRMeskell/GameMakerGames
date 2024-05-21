/// @description Eating Time

if alarm[0] < 1{
	if global.doTime and !global.inPort
	    {
	    global.foodQuality -= 0.00015
	    }
    
	mealTime = !(global.inPort and global.portType == 1) and ((sunriseMeal and global.timeCycle < global.timeCycleLength div 2) or (!sunriseMeal and global.timeCycle > global.timeCycleLength div 2))
	
	if mealTime{
		ReduceReputation()
		
		sunriseMeal = !sunriseMeal
		payCount += 1
	
		if !HasStored(4, instance_number(Pirate))
	        {
	        ds_list_add(global.notificationList, "Meal Time!", "There be insufficent food! Unfed crew loses morale and health.")
	        }
	    else
	        {
	        if round(global.foodQuality) == 3
	            ds_list_add(global.notificationList, "Meal Time!", "The crew loves the meal, and gains moral!")
	        else if round(global.foodQuality) == 2
	            ds_list_add(global.notificationList, "Meal Time!", "The crew enjoys the meal, and gains moral!")
	        else if round(global.foodQuality) == 1
	            ds_list_add(global.notificationList, "Meal Time!", "The crew is unimpressed with the meal.")
	        else
	            ds_list_add(global.notificationList, "Meal Time!", "The crew dislikes the meal, and loses moral.")
	        }	
	
	    global.moraleBoost = "meal"
	    for(pirateCount=0; pirateCount<instance_number(Pirate); pirateCount++)
	        {
	        if HasStored(4,1)
	            {
	            LoseCargo(4,1)
	            currentFedPirate = instance_find(Pirate, pirateCount)
	            with currentFedPirate
	                UpdateMorale(round(global.foodQuality-1),-1)
	            }
	        else
	            {
	            currentFedPirate = instance_find(Pirate, pirateCount)
	            with currentFedPirate
	                {
	                UpdateMorale(-2,-1)
	                myHealth -= myHealth*1/2
	                }
	            }
	        }
	    }
}