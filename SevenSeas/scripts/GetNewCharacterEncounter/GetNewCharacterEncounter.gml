function GetNewCharacterEncounter() {
	with EventController
	    {
	    chars = ds_list_create()
    
	    if !global.inPort
	        {
	        with CharacterParent{
	            if ds_list_find_index(locations, global.seaType) != -1 and ds_list_size(myEvents) > 0{
	                ds_list_add(other.chars, id)
	                }
	            }
        
	        if ds_list_size(chars) > 0
	            {
	            EncounterCharacter(ds_list_find_value(chars, irandom(ds_list_size(chars)-1)))
	            }
	        else
	            script_execute(ds_list_find_value(ds_map_find_value(specialEventMap, global.seaType), irandom(ds_list_size(ds_map_find_value(specialEventMap, global.seaType))-1)))
	        }
	    else
	        {
	        with CharacterParent
	            if ds_list_find_index(locations, global.seaType) != -1 and ds_list_size(myPortEvents) > 0
	                ds_list_add(other.chars, id)
        
	        if ds_list_size(chars) > 0
	            EncounterCharacter(ds_list_find_value(chars, irandom(ds_list_size(chars)-1)))
	        else
	            with EventController
	                alarm[0] = 1
	        }
	    }




}
