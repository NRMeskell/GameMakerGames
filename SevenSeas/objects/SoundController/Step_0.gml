/// @description Play Music

endMusic = false

if room = GameRoom and !instance_exists(Defeat)
    {
    if global.inPort == true and global.portType == 1
        {
        if !audio_is_playing(ds_map_find_value(portMusicMap, global.seaType))
            {
            newCurrentSong = audio_play_sound(ds_map_find_value(portMusicMap, global.seaType), 0, true)
            endMusic = true
            }
        }
    else if instance_exists(CombatRunner)
        {
        if !audio_is_playing(ds_map_find_value(combatMusicMap, global.seaType))
            {
            newCurrentSong = audio_play_sound(ds_map_find_value(combatMusicMap, global.seaType), 0, true)
            endMusic = true
            }
        }
    else
        {
        playSong = true
        for(i=0; i<ds_list_size(seaMusic); i++)
            if audio_is_playing(ds_map_find_value(ds_list_find_value(seaMusic, i), global.seaType))
                playSong = false
            
        if playSong
            {
            newCurrentSong = audio_play_sound(ds_map_find_value(ds_list_find_value(seaMusic, irandom(ds_list_size(seaMusic)-1)), global.seaType), 1, false)
            endMusic = true
            }
        }
    
    }
    
if endMusic = true
    {
    audio_sound_gain(currentSong, 0, 1000)
    oldSong = currentSong
    currentSong = newCurrentSong
    endMusic = false
    alarm[0] = room_speed
    }
    
//event_user(0)

