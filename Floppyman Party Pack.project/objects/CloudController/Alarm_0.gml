/// @description Make Clouds

alarm[0] = random_range(0.5, 2)*60*(15 - 5*(global.gameMode == "golf" or room=BlimpGameRoom))/global.timeDiff

instance_create(room_width + 300, random_range(room_height*0.15, room_height*(0.5+0.25*(global.gameMode == "golf" or room=BlimpGameRoom))), Cloud)

if room_get_name(room) = "BlimpGameRoom"
    if random(1) < 0.4
        with instance_create(room_width + 500, random(room_height), Cloud)
            {
            sprite_index = BigCloudSpr
            depth = -100
            myspeed *= 2
            }

