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
		myLanding.visible = ini_read_real("Landing " +  string(n), "visible", false)
	    if myLanding.visited or myLanding.myIndex == 1
	        myLanding.image_index = myLanding.myIndex
	    }

	with MapShip{
	    targetPort = instance_find(LandingSpot, ini_read_real("Ship", "Target", 0))
	    moveX = ini_read_real("Ship", "moveX", MapShip.x)
		moveX = ini_read_real("Ship", "moveY", MapShip.y)
		global.portType = targetPort.myIndex
	    event_user(0)
	    global.inPort = false
	    x = ini_read_real("Ship", "x", targetPort.checkX)
	    y = ini_read_real("Ship", "y", targetPort.checkY)
		if point_distance(x,y,targetPort.checkX, targetPort.checkY) < 1{
			global.inPort = true;
		}
		else if mp_grid_path(global.mapGrid, sailPath, x, y, moveX, moveY, true){

			if global.inPort{
				with Ship
					animate = 0
			    with Store
			        event_user(0)
					
				if global.portType == 1{
					global.timeCycle = global.timeCycleLength/16
					FoodTimer.sunriseMeal = false
				}
			}
				
			//reset islands (for background drawing)
			event_user(0)
			
			//start sailing
			global.mapPause = false
			path_start(sailPath, sailSpeed, path_action_stop, false)				
			global.inPort = false
		}
		
	    toPort = true
	    event_user(1)
	    }
		
	ini_close()

}
