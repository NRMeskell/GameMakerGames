/// @description Load Buildings
function LoadBuildings(argument0) {

	instance_destroy(LandFlavor)
	instance_destroy(DrawPort)

	for(var ls=0; ls<instance_number(LandingSpot); ls++){
	    var myLanding = instance_find(LandingSpot, ls)
	    ini_open(argument0 + "\\BuildingFile.ini")
	    for(var bn=0; bn<3; bn++){ 
	        //garbage collection
	        if myLanding.slotBuild[bn] != undefined{
	            instance_destroy(myLanding.slotBuild[bn])
				myLanding.slotBuild[bn] = undefined
			}
        
	        //load new buildings
	        var buildingType = ini_read_string("LS" + string(ls), "building" + string(bn), "none");
	        if buildingType = "none"{
	            myLanding.slotBuild[bn] = undefined
	            }
	        else{
	            if buildingType = "camp"{
	                myLanding.slotBuild[bn] = instance_create(0,0,Camp)
					with myLanding.slotBuild[bn]{
	                    sprite_index = CampFireSpr
	                    }
	                }
	            else if buildingType = "used camp"{
	                myLanding.slotBuild[bn] = instance_create(0,0,Camp)
	                with myLanding.slotBuild[bn]{
	                    sprite_index = CampFireDyingSpr
	                    }
	                }
				else if buildingType = "dead camp"{
	                myLanding.slotBuild[bn] = instance_create(0,0,Camp)
	                with myLanding.slotBuild[bn]{
	                    sprite_index = CampFireDeadSpr
	                    }
	                }
	            else{
					if buildingType == "Taylors"
						buildingType = "Tailors"
	                myLanding.slotBuild[bn] = instance_create(0,0,asset_get_index(buildingType))
	                with myLanding.slotBuild[bn] 
	                    event_user(5)
	            }
            
	            myLanding.slotBuild[bn].mySlot = bn
	            myLanding.slotBuild[bn].myPortType = myLanding.myIndex
	            myLanding.slotBuild[bn].x = -100
	            myLanding.slotBuild[bn].y = -100
	            myLanding.slotBuild[bn].image_speed = 0.2
	            if myLanding.slotBuild[bn].object_index = Camp
	                myLanding.slotBuild[bn].button[2] = myLanding.slotBuild[bn].buttonNames[myLanding.myIndex]
	        }
	    }
	}

	// activate landing spots if at port
	with MapShip if point_distance(x,y,targetPort.checkX, targetPort.checkY) < 1{
	    for(var bn=0; bn<3; bn++){
	        if targetPort.slotBuild[bn] != undefined{
	            targetPort.slotBuild[bn].x = MapShip.slotX[targetPort.slotBuild[bn].mySlot]
	            targetPort.slotBuild[bn].y = MapShip.slotY[targetPort.slotBuild[bn].mySlot]
	        }
	    }
	}




}
