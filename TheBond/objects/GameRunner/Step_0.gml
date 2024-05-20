/// @description Play Music

if !audio_is_playing(Music1) and !audio_is_playing(Music2) and !audio_is_playing(Music3)
    { 
    currentMusic = music[irandom(array_length_1d(music)-1)]
    while currentMusic == lastMusic
        currentMusic = music[irandom(array_length_1d(music)-1)]
        
    audio_play_sound(currentMusic, 1, false)
    lastMusic = currentMusic
    }
    
if room = MenuRoom
    audio_stop_sound(Birds)

///Mouse

if instance_exists(ButtonParent)
    window_set_cursor(cr_default);
else
    window_set_cursor(cr_none);

