/// @description Load Game Settings
// You can write your code in this editor

if file_exists("GameSettings"){
	ini_open("GameSettings")
	global.gameDiff = ini_read_real("Gameplay", "diff", 1.0);
	global.saveType = ini_read_real("Gameplay", "saving", 2.0);
	global.masterVolume = ini_read_real("Sound", "master", 0.5);
	global.musicVolume = ini_read_real("Sound", "music", 0.5);
	global.worldVolume = ini_read_real("Sound", "world", 0.5);
	global.lighting = ini_read_real("Graphics", "lighting", 2.0);
	global.modernRes = ini_read_real("Graphics", "resolution", 1.0);
	global.usePirateFont = ini_read_real("Graphics", "font", 1.0);
	ini_close()
}
else{
	global.gameDiff = 1;
	global.saveType = 2;
	global.masterVolume = 0.5;
	global.musicVolume = 0.5;
	global.worldVolume = 0.5;
	global.lighting = 2;
	global.modernRes = true;
	global.usePirateFont = true;
}

