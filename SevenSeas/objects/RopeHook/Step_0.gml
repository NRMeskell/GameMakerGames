/// @description Loop Animation

if round(image_index) = image_number -1
    image_index = 58
    
if round(image_index) = 4
    if !audio_is_playing(RopeSwingSnd)
        audio_play_sound(RopeSwingSnd, 1, false)
        
if round(image_index) = 30
    if !audio_is_playing(RopeHookSnd)
        audio_play_sound(RopeHookSnd, 1, false)
        
if round(image_index) = 47
    if !audio_is_playing(RopeHookSnd)
        {
        mySound = audio_play_sound(RopeHookSnd, 1, false)
        audio_sound_pitch(mySound, 0.8)
        }

image_speed = 0.2