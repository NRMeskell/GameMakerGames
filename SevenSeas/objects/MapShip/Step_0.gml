///Set as Target
mouseOnMapX = (mouse_x - __view_get( e__VW.XPort, 1 ))*MapCreator.zoom + __view_get( e__VW.XView, 1 )
mouseOnMapY = (mouse_y - __view_get( e__VW.YPort, 1 ))*MapCreator.zoom + __view_get( e__VW.YView, 1 )

///Stop sailing / create ports

if path_position = 1 and global.inPort = false{
	//Land in Port
	if point_distance(targetPort.checkX, targetPort.checkY, x, y) < 2{
		
		MapCreator.mapClose = true
		global.inPort = true
		global.portType = targetPort.myIndex
    
		with EventDrawer
		    instance_destroy()
        
		targetPort.sprite_index = StopSpr
		targetPort.image_index = targetPort.myIndex
    
		//Land in Town
		if targetPort.image_index == 1{        
		    //Fix Ship
		    while HasStored(3,1) and (Ship.myHealth != Ship.maxHealth){
		        Ship.myHealth += min(50, Ship.maxHealth - Ship.myHealth)
		        LoseCargo(3,1)
		    }
            
		    //Heal Pirates
		    with Pirate{
		        maxHealth = normHealth
		        myHealth = maxHealth
		        injured = false
		    }
			
			with Pirate{
				if myGoal == "leave"{
					ds_list_add(global.notificationList, firstName + " departs!", "They thank the crew for their kindness and ride to land, and depart into the crowd")
					deserter = true
					event_user(2)
				}
			}
		    if ds_list_size(global.notificationList) == 0 and global.timeCycle != global.timeCycleLength*1/8{
		        with EventController alarm[0] = room_speed/2
		    }
		}
        
	    with WeatherController{
	        global.weather = 1
	        cloudNumber = cloudNum[global.weather]
	        instance_destroy(Cloud)
	        repeat(cloudNumber)
	            event_user(0)
	    }
    
    
	    //Create ports if not yet created
	    if targetPort.visited{
	        with targetPort{
	            for(i=0; i<slotNumber; i++){
					instance_activate_object(slotBuild[i])
	                slotBuild[i].x = MapShip.slotX[slotBuild[i].mySlot]
	                slotBuild[i].y = MapShip.slotY[slotBuild[i].mySlot]
	                slotBuild[i].image_speed = 0.2
					with slotBuild[i]
						if object_index != Camp 
							event_user(4)
	            }
	        }
	    }
		//not visited
	    else {
	        with targetPort {
	            visited = true
	            GameStatsController.locationsVisted ++
            
	            for(i=0; i<slotNumber; i++) {
	                if myIndex = 1{
						if i == 0
							getType = choose(TrinketShop, ShipYard)
						else if i == 1
							getType = choose(Tavern)
						else 
							getType = choose(Smithy, Taylors)
	                }
	                else  getType = Camp

	                slotBuild[i] = instance_create(-100, -100, getType)
	                instance_activate_object(slotBuild[i])
	                slotBuild[i].mySlot = i
	                slotBuild[i].myPortType = myIndex
	                slotBuild[i].x = MapShip.slotX[slotBuild[i].mySlot]
	                slotBuild[i].y = MapShip.slotY[slotBuild[i].mySlot]
	                slotBuild[i].image_speed = 0.2
	                if slotBuild[i].object_index = Camp
	                    slotBuild[i].button[2] = slotBuild[i].buttonNames[myIndex]
				}
	        }
	    }
        
		//save game
	    with SaveGameRunner
	        if other.targetPort.image_index == 1 or global.saveType > 0
				event_user(1)
	}
	//not a port (at sea)
	else{
		path_speed = 0
    }
}
    
                        
if !global.doTime{
    path_speed = 0
    }
else 
    {
    sailSpeed = normalSailSpeed
    if global.weather = 0 or global.weather = 2
        sailSpeed = 0
    
    with Pirate
        if myPet.itemPower == "speed bonus" and mySlot.slotType == "wheel"
            other.sailSpeed *= 1.15
			
	sailSpeed *= 1//+(sailSpeedModifier*global.totalRiggingBonus)
    path_speed = sailSpeed
}

viewDistance = normalViewDistance//*(1+viewDistanceModifier*global.totalWheelBonus)


///Ship Vars

if xPrev != x
    image_xscale = sign(x-xPrev)

xPrev = x

///Tilt
image_angle = sin(current_time/1000)*6

///Change levels
tempSeaType = ds_map_find_value(MapCreator.seas[0], "type")
global.seaDistance = 10000
for(i=0; i<MapCreator.seaNumber; i++){
    seaX = MapCreator.mapStart + MapCreator.mapSizeX/2 + ds_map_find_value(MapCreator.seas[i], "x")
    seaY = MapCreator.mapSizeY/2 + ds_map_find_value(MapCreator.seas[i], "y")
    if point_distance(x,y,seaX, seaY) < global.seaDistance {
        global.seaDistance = point_distance(x,y,seaX, seaY)
        
        tempSeaType = ds_map_find_value(MapCreator.seas[i], "type")
        tempSeaLevel = ds_map_find_value(MapCreator.seas[i], "level")
    }
}
    
if tempSeaType != global.seaType{
    global.seaType = tempSeaType
    global.seaLevel = tempSeaLevel
    with instance_create(room_width/2, room_height/2, ConquerPannel){
        event_user(3)
    }
	with EventController
        event_user(0)
    with SoundController
        event_user(1)
}


// check can click
if !MapCreator.overPause and !MapCreator.overBoatButton and !MapCreator.overZoomIn and !MapCreator.overZoomOut{
	//check not dragging
	if mouse_check_button_released(mb_left) and (abs(sqrt(power(MapCreator.mouseGrabX - window_view_mouse_get_x(0),2)+sqrt(power(MapCreator.mouseGrabY - window_view_mouse_get_y(0),2)))) < 2) and (MapCreator.onBoat = true or !point_in_circle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), MapCreator.miniX + MapCreator.miniWidth-11, MapCreator.miniY+11, 10)){
		tryMoveX = 0
		tryMoveY = 0
	
		with LandingSpot{
		    if visible and (point_in_circle(other.mouseOnMapX, other.mouseOnMapY, x, y, sprite_get_height(StopSpr)/2) or point_in_circle(other.mouseOnMapX, other.mouseOnMapY, checkX, checkY, sprite_get_height(MapFlavorSpr)/2)){
				other.tryMoveX = checkX
				other.tryMoveY = checkY
				other.targetPort = id
			}
		}

		if FindPath(sailPath, x, y, tryMoveX, tryMoveY) {
		    with DrawPort{
		        x=-100
		        y=-100
		        image_speed = 0
		    }
			
			moveX = tryMoveX
			moveY = tryMoveY
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
			audio_play_sound(BellSnd, 1, false)
			
			//create new landing Spots
			with targetPort	
				event_user(1)
				
			global.inPort = false
		}
	}
}

with LandingSpot{
	if visible and (point_in_circle(other.mouseOnMapX, other.mouseOnMapY, x, y, sprite_get_height(StopSpr)/2) or point_in_circle(other.mouseOnMapX, other.mouseOnMapY, checkX, checkY, sprite_get_height(MapFlavorSpr)/2))	
		drawSize = 1.1
	else
		drawSize = 1
        
	image_yscale = drawSize
}

