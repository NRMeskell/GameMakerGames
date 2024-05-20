function ManOverboardSave() {
	//guide back

	if !argument0
	    {
	    pirateOverboard.myHealth = 0
	    ds_list_add(global.notificationList, pirateOverboard.name + " hit by the ship!", "They disappear beneath the hull, and do not emerge from under the waves.") 
	    }
	else
	    {
	    ds_list_add(global.notificationList, pirateOverboard.name + " made it back safely!", "They suffered no injures, other than a little shock and cold.") 
	    }

	script_execute(closeEventCode, 2)
}
