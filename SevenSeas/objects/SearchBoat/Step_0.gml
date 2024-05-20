/// @description Insert description here
// You can write your code in this editor

x += 0.75*(2*rowingRight-1)
y = GetWaterLevel(Ship.middleWaves, x)

while !audio_is_playing(PaddleSnd)
	mySound = audio_play_sound(PaddleSnd, 1, false)

if x < Ship.drawX
	instance_destroy()






