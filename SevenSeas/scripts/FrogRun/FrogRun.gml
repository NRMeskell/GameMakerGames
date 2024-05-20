function FrogRun() {
	//run away

	if argument0
	    {
	    with ShipEvent
	        {
	        runAway = true
	        floatAway = true
	        }
	    ds_list_add(global.notificationList, "Escaped!", "the tropical ship was unable to keep up!")
	    }
	else
	    {
	    script_execute(FrogAttack)
		ds_list_add(global.notificationList, "Caught!", "The ship catches up, and opens fire!")
	    }

	script_execute(closeEventCode, 2)







}
