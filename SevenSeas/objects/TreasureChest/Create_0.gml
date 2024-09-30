/// @description vars

mySound = audio_play_sound(SplashSnd, 0, false)
audio_stop_sound(mySound)

image_speed = 0.2
image_index = 0
if instance_find(TreasureChest, 0) == id
	audio_play_sound(DiggingSnd, 1, false)
animationLen = image_number - 1
treasureFound = false
