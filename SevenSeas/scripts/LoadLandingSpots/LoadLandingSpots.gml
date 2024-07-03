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
		myLanding.myIndex = ini_read_real("Landing " +string(n), "myIndex", myLanding.myIndex)
	    if myLanding.visited or myLanding.myIndex == 1
	        myLanding.image_index = myLanding.myIndex
	    }

	with MapShip{
	    targetPort = instance_find(LandingSpot, ini_read_real("Ship", "Target", 0))
		global.portType = targetPort.myIndex
	    event_user(0)
	    global.inPort = false
	    x = ini_read_real("Ship", "x", targetPort.checkX)
	    y = ini_read_real("Ship", "y", targetPort.checkY)
		moveX = x
		moveY = y
		if point_distance(x,y,targetPort.checkX, targetPort.checkY) < 1{
			global.inPort = true;
		}
		
	    toPort = true
	    event_user(1)
	}
		
	ini_close()

}
