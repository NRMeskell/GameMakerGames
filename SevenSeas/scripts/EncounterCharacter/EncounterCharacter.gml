function EncounterCharacter(argument0) {
	with argument0{
		ds_list_clear(locations)
		event_user(0)
	}

	if !global.inPort
	    {
	    var thisEvent = ds_list_find_value(argument0.myEvents, irandom(ds_list_size(argument0.myEvents)-1))
	    script_execute(thisEvent)
	    }
	else
	    {
	    var thisEvent = ds_list_find_value(argument0.myPortEvents, irandom(ds_list_size(argument0.myPortEvents)-1))
	    script_execute(thisEvent)
	    }



}
