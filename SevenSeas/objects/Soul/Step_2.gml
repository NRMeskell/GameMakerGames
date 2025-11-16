/// @description float away

if !global.eventOpen and !instance_exists(Store) and ds_list_size(global.notificationList) == 0 and !instance_exists(CombatRunner){
    floatAway = true
	audio_sound_gain(mySound, 0, 5000)
}


if x < -1000 or y < -100 or x > room_width + 100 or y > room_height + 100
    instance_destroy()

if path_position > 0.8
	instance_destroy()