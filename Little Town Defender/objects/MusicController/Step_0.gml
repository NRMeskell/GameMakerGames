/// @description Menu Room

MusicTime = room_speed * 60 * random_range(0.5, 1.5)

alarm[0] = MusicTime

if room = Menu
if !audio_is_playing(MenuMusic)
    {
    MySound = MenuMusic
        
    audio_play_sound(MySound, 1, false)
    audio_stop_sound(GameMusic1)
    audio_stop_sound(GameMusic2)
    audio_stop_sound(GameMusic3)
    audio_stop_sound(DragonMusic)
    }

///Game Room

MusicTime = room_speed * 60 * random_range(0.5, 1.5)

alarm[0] = MusicTime

if !instance_exists(Dragon)
if !instance_exists(DragonDeath)
if room = GameMap1
if !audio_is_playing(GameMusic1) and !audio_is_playing(GameMusic2) and !audio_is_playing(GameMusic3)
    {
    audio_stop_sound(MenuMusic)
    MySound = GameMusic1
    
    if MySound = GameMusic1
        MySound = choose(GameMusic2, GameMusic3)
    else
        {
        if MySound = GameMusic2
            MySound = choose(GameMusic1, GameMusic3)
        else
            if MySound = GameMusic3
                MySound = choose(GameMusic1, GameMusic2)
        }
        
    audio_play_sound(MySound, 1, false)
    }
    
if instance_exists(Dragon)
if instance_exists(DragonDeath)
if !audio_is_playing(DragonMusic)
    {
    audio_stop_sound(MenuMusic)
    audio_play_sound(DragonMusic, 1, false)
    }

///Volumes

if global.SaveVol = true
    {
    ini_open("Volume.ini");
    global.MusicVolume = ini_read_real( "VolumeLevel", "MusicVolume", global.MusicVolume);
    global.SoundVolume = ini_read_real( "VolumeLevel", "SoundVolume", global.SoundVolume);
    ini_close()
    }

//Music
audio_sound_gain(GameMusic1, global.MusicVolume*2, 0)
audio_sound_gain(GameMusic2, global.MusicVolume*2, 0)
audio_sound_gain(GameMusic3, global.MusicVolume*2, 0)
audio_sound_gain(MenuMusic, global.MusicVolume*2, 0)
audio_sound_gain(DragonMusic, global.MusicVolume*2, 0)

//Sounds
audio_sound_gain(Hammering, global.SoundVolume, 0)
audio_sound_gain(Axe, global.SoundVolume, 0)
audio_sound_gain(PickAxe, global.SoundVolume*0.6, 0)
audio_sound_gain(EnemyArrive, global.SoundVolume, 0)
audio_sound_gain(PlacingBuilding, global.SoundVolume, 0)
audio_sound_gain(GongSnd, global.SoundVolume, 0)
audio_sound_gain(DingSnd, global.SoundVolume*0.8, 0)
audio_sound_gain(ArrowSnd, global.SoundVolume*0.4, 0)
audio_sound_gain(MagicSnd, global.SoundVolume*0.6, 0)

