/// @description Weather vars

if instance_number(Cloud) < cloudNumber
    event_user(1)

if room = GameRoom{
	if !global.inPort{
    if global.doTime
        weatherTimer -= 1+(global.seaType==global.seaNames[2])
    }
    
	if weatherTimer <= 0{
		
	    if global.weather = 0
	        global.weather += 1
	    else if global.weather = 2
	        global.weather -= 1
	    else
	        global.weather += choose(-1,1)
    
	    if global.weather = 0
	        {
	        ds_list_add(global.notificationList, "The seas be still!", "not a gust of wind blows.")
	        weatherTimer = irandom_range(room_speed*10, room_speed*30)
	        }
	    else if global.weather = 1
	        {
	        ds_list_add(global.notificationList, "The seas be nice!", "perfect weather for sailing.")
	        weatherTimer = random_range(room_speed*60*2, room_speed*60*6)
			}
	    else if global.weather = 2
	        {
	        ds_list_add(global.notificationList, "The seas be rough!", "prepare for stormy weather!")
	        weatherTimer = irandom_range(room_speed*10, room_speed*30)
	        }
        
	    cloudNumber = cloudNum[global.weather]
	    instance_destroy(Cloud)
	    repeat(cloudNumber)
	        event_user(0)
    }
}

if global.weather != 2 and audio_is_playing(myWind){
	audio_stop_sound(StormSnd)
	audio_stop_sound(myWind)
}
if global.weather ==2 and !audio_is_playing(myWind){
	audio_play_sound(StormSnd, 0, true)
	myWind = audio_play_sound(HowlingWindSnd, 0, true)
}
        


