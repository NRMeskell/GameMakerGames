function FrogKingLeave() {
	ds_list_add(global.notificationList, "Left Tropical Waters!", "The Frog King escorts you to the border of the Tropical Waters before sailing away.")

	pSeaX = MapCreator.mapStart + MapCreator.seaSizeX/2 + ds_map_find_value(MapCreator.seas[0], "x")
	pSeaY = MapCreator.seaSizeY/2 + ds_map_find_value(MapCreator.seas[0], "y")
	tSeaX = MapCreator.mapStart + MapCreator.seaSizeX/2 + ds_map_find_value(MapCreator.seas[1], "x")
	tSeaY = MapCreator.seaSizeY/2 + ds_map_find_value(MapCreator.seas[1], "y")


	with MapShip{
	    path_end()
	    x = (other.pSeaX + other.tSeaX)/2
	    y = (other.pSeaY + other.tSeaY)/2
	    }
    
	with instance_find(LandingSpot, 0){ 
	    if global.inPort
	        with Store
	            event_user(0)
	    with MapShip
	        {
	        //reset islands
	        event_user(0)
	        targetPort = instance_find(LandingSpot, 0)
	        if mp_grid_path(global.mapGrid, sailPath, x, y, targetPort.checkX, targetPort.checkY, true)
	            {                    
	            toPort = true

	            global.portType = targetPort.myIndex
	            global.mapPause = false
                
	            path_start(sailPath, sailSpeed, path_action_stop, false)
	            }
	        //create new islands
	        event_user(1)
	        }
	    }
    
	if FrogKing.myState == "leave"
		FrogKing.myState = "annoyed"
	else
		FrogKing.myState = "leave"

	script_execute(closeEventCode)
}
