function EncounterCharacterPort(argument0) {
	var thisEvent = ds_list_find_value(argument0.myPortEvents, irandom(ds_list_size(argument0.myPortEvents)-1))
	script_execute(thisEvent)



}
