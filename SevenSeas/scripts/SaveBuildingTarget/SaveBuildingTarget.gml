/// @description Save Buildings
function SaveBuildingTarget(argument0) {

	ini_open(argument0 + "-BuildingFile.ini")
	myLanding = MapShip.targetPort.id
	for(n=0; n<3; n++){ 
	    curB = myLanding.slotBuild[n]
	    if curB != undefined{
	        if curB.object_index == Camp
	            ini_write_string("LS" + string(i), "building" + string(n), curB.myName)
	        else
	            ini_write_string("LS" + string(i), "building" + string(n), object_get_name(curB.object_index))
	    }
	    else
	        ini_write_string("LS" + string(i), "building" + string(n), "none")
	}



}
