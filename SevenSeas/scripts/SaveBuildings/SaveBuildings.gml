/// @description Save Buildings
function SaveBuildings(argument0) {

	ini_open(argument0 + "\\BuildingFile.ini")
	for(i=0; i<instance_number(LandingSpot); i++){
	    myLanding = instance_find(LandingSpot, i)
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




}
