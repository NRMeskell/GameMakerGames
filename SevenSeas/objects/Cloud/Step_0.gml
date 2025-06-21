/// @description Move

if global.doTime
    x += moveSpeed*global.weather

if x > room_width + sprite_get_width(CloudSpr)
    instance_destroy()


