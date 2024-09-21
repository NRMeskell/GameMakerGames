/// @description Activate

waiting = false
if x != -40 and mySound != undefined and mySound != noone 
    {
    myActualSound = audio_play_sound(mySound, 1, false)
    audio_sound_pitch(myActualSound, random_range(lowRange, highRange))   
    }
        
if changeZones == true{
    alarm[4] = ((room_speed*2)/moveSpeed)
    CombatRunner.closeRange = (CombatRunner.closeRange == false)
    }
else
    alarm[4] = room_speed/2

