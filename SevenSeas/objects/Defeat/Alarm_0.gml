/// @description End old music

for(i=0; i<ds_list_size(SoundController.seaMusic); i++){
    if audio_is_playing(ds_map_find_value(ds_list_find_value(SoundController.seaMusic, i), global.seaType))
        audio_stop_sound(ds_map_find_value(ds_list_find_value(SoundController.seaMusic, i), global.seaType))
    }  
    
audio_is_playing(ds_map_find_value(SoundController.combatMusicMap, global.seaType))
    audio_stop_sound(ds_map_find_value(SoundController.combatMusicMap, global.seaType))
    
audio_is_playing(ds_map_find_value(SoundController.portMusicMap, global.seaType))
    audio_stop_sound(ds_map_find_value(SoundController.portMusicMap, global.seaType))
        

///start music

audio_play_sound(DefeatMusicSnd, 1, false)

