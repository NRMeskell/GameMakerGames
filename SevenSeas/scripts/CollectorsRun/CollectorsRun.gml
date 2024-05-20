function CollectorsRun() {
	//engage
	
	AddReputation("patrol", -5, "escape from the cove patrol")
	with CoveCollector
		myState = "chase"

	if argument0
	    {
	    ds_list_add(global.notificationList, "Caught!", "the Patrol did not take kindly to the escape attempt!")
	    with instance_create(0, 0, EnemyCollectors){
	        pirateMoved = true
	        playerTurn = false
	        event_user(0)
	        }
	    instance_destroy(EventDrawer)
	    }
	else
	    {
	    ds_list_add(global.notificationList, "Escaped!", "the Patrol could not catch up!")    
		with EventDrawer
			floatAway = true
	    }
       
	script_execute(closeEventCode, 2)







}
