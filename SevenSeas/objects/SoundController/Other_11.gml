/// @description Switch sailing song

//find song type
currentSongMap = undefined
for(i=0; i<ds_list_size(seaMusic); i++)
    {
    currentMap = ds_list_find_value(seaMusic, i)
    for (k = ds_map_find_first(currentMap); !is_undefined(k); k = ds_map_find_next(currentMap, k)) 
        {
        if audio_is_playing(currentMap[? k])
            currentSongMap = currentMap
        }
    }
    
//replace song
if currentSongMap != undefined
    {
    myPlace = audio_sound_get_track_position(currentSong)
    audio_stop_sound(currentSong)
    currentSong = audio_play_sound(currentSongMap[? global.seaType], 1, false)
    audio_sound_set_track_position(currentSong, myPlace) 
    }


