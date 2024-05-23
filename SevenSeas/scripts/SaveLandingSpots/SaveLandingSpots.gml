/// @description sea surface reading
function SaveLandingSpots(argument0) {
	ini_open(argument0 + "-MapLandingFile.txt");
	
	myTargetNumber = -1
	for(i=0; i<instance_number(LandingSpot); i++){
	    myTarget = instance_find(LandingSpot, i)
	    if MapShip.targetPort.id == myTarget.id{
	        myTargetNumber = i
	        }
	    }

	ini_write_real("Ship", "Target", string(myTargetNumber)+chr(10))
	ini_write_real("Ship", "x", MapShip.x)
	ini_write_real("Ship", "y", MapShip.y)


	for(n=0; n<instance_number(LandingSpot); n++){
	    myLanding = instance_find(LandingSpot, n)
		ini_write_real("Landing " +string(n), "x", myLanding.x)
		ini_write_real("Landing " +string(n), "y", myLanding.y)
		ini_write_real("Landing " +string(n), "checkX", myLanding.checkX)
		ini_write_real("Landing " +string(n), "checkY", myLanding.checkY)
		ini_write_real("Landing " +string(n), "visited", myLanding.visited)
		ini_write_real("Landing " +string(n), "myIndex", myLanding.myIndex)
		ini_write_real("Landing " +string(n), "visible", myLanding.visible)
		}
    
	ini_close()

	with MapCreator{
		sprite_save(MapCreator.seenBackground, 0, argument0 + "-MapSeenFile.png");
		event_user(2)
	}
}
