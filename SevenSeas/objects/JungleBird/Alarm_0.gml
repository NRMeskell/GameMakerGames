/// @description Move bird-like

if irandom(1) or image_alpha = 1
    {
    direction = irandom_range(45, 135)
    speed = 2
    image_alpha = 1
    if audio_sound_get_gain(mySound) == 0
        {
        audio_sound_gain(mySound, 0.5, 0)
        audio_sound_gain(mySound, 0.01, 5000)
        }
    }
    
if y < -20
    instance_destroy()
    
alarm[0] = room_speed



