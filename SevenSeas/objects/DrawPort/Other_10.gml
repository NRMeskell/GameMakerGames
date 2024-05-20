/// @description Vars

overButton = false
currentHeight = 0
scrollSpeed = 10

for(i=0; i<buttonNumber; i++)
    {
    overMenuButton[i] = false
    }
    
myOpenSound = audio_play_sound(SlidingOpenSnd, 1, false)
//myCloseSound = audio_play_sound(SlidingClosedSnd, 1, false)

audio_pause_sound(myOpenSound)
//audio_pause_sound(myCloseSound)

