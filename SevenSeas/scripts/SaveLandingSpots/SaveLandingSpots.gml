/// @description sea surface reading
function SaveLandingSpots(argument0) {
	ini_open(argument0 + "\\MapLandingFile.txt");
	
	var myTargetNumber = -1

	for(var n=0; n<instance_number(LandingSpot); n++){
	    var myLanding = instance_find(LandingSpot, n)
		ini_write_real("Landing " +string(n), "x", myLanding.x)
		ini_write_real("Landing " +string(n), "y", myLanding.y)
		ini_write_real("Landing " +string(n), "checkX", myLanding.checkX)
		ini_write_real("Landing " +string(n), "checkY", myLanding.checkY)
		ini_write_real("Landing " +string(n), "visited", myLanding.visited)
		ini_write_real("Landing " +string(n), "myIndex", myLanding.myIndex)
		ini_write_string("Landing " +string(n), "mySeaType", myLanding.myIslandType)
		
		if MapShip.targetPort.id == myLanding.id{
	        myTargetNumber = n
	    }
		}
		
	ini_write_real("Ship", "Target", string(myTargetNumber)+chr(10))
	ini_write_real("Ship", "x", MapShip.x)
	ini_write_real("Ship", "y", MapShip.y)
	ini_write_real("Ship", "moveX", MapShip.moveX)
	ini_write_real("Ship", "moveY", MapShip.moveY)

    
	ini_close()
	//surface_save(MapCreator.seenSurface, argument0 + "\\MapSeenFile.png");
	
}
