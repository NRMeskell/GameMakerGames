function CookAllow() {
	if sign(irandom(2))
	    {
	    ds_list_add(global.notificationList, "great recipe!", "the recipe is superb, and improved the food quality on board!")
	    with Pirate
	        {
	        UpdateMorale(1, global.JOLLY)
	        }
	    global.foodQuality = min(global.foodQuality + 1, 3)
	    }
	else
	    {
	    ds_list_add(global.notificationList, "horrible recipe!", "the recipe is awful, and lowered the food quality on board.")
	    with Pirate
	        {
	        UpdateMorale(-1, global.JOLLY)
	        }
        
	    global.foodQuality = max(global.foodQuality - 1, 0)
	    }



}
