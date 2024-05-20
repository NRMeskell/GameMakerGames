function ManOverboardRope() {
	//guide back

	if !argument0
	    {
	    pirateOverboard.myHealth = 0
	    ds_list_add(global.notificationList, pirateOverboard.name + " could not find the rope!", "In their search, they forget to swim for the ship and disappear under the waves.") 
	    }
	else
	    {
	    ds_list_add(global.notificationList, pirateOverboard.name + " made it back safely!", "They suffered no injures, other than a little shock and cold.") 
	    }

	script_execute(closeEventCode, 2)
}
