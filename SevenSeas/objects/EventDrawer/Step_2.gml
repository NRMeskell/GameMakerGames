/// @description float away

if !instance_exists(Event) and !instance_exists(Store) and ds_list_size(global.notificationList) == 0 and !instance_exists(CombatRunner){
    floatAway = true
	audio_sound_gain(mySound, 0, 5000)
}

if floatAway and !instance_exists(Store){
	placeX -= (Ship.middleWaves.waveSpeeds[0]/2)*!global.mapPause*max(1, global.doTime*global.gameRate)
}

if x < -1000 or y < -100 or x > room_width + 100 or y > room_height + 100
    instance_destroy()

