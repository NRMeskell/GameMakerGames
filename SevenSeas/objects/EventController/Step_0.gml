/// @description Control Events

if room == GameRoom{
if global.doTime and !global.inPort and MapShip.path_position < 0.98
    {
    eventTimer -= 1
    }
    
if eventTimer <= 0 
    {
    eventTimer = random_range(1,2)*eventTimeAmount
    
    //calm events
    if global.weather == 1
        {
        eventType = choose("Special Event", "Special Event", "Special Event", "Character", "Ambush", "Request")
        if eventType == "Request" and instance_number(Pirate) < 2
			eventType = choose("Special Event", "Character")
		
		//Events
        if eventType == "Event"{
            event_user(1)
            //chosenEvent = ds_list_find_value(normalEventList, irandom(ds_list_size(normalEventList)-1))
            //script_execute(chosenEvent)
            }
        //Requests
        else if eventType == "Request"{
            //get pirate
			requestPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
			
			//choose request 
			currentRequest = ds_list_find_value(requestPirate.myRequestList, irandom(ds_list_size(requestPirate.myRequestList)-1))
			script_execute(currentRequest, requestPirate)  
			
			//update pirate requests
			if irandom(ds_list_size(requestPirate.myRequestList)) <= 3
				addNum = irandom(2)
			else
				addNum = irandom_range(3, array_length(requestLists[requestPirate.myMainPer])-1)
	
			ds_list_add(requestPirate.myRequestList, requestLists[requestPirate.myMainPer][addNum])
            }
        //Special Events
        else if eventType == "Special Event"{
            script_execute(ds_list_find_value(ds_map_find_value(specialEventMap, global.seaType), irandom(ds_list_size(ds_map_find_value(specialEventMap, global.seaType))-1)))
            }
        //Character Encounters
        else if eventType == "Character"{
            GetNewCharacterEncounter()
            }
        //Ambush and enemy arrive
        else{
            avoidAmbush = false
            with Pirate
                if myPet.itemPower = "avoid" and mySlot.slotType = "rigging"
                    avoidAmbush = true
                    
            if avoidAmbush and irandom(1)
                ds_list_add(global.notificationList, "ambush avoided!", "an enemy was spotted with a spyglass and confrontation be avoided!")
            else
                {
                //getSeaNumber
                currentSeaNumber = -1
                for(i=0; i<MapCreator.seaNumber; i++)
                    if ds_map_find_value(MapCreator.seas[i], "type") = global.seaType
                        currentSeaNumber = i
            
                if ds_map_find_value(MapCreator.seas[currentSeaNumber], "enemy seen") == true
                    script_execute(Ambushed)
                else
                    {
                    script_execute(ds_map_find_value(EventController.enemySeenMap, global.seaType))
                    ds_map_replace(MapCreator.seas[currentSeaNumber], "enemy seen", true)
                    }
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

