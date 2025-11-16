/// @description Float away
// You can write your code in this editor


if !global.eventOpen and !instance_exists(Store) and ds_list_size(global.notificationList) == 0 and !instance_exists(CombatRunner){
    floatAway = true
	path_end()
}

if floatAway and !instance_exists(Store){
	x -= (Ship.middleWaves.waveSpeeds[0]/2)*!global.mapPause*max(1, global.doTime*global.gameRate)
}
