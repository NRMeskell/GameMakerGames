function ManOverboardSwim() {
		
	if pirateOverboard.myHealth > 0{
		result = irandom(10)
		if result < 7
		    {
		    with pirateOverboard
		        {
		        UpdateMorale(-2, -1) 
		        UpdateMorale(1, global.DARING)
		        }
		    ds_list_add(global.notificationList, pirateOverboard.name + " made it back!", "They swim safely back, but it takes a toll on them.") 
		    }
		else
		    {
		    with pirateOverboard
		        LoseRandomItem()
		    ds_list_add(global.notificationList, pirateOverboard.name + " made it back safely!", "The swim hurt them, and they dropped their " + lostItem + "!") 
		    }

		script_execute(closeEventCode, 2)
	}
}
