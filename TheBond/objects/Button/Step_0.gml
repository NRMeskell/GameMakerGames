/// @description Flip Switch

if place_meeting(x,y,SpiritParent) and switchable
    {
    event_user(1)
    image_index = 1
    audio_play_sound(ButtonSnd, 1, false)
    switchable = false
    }

if !place_meeting(x,y,SpiritParent) and !switchable
    {
    event_user(1)
    image_index = 0
    audio_play_sound(ButtonReleaseSnd, 1, false)
    switchable = true
    }

