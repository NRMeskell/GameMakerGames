function ShortcutMap() {

	if !argument0
	    {
	    ds_list_add(global.notificationList, "Lost!", "the helmsman got lost and accidentally sailed backwards!")
	    with MapShip
	        path_position = max(0.01, path_position - 0.25)
	    with Pirate
	        UpdateMorale(-1, global.KEEN)
	    }
	else
	    {
	    with MapShip
	        path_position = min(1, path_position + 0.25)
	    with Pirate
	        UpdateMorale(1, global.KEEN)
	    ds_list_add(global.notificationList, "Navigated!", "the helmsman used the map well and saved sailing time!")
	    }
    
	script_execute(closeEventCode)




}
