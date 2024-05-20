with (MapShip) {
///Stop sailing / create ports

if path_position = 1 and global.inPort = false
{
if toPort = true
    {
    Ship.portSelect = -1
    MapCreator.mapClose = true
    global.inPort = true
    
    with EventDrawer
        instance_destroy()
        
    targetPort.sprite_index = StopSpr
    targetPort.image_index = targetPort.myIndex
    
    //Heal Pirates
    if targetPort.image_index == 1
        {        
        //Fix Ship
        while HasStored(3,1) and (Ship.myHealth != Ship.maxHealth)
            {
            Ship.myHealth += min(50, Ship.maxHealth - Ship.myHealth)
            LoseCargo(3,1)
            }
            
        //Heal Pirates
        with Pirate
            {
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
        if ds_list_size(global.notificationList) == 0 and global.timeCycle != global.timeCycleLength*1/8
            {
            with EventController
                alarm[0] = room_speed/2
            }
        }
        
    with WeatherController
        {
        global.weather = 1
        cloudNumber = cloudNum[global.weather]
        instance_destroy(Cloud)
        repeat(cloudNumber)
            event_user(0)
        }
    
    
    //Create ports if not yet created
    if targetPort.visited
        {
        with targetPort
            {
            for(i=0; i<slotNumber; i++)
                {
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
    else
        {
        with targetPort
            {
            visited = true
            GameStatsController.locationsVisted ++
            
            for(i=0; i<slotNumber; i++)
                {
                if myIndex = 1{
					if i == 0
						getType = choose(TrinketShop, ShipYard)
					else if i == 1
						getType = choose(Tavern)
					else 
						getType = choose(Smithy, Taylors)
                    }
                else
                    getType = Camp

                
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
        
    with SaveGameRunner
        if other.targetPort.image_index == 1 or global.saveType > 0
			event_user(1)
    }
else
    {
    path_speed = 0
    
    }
}
else if path_position != 1 and global.inPort = true
    {
    global.inPort = false
    with DrawPort
        {
        x=-100
        y=-100
        image_speed = 0
        }
    }
    
canSail = true
                        
if !global.doTime
    {
    path_speed = 0
    }
else 
    {
    speedModifier = 1
    if global.weather = 0
        speedModifier *= 0
    if global.weather = 2
        speedModifier *= 0.5
    
    with Pirate
        if myPet.itemPower == "speed bonus" and mySlot.slotType == "wheel"
            other.speedModifier *= 1.25
    
    path_speed = sailSpeed*speedModifier
    }
    
    


}
///Ship Vars

if xPrev != x
    image_xscale = sign(x-xPrev)

xPrev = x

///Tilt

if path_exists(sailPath)
    image_angle = sin(path_position*(path_get_length(sailPath)/20*2*pi))*6
else
    image_angle = 0

///Change levels

global.seaDistance = 10000
for(i=0; i<MapCreator.seaNumber; i++)
    {
    seaX = MapCreator.mapStart + MapCreator.seaSizeX/2 + ds_map_find_value(MapCreator.seas[i], "x")
    seaY = MapCreator.seaSizeY/2 + ds_map_find_value(MapCreator.seas[i], "y")
    if point_distance(x,y,seaX, seaY) < global.seaDistance
        {
        global.seaDistance = point_distance(x,y,seaX, seaY)
        
        tempSeaType = ds_map_find_value(MapCreator.seas[i], "type")
        tempSeaLevel = ds_map_find_value(MapCreator.seas[i], "level")
        }
    }
    
if tempSeaType != global.seaType
    {
    global.seaType = tempSeaType
    global.seaLevel = tempSeaLevel
    ds_list_add(global.notificationList, "entering " + global.seaType + "!", "prepare for new encounters")
    with EventController
        event_user(0)
    with SoundController
        event_user(1)
    }

///Set as Target
mouseOnMapX = (mouse_x - __view_get( e__VW.XPort, 1 ))*MapCreator.zoom + __view_get( e__VW.XView, 1 )
mouseOnMapY = (mouse_y - __view_get( e__VW.YPort, 1 ))*MapCreator.zoom + __view_get( e__VW.YView, 1 )
        
closePort = instance_nearest(mouseOnMapX, mouseOnMapY, LandingSpot)    

if !MapCreator.overPause and !MapCreator.overBoatButton and !MapCreator.overZoomIn and !MapCreator.overZoomOut
with closePort
    {
    overSelf = point_in_circle(other.mouseOnMapX, other.mouseOnMapY, x, y, sprite_get_height(StopSpr)/2) or point_in_circle(window_view_mouse_get_x(1), window_view_mouse_get_y(1), checkX, checkY, sprite_get_height(MapFlavorSpr)/2)
    
    if mouse_check_button_released(mb_left) and (abs(sqrt(power(MapCreator.mouseGrabX - window_view_mouse_get_x(0),2)+sqrt(power(MapCreator.mouseGrabY - window_view_mouse_get_y(0),2)))) < 2) and (MapCreator.onBoat = true or !point_in_circle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), MapCreator.miniX + MapCreator.miniWidth-11, MapCreator.miniY+11, 10))
        {
        if (overSelf and visible)
            {
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
			
			with SaveGameRunner
				event_user(1)
				
            with MapShip
                {
                //reset islands
                event_user(0)
                targetPort = closePort
				for(var num=0; num<instance_number(LandingSpot); num++)
					if instance_find(LandingSpot, num).id == closePort.id 
						targetPortNum = num
						
                if mp_grid_path(global.mapGrid, sailPath, x, y, targetPort.checkX, targetPort.checkY, true)
                    {                    
                    toPort = true

                    global.portType = targetPort.myIndex
                    global.mapPause = false
                        
                    path_start(sailPath, sailSpeed, path_action_stop, false)
                    audio_play_sound(BellSnd, 1, false)
                    }
                //create new islands
                event_user(1)
                }
            }
        }
            
    if overSelf
        {
        drawSize = 1.1
        }
    else
        drawSize = 1
        
    image_yscale = drawSize
    }

