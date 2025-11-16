/// @description Switch Weather
// You can write your code in this editor

if global.weather = 0
	global.weather += 1
else if global.weather = 2
	global.weather -= 1
else
	global.weather += choose(-1,1)
    
if global.weather = 0
	{
	ds_list_add(global.notificationList, "The seas be still!", "not a gust of wind blows.")
	//weatherTimer = irandom_range(room_speed*10, room_speed*30)
	}
else if global.weather = 1
	{
	ds_list_add(global.notificationList, "The seas be nice!", "perfect weather for sailing.")
	//weatherTimer = random_range(room_speed*60*2, room_speed*60*6)
	}
else if global.weather = 2
	{
	ds_list_add(global.notificationList, "The seas be rough!", "prepare for stormy weather!")
	//weatherTimer = irandom_range(room_speed*10, room_speed*30)
	}
        
cloudNumber = cloudNum[global.weather]
instance_destroy(Cloud)
repeat(cloudNumber)
	event_user(0)