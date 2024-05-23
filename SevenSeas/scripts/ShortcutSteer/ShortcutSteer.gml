function ShortcutSteer() {

	if !argument0
	    {
	    ds_list_add(global.notificationList, "Crashed!", "the deckhands could not navigate the route, and the ship was damaged!")
	    with Ship
			myHealth -= myHealth div 4
			
	    with Pirate
	        UpdateMorale(-1, global.DARING)
	    }
	else
	    {
	    with MapShip
	        path_position = min(1, path_position + 0.25)
	    with Pirate
	        UpdateMorale(1, global.DARING)
	    ds_list_add(global.notificationList, "Navigated!", "the deckhands steered the ship well and saved sailing time!")
	    }
    
	script_execute(closeEventCode)




}
