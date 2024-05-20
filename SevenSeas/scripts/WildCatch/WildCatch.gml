function WildCatch() {
	// safely play

	if !argument0
	    {
	    ds_list_add(global.notificationList, "wild animals on board!", "several rodents avoided capture and climbed onto the ship!")
	    with instance_create(0,0,ConditionTimer)
	            condition = RatsEvent
	    }
	else
	    {
	    if irandom(1)
	        {
	        ds_list_add(global.notificationList, "Monkey caught!", "A monkey was caught, and joins the crew!")
	        ds_list_add(ItemRunner.floatingItems, MakeRandomPetItem(1))
	        }
	    if irandom(0)
	        {
	        ds_list_add(global.notificationList, "Parrot caught!", "A parrot was caught, and joins the crew!")
	        ds_list_add(ItemRunner.floatingItems, MakeRandomPetItem(0))
	        }
		UpdateMorale(1,-1)
	    }

	script_execute(closeEventCode)



}
