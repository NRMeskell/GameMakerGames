/// @description Play Music

endMusic = false
endCampSound = false

if room = GameRoom and !instance_exists(Defeat) and alarm[0] < 1 and alarm[1] < 1
    {
    if global.inPort == true and global.portType == 1 {
        if !audio_is_playing(ds_map_find_value(portMusicMap, global.seaType)) {
            newCurrentSong = audio_play_sound(ds_map_find_value(portMusicMap, global.seaType), 0, true)
            endMusic = true
        }
    }
	else if global.inPort == true and global.portType != 1 {
        if !audio_is_playing(ds_map_find_value(campMusicMap, global.seaType)) {
            newCurrentSong = audio_play_sound(ds_map_find_value(campMusicMap, global.seaType), 0, true)
            endMusic = true
        }
    }
    else if instance_exists(CombatRunner) {
        if !audio_is_playing(ds_map_find_value(combatMusicMap, global.seaType)) {
            newCurrentSong = audio_play_sound(ds_map_find_value(combatMusicMap, global.seaType), 0, true)
            endMusic = true
        }
    }
    else if !global.inPort and global.weather != 0 {
        playSong = true
        for(i=0; i<ds_list_size(seaMusic); i++)
            if audio_is_playing(ds_map_find_value(ds_list_find_value(seaMusic, i), global.seaType))
                playSong = false
            
        if playSong {
            newCurrentSong = audio_play_sound(ds_map_find_value(ds_list_find_value(seaMusic, irandom(ds_list_size(seaMusic)-1)), global.seaType), 1, false)
            endMusic = true
        }
    }
	else{
		endMusic = true
	}
    
	//play camping sounds
	if global.inPort {
		if global.portType == 1 and !audio_is_playing(SeagullsPortSnd){
			seaBirds = audio_play_sound(SeagullsPortSnd, 2, true)
		}
		if global.portType != 1 and !audio_is_playing(currentCampingSound){
			currentCampingSound = audio_play_sound(campSound[global.portType], 1, true)
			audio_sound_gain(currentCampingSound, 0, 0)
			audio_sound_gain(currentCampingSound, 1, 500)
			seaBirds = audio_play_sound(SeagullsSnd, 2, true)
		}
	}
	else{
		endCampSound = true
	}
}
    
if endMusic
    {
    audio_sound_gain(currentSong, 0, 1000)
    oldSong = currentSong
    currentSong = newCurrentSong
    endMusic = false
    alarm[0] = room_speed
    }
	
if endCampSound {
	audio_sound_gain(currentCampingSound, 0, 500)
	audio_sound_gain(seaBirds, 0, 500)
	audio_stop_sound(CampFireSnd)
	endCampSound = true
	alarm[1] = room_speed/2
}
    
//event_user(0)

