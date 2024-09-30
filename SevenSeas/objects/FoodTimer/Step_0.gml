/// @description Eating Time

if alarm[0] < 1{
	
	if global.doTime and !global.inPort
	    {
	    global.foodQuality -= 0.00015
	    }
    
	mealTime = !(global.inPort and global.portType == 1) and ((sunriseMeal and global.timeCycle < global.timeCycleLength div 2) or (!sunriseMeal and global.timeCycle > global.timeCycleLength div 2))
	
	//check if Pirates are cursed
	var cursedPirates = 0
	for(var i=0; i<instance_number(Pirate); i++){
		var checkPirate = instance_find(Pirate, i)
		if checkPirate.body == sprite_get_number(PirateManSkinSpr) -1{
			cursedPirates ++;
			break;
		}
		if string_starts_with(checkPirate.myShirt.itemName, "Cursed"){
			cursedPirates ++;
			break;
		}
		if string_starts_with(checkPirate.myHat.itemName, "Cursed"){
			cursedPirates ++;
			break;
		}
		if string_starts_with(checkPirate.myPants.itemName, "Cursed"){
			cursedPirates ++;
			break;
		}
	}
	
	
	if mealTime{
		sunriseMeal = !sunriseMeal
	
		if !HasStored(4, instance_number(Pirate) - cursedPirates)
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
	    for(var pirateCount=0; pirateCount<instance_number(Pirate); pirateCount++)
	        {
			checkPirate = instance_find(Pirate, pirateCount)
				
			var currentCursed = false;
			if (checkPirate.body == sprite_get_number(PirateManSkinSpr)-1) or string_starts_with(checkPirate.myHat.itemName, "Cursed") or string_starts_with(checkPirate.myShirt.itemName, "Cursed") or string_starts_with(checkPirate.myPants.itemName, "Cursed")
				currentCursed = true
				
	        if HasStored(4,1) and !currentCursed
	            {
	            LoseCargo(4,1)
	            with checkPirate
	                UpdateMorale(round(global.foodQuality-1),-1)
	            }
	        else
	            {
	            with checkPirate
	                {
	                UpdateMorale(-2,-1)
	                myHealth -= myHealth*1/2
	                }
	            }
	        }
	    }
}