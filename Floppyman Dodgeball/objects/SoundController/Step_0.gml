/// @description Music Controller

if !is_undefined(ds_map_find_value(musicMap, room))
    stageMusic = ds_map_find_value(musicMap, room)
else if global.gameMode == "golf"
    stageMusic = GolfMapMusic

if !audio_is_playing(stageMusic)
    {
    audio_stop_all()
    audio_play_sound(stageMusic, 2, true)
    currentRoom = room
    }

///Sound Effects

if instance_exists(Chicken)
    {
    if !audio_is_playing(ChickenSound)
        audio_play_sound(ChickenSound,1,false, 0.6)
    }
else   
    audio_stop_sound(ChickenSound)

///Birds Sound

if !CharacterCreator.inMenu and global.gameMode == "golf"{
    if !audio_is_playing(BirdsSound)
        audio_play_sound(BirdsSound, 1, true)
    }
else{
    audio_stop_sound(BirdsSound)
    }


