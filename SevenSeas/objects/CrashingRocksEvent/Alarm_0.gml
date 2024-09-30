/// @description Start Crashing
// You can write your code in this editor


mySound = audio_play_sound(CrashingRocksSnd, 1, false)
audio_sound_gain(mySound, x/(room_width/2), 0)

alarm[1] = room_speed
image_speed = 16/60
image_index = 4