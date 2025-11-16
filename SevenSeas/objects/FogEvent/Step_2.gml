/// @description Insert description here
// You can write your code in this editor

if !global.eventOpen and !instance_exists(Store) and ds_list_size(global.notificationList) == 0 and !instance_exists(CombatRunner)
    floatAway = true
	
if image_alpha < 0.001 and floatAway
    instance_destroy()
	










