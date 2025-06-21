/// @description End Clash
// You can write your code in this editor

alarm[0] = irandom_range(room_speed, room_speed*3)

if sailingSail and ds_list_size(global.notificationList) == 0{
	sailingSail = false
	ds_list_add(global.notificationList, result, description)

	if success{
		global.moraleBoost = "crashing rocks"
		UpdateMorale(2, -1)
		UpdateMorale(1, global.DARING)
	
		ds_map_set(MapCreator.seas[2], "conquered", true)
	}

	instance_destroy(Event)
	closeEventCode()
	floatAway = true
	sailing = false
}