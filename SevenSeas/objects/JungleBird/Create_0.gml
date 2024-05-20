/// @description vars

inFront = true
mySound = audio_play_sound(JungleBirdSnd, 1, true)
audio_sound_set_track_position(mySound, irandom(1))
audio_sound_gain(mySound, 0, 0)

if irandom(2) == 0
    {
    direction = irandom_range(110, 180)
    speed = random_range(1,2)
    image_speed = 0.2
    image_alpha = 1
    audio_sound_gain(mySound, 0.5, 0)
    audio_sound_gain(mySound, 0.01, 5000)
    }
else
    {
    image_alpha = 0
    }
    

image_index = irandom(3)
color[0] = make_color_rgb(155,0,0)
color[1] = make_color_rgb(128,0,0)
color[2] = make_color_rgb(0,44,119)
color[3] = make_colour_rgb(156,156,156)
color[4] = make_color_rgb(43,43,43)
color[5] = make_color_rgb(158,126,2)
color[6] = make_color_rgb(140,0,145)
image_blend = color[irandom(array_length_1d(color)-1)]
alarm[0] = room_speed/2


