/// @description Load Game

if file_exists(LoadFile)
    {
    game_load(LoadFile)
    
    ini_open("Volume.ini");
    ini_write_real( "VolumeLevel", "MusicVolume", global.MusicVolume);
    ini_write_real( "VolumeLevel", "SoundVolume", global.SoundVolume);
    ini_close()
    }

