/// @description Vars

//audio_play_sound(SplashSnd, 0, false)
mySound = audio_play_sound(TurtleSnd, 0, true)
if instance_number(Barrel) > 1
	audio_stop_sound(mySound)

image_speed = 0.2

placeX = 80
placeY = 0
floatAway = false
sink = false
sinkRate = 0
myLight[0] = noone
myLight[1] = noone

