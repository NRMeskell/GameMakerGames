/// @description Move

if global.doTime
    x += Clock.timeSpeed*moveSpeed*global.weather

if x > room_width + sprite_get_width(CloudSpr)
    instance_destroy()


