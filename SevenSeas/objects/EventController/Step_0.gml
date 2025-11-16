/// @description Control Events

if room == GameRoom{
if global.doTime and !global.inPort and MapShip.path_position < 0.95 and MapShip.path_position > 0.05
    {
    eventTimer -= 1
	if (eventTimer div 1) mod room_speed == 0
		with LandingSpot
			event_user(0)
    }
 

global.eventOpen = false
if eventTimer <= 0 or instance_exists(Event)
	global.eventOpen = true

if eventTimer <= 0 
    {
	event_user(0)
    eventTimer = ((random_range(1,2)*eventTimeAmount)/global.gameRate) div 1
    
	// Volcano Events
	if Volcano.myState == "erupting" and global.seaType == global.seaNames[4]{
		script_execute(choose(VolcanoErupting, VolcanoErupting, VolcanoEnding))
	}
    //calm events
    else if global.weather == 1
        {
        eventType = choose("Special Event", "Special Event", "Character", "Character", "Ambush", "Request", "Request", "Medical")
        if irandom(49) = 0{
			eventType = "Weather"
		}
		
		var needsHelp = RandomPirate().myHealth < (global.seaLevel+1)*12 or Ship.myHealth < (global.seaLevel+1)*30
		if eventType != "Medical" and needsHelp and irandom(1) == 0
			eventType = choose("Medical", "Medical", "Request")
		
		if eventType == "Request" and instance_number(Pirate) < 2
			eventType = choose("Special Event", "Character")
		
		//Events
		if eventType == "Medical"{
			GetNewMedicalEvent()
		}
        else if eventType == "Event"{
            event_user(1)
            }
        //Requests
        else if eventType == "Request"{
            //get pirate
			requestPirate = RandomPirate()
			currentRequest = requestLists[requestPirate.myMainPer][irandom(array_length(requestLists[requestPirate.myMainPer])-1)]
			//choose request 
			script_execute(currentRequest, requestPirate)  
			}
        //Special Events
        else if eventType == "Special Event"{
            script_execute(ds_list_find_value(ds_map_find_value(specialEventMap, global.seaType), irandom(ds_list_size(ds_map_find_value(specialEventMap, global.seaType))-1)))
            }
        //Character Encounters
        else if eventType == "Character"{
            GetNewCharacterEncounter()
            }
		else if eventType == "Weather"{
            SwitchWeather()
            }
        //Ambush and enemy arrive
        else{
            //getSeaNumber
            currentSeaNumber = -1
            for(i=0; i<MapCreator.seaNumber; i++)
                if ds_map_find_value(MapCreator.seas[i], "type") = global.seaType
                    currentSeaNumber = i
            
			if currentSeaNumber != 4{
	            if ds_map_find_value(MapCreator.seas[currentSeaNumber], "enemy seen") == true
	                script_execute(Ambushed)
	            else {
	                script_execute(ds_map_find_value(EventController.enemySeenMap, global.seaType))
	                ds_map_replace(MapCreator.seas[currentSeaNumber], "enemy seen", true)
	            }
			}else{
				// Dont have ambushes in Volcanic Waters
				EncounterCharacter(Volcano)
			}
        }
    }
    else if global.weather == 0
        {
        script_execute(ds_list_find_value(stillEventList, irandom(ds_list_size(stillEventList)-1)))
        }
    else
        {
        script_execute(ds_list_find_value(roughEventList, irandom(ds_list_size(roughEventList)-1)))
        }
    }
}

