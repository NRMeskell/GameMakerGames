/// @description Vars

mySound = audio_play_sound(SplashSnd, 0, false)
audio_stop_sound(mySound)

x = Ship.drawX + irandom_range(-100, 100)
y = Ship.drawY + irandom_range(0, -100) 
path_start(BirdPath, 0.1, path_action_restart, false)
path_position = random(1)
image_speed = 0
image_index = irandom(image_number-1)
floatAway = false
flyAwayDir = irandom_range(45, 135)

inFront = choose(true, true, false)
alphaShift = irandom(1000000)
image_alpha = random(0.5)+0.25

