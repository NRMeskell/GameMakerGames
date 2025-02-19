/// @description Load Buildings
function LoadBuildings(argument0) {

	instance_destroy(LandFlavor)
	instance_destroy(DrawPort)

	for(i=0; i<instance_number(LandingSpot); i++){
	    myLanding = instance_find(LandingSpot, i)
	    ini_open(argument0 + "\\BuildingFile.ini")
	    for(n=0; n<3; n++){ 
	        //garbage collection
	        if myLanding.slotBuild[n] != undefined
	            instance_destroy(myLanding.slotBuild[n])
        
	        //load new buildings
	        buildingType = ini_read_string("LS" + string(i), "building" + string(n), "none");
	        if buildingType = "none"{
	            myLanding.slotBuild[n] = undefined
	            }
	        else{
	            if buildingType = "camp"{
	                myLanding.slotBuild[n] = instance_create(0,0,Camp)
					with myLanding.slotBuild[n]{
	                    sprite_index = CampFireSpr
	                    }
	                }
	            else if buildingType = "used camp"{
	                myLanding.slotBuild[n] = instance_create(0,0,Camp)
	                with myLanding.slotBuild[n]{
	                    sprite_index = CampFireDyingSpr
	                    }
	                }
				else if buildingType = "dead camp"{
	                myLanding.slotBuild[n] = instance_create(0,0,Camp)
	                with myLanding.slotBuild[n]{
	                    sprite_index = CampFireDeadSpr
	                    }
	                }
	            else{
					if buildingType == "Taylors"
						buildingType = "Tailors"
	                myLanding.slotBuild[n] = instance_create(0,0,asset_get_index(buildingType))
	                with myLanding.slotBuild[n] 
	                    event_user(5)
	            }
            
	            myLanding.slotBuild[n].mySlot = n
	            myLanding.slotBuild[n].myPortType = myLanding.myIndex
	            myLanding.slotBuild[n].x = -100
	            myLanding.slotBuild[n].y = -100
	            myLanding.slotBuild[n].image_speed = 0.2
	            if myLanding.slotBuild[n].object_index = Camp
	                myLanding.slotBuild[n].button[2] = myLanding.slotBuild[n].buttonNames[myLanding.myIndex]
	        }
	    }
	}

	with MapShip if point_distance(x,y,targetPort.checkX, targetPort.checkY) < 1{
	    for(i=0; i<3; i++){
	        if targetPort.slotBuild[i] != undefined{
	            targetPort.slotBuild[i].x = MapShip.slotX[targetPort.slotBuild[i].mySlot]
	            targetPort.slotBuild[i].y = MapShip.slotY[targetPort.slotBuild[i].mySlot]
	        }
	    }
	}




}
