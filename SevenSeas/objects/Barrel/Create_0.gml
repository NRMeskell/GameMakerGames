/// @description Vars

//audio_play_sound(SplashSnd, 0, false)
mySound = audio_play_sound(EventSplashingSnd, 0, true)
if instance_number(Barrel) > 1
	audio_stop_sound(mySound)

image_speed = 0
image_index = choose(1,0)

placeX = 0
floatAway = false

myLight = noone

image_angle = irandom_range(-10,10)

