function ManOverboardSave() {
	//guide back

	if !argument0
	    {
	    pirateOverboard.myHealth = 0
	    ds_list_add(global.notificationList, pirateOverboard.name + " smashes into the ship!", "A large wave drags them under the hull, and they disappear from view.") 
	    }
	else
	    {
	    ds_list_add(global.notificationList, pirateOverboard.name + " made it back safely!", "They suffered no injures, other than a little shock and cold.") 
	    }

	script_execute(closeEventCode, 2)
}
