/// @description Insert description here
// You can write your code in this editor
if !global.eventOpen and !instance_exists(Store) and ds_list_size(global.notificationList) == 0 and !instance_exists(CombatRunner){
    floatAway = true
	audio_sound_gain(mySound, 0, 5000)
}

if floatAway and !instance_exists(Store){
	if sink or (sprite_index == SerpentAttackSpr and ds_list_size(global.notificationList) == 0){
		placeY += 0.12 + sinkRate
		sinkRate += 0.005
	}
}

if x < -1000 or y < -100 or x > room_width + 100 or y > room_height + 100
    instance_destroy()