/// @description Vars

mySound = audio_play_sound(SplashSnd, 0, false)
audio_stop_sound(mySound)

myLight = noone

myLayer = 3
x = Ship.drawX + irandom_range(-55, 15)
y = Ship.drawY - irandom_range(40, 75) 
path_start(BirdPath, 0.5, path_action_restart, false)
path_position = random(1)
image_speed = .1
image_index = irandom(image_number-1)
image_alpha = 0.5
floatAway = false
flyAwayDir = irandom_range(45, 135)

