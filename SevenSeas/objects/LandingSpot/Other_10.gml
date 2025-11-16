/// @description Reset Fire
// You can write your code in this editor

//check to see if visited landing spot
if sprite_index == StopSpr {
	// make random recovery
	if irandom(60) == 0{
		for(var i=0; i<3; i++) if instance_exists(slotBuild[i]){
			instance_activate_object(slotBuild[i])
				with slotBuild[i]
					event_user(5)
			instance_deactivate_object(slotBuild[i])
		}
	}
}