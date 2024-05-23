/// @description Weather vars

if instance_number(Cloud) < cloudNumber
    event_user(1)

if room = GameRoom{
	if !global.inPort{
    Ship.rockScale = 0.1 + power(global.weather, 1.4)*0.4
    if global.doTime
        weatherTimer -= 1
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
        weatherTimer = irandom_range(room_speed*60*5, room_speed*60*15)
        }
    else if global.weather = 2
        {
        ds_list_add(global.notificationList, "The seas be rough!", "prepair for stormy weather!")
        weatherTimer = irandom_range(room_speed*10, room_speed*30)
        }
        
    cloudNumber = cloudNum[global.weather]
    instance_destroy(Cloud)
    repeat(cloudNumber)
        event_user(0)
    }
}
        


