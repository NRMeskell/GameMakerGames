/// @description Save Buildings
function SaveBuildings(argument0) {

	ini_open(argument0 + "\\BuildingFile.ini")
	for(var sn=0; sn<instance_number(LandingSpot); sn++){
	    var myLanding = instance_find(LandingSpot, sn)
	    for(var bn=0; bn<3; bn++){ 
	        var curB = myLanding.slotBuild[bn]
	        if curB == undefined{
				ini_write_string("LS" + string(sn), "building" + string(bn), "none")
			}else{
	            if curB.object_index == Camp
	                ini_write_string("LS" + string(sn), "building" + string(bn), curB.myName)
	            else
	                ini_write_string("LS" + string(sn), "building" + string(bn), object_get_name(curB.object_index))
			}
	    }
	}
}
