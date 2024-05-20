/// @description Load Ladnigng Spots
function LoadLandingSpots(argument0) {
	ini_open(argument0 + "-MapLandingFile.txt")

	for(n=0; n<instance_number(LandingSpot); n++){
	    myLanding = instance_find(LandingSpot, n)
    
	    myLanding.x = ini_read_real("Landing " + string(n), "x", myLanding.x)
	    myLanding.y = ini_read_real("Landing " + string(n), "y", myLanding.y)
	    myLanding.checkX = ini_read_real("Landing " +  string(n), "checkX", myLanding.checkX)
	    myLanding.checkY = ini_read_real("Landing " +  string(n), "checkY", myLanding.checkY)
	    myLanding.visited = ini_read_real("Landing " +  string(n), "visited", myLanding.visited)
	    myLanding.myIndex = ini_read_real("Landing " +  string(n), "myIndex", myLanding.myIndex)
    
	    if myLanding.visited or myLanding.myIndex == 1
	        myLanding.image_index = myLanding.myIndex
	    }

	with MapShip{
	    targetPort = instance_find(LandingSpot, ini_read_real("Ship", "Target", 0))
	    global.portType = targetPort.myIndex
	    event_user(0)
	    global.inPort = true
	    x = ini_read_real("Ship", "x", targetPort.checkX)
	    y = ini_read_real("Ship", "y", targetPort.checkY)
		
	    mp_grid_path(global.mapGrid, sailPath, x, y, targetPort.checkX, targetPort.checkY, true)
	    path_start(sailPath, sailSpeed, path_action_stop, false) 
	    
		if abs(x - targetPort.checkX) < 5 and abs(y - targetPort.checkY) < 5
			path_position = 1
		else
			path_position = 0
	    toPort = true
	    event_user(1)
	    }
		
	ini_close()

}
