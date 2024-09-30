/// @description Insert description here
// You can write your code in this editor

mySound = audio_play_sound(SplashSnd, 0, false)
audio_stop_sound(mySound)

if instance_number(TikiOffer) > 1
	instance_destroy()
	
animate = 0
goAway = false





