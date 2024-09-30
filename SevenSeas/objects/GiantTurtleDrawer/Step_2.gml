/// @description Float away
// You can write your code in this editor

if !instance_exists(Event) and !instance_exists(Store) and ds_list_size(global.notificationList) == 0 and !instance_exists(CombatRunner){
	floatAway = true
	audio_sound_gain(mySound, 0, 2000)
}
	
if x < -1000 or y < -1000 or x > room_width + 1000 or y > room_height + 1000
    instance_destroy()



