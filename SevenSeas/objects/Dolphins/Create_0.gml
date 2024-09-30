/// @description Vars

mySound = audio_play_sound(SplashSnd, 0, false)
audio_stop_sound(mySound)

spinSpeed = random_range(0.8, 1.2) * 2
image_angle = irandom(360)
image_speed = 0.2
x = Ship.drawX + irandom_range(-50, 50) - 25
y = Ship.drawY + irandom_range(10, 30) 
floatAway = false

