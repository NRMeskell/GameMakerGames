/// @description Vars

mySound = audio_play_sound(EventSplashingSnd, 0, true)
audio_sound_gain(mySound, random(0.5), 0)
audio_sound_pitch(mySound, random_range(1.2, 1.5))
if instance_number(FishEvent) > 5
	audio_stop_sound(mySound)


color[0] = make_color_rgb(155,0,0)
color[1] = make_color_rgb(128,0,0)
color[2] = make_color_rgb(0,44,119)
color[3] = make_colour_rgb(156,156,156)
color[4] = make_color_rgb(43,43,43)
color[5] = make_color_rgb(158,126,2)
color[6] = make_color_rgb(140,0,145)


image_blend = color[irandom(array_length_1d(color)-1)]

x = Ship.drawX + irandom_range(-50, 50)
y = Ship.drawY + irandom_range(30, 50) 
path_start(BirdPath, 1, path_action_restart, false)
path_position = random(1)
image_speed = .1
image_index = irandom(image_number-1)

floatAway = false
flyAwayDir = irandom_range(225, 315)

