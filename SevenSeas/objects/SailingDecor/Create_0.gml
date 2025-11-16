/// @description Pirate Ship Vars

mySound = audio_play_sound(SplashSnd, 0, false)
audio_stop_sound(mySound)

if place_meeting(x,y,SailingDecor)
	instance_destroy()

var decorType = ds_map_create()
decorType[? global.seaNames[0]] = choose(0,1)
decorType[? global.seaNames[1]] = choose(0,2)
decorType[? global.seaNames[2]] = choose(1,3)
decorType[? global.seaNames[3]] = choose(4,1)
decorType[? global.seaNames[4]] = choose(2,5)
decorType[? global.seaNames[5]] = choose(0,1)
decorType[? global.seaNames[6]] = choose(0,1)

image_index = decorType[? global.seaType]
ds_map_destroy(decorType)

image_speed = 0
y = choose(Ship.frontWaves.waveBase, Ship.backWaves.waveBase)
x = room_width + 136/2
floatAway = true
