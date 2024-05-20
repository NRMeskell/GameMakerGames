function ManOverboardSwim() {
	//swim back

	result = irandom(10)
	if result < 2
	    {
	    ds_list_add(global.notificationList, pirateOverboard.name + " did not make it back!", "they now be sleeping with the fishes.")
	    with pirateOverboard
	        {
	        injured = true
	        myHealth = 0
	        }
	    }
	else if result < 7
	    {
	    with pirateOverboard
	        {
	        UpdateMorale(-2, -1) 
	        UpdateMorale(1, global.DARING)
	        }
	    if pirateOverboard.myHealth < 1 and pirateOverboard.injured == true
	        ds_list_add(global.notificationList, pirateOverboard.name + " did not make it back!", "they now be sleeping with the fishes.") 
	    ds_list_add(global.notificationList, pirateOverboard.name + " made it back!", "They be hurt while swimming back.") 
	    }
	else
	    {
	    with pirateOverboard
	        LoseRandomItem()
	    ds_list_add(global.notificationList, pirateOverboard.name + " made it back safely!", "They suffered no injures, but dropped their " + lostItem + "!") 
	    }

	script_execute(closeEventCode, 2)





}
