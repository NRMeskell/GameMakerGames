/// @description vars
inFront = true
mySound = audio_play_sound(BatSnd, 1, true)
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
alarm[0] = room_speed/2


