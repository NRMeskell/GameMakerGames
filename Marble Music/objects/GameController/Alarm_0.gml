/// @description Create Convayers
// You can write your code in this editor

instance_create_depth(8, room_height + 10, depth+1, ConvayPlatform)

spawnSide = !spawnSide
alarm[0] = 4*60*game_get_speed(gamespeed_fps)/SoundController.majorBPM