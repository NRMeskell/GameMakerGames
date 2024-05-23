/// @description Agree cheats
function StarsMappingAllow() {

	if sign(irandom(2))
	    {
	    ds_list_add(global.notificationList, "stars mapped!", myPirate.firstName + " mapped the stars, helping the ship along its course")
	    with MapShip
	        path_position = min(1, path_position + 0.25)
	    }
	else
	    {
	    itemsLost = LoseRandomCargo(irandom(2) + global.seaLevel)
	    ds_list_add(global.notificationList, "equipment lost!", myPirate.firstName + " knocked some equipment and cargo overboard:#" + itemsLost) 
	    }



}
