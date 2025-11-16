/// @description Rock Events

if ds_list_size(global.notificationList) == 0{
	if myState == "unmet"{
		myState = "still"
		myVar = 0
		ds_list_add(locations, global.seaNames[4]);
		UpdateCharacterEvents(VolcanoRumbling);
		UpdateCharacterPortEvents();
	}else{
		if myVar < 2{
		UpdateCharacterEvents(VolcanoRumbling);
		}else{
			UpdateCharacterEvents(VolcanoErupting);
		}
	}
}
else{
	alarm[0] = 10
}
