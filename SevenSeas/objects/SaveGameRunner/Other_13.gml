/// @description Load Game Settings

if file_exists("GameSettings"){
	ini_open("GameSettings")
	global.gameRate = ini_read_real("Gameplay", "sailing", 1);
	global.combatRate = ini_read_real("Gameplay", "combat", 1);
	global.skipCamp = ini_read_real("Gameplay", "camping", false);
	
	global.eventDiffBase = ini_read_real("Difficulty", "event diff", 1);
	global.saveType = ini_read_real("Difficulty", "saving", 2);
	global.lootDrop = ini_read_real("Difficulty", "loot", 1);
	global.enemyDiff = ini_read_real("Difficulty", "enemy AI", 1);
	
	global.masterVolume = ini_read_real("Sound", "master", 0.5);
	global.musicVolume = ini_read_real("Sound", "music", 0.5);
	global.menuVolume = ini_read_real("Sound", "menu", 0.5);
	global.worldVolume = ini_read_real("Sound", "world", 0.5);
	
	global.lighting = ini_read_real("Graphics", "lighting", 2.0);
	global.resolution = ini_read_real("Graphics", "resolution", 0.0);
	global.usePirateFont = ini_read_real("Graphics", "font", 1.0);
	ini_close()
	with SoundController
		event_user(0);
}
else{
	global.gameRate = 1
	global.combatRate = 1
	global.skipCamp = false
	
	global.eventDiffBase = 1
	global.saveType = 2
	global.lootDrop = 1
	global.enemyDiff = 1
	
	global.masterVolume = 0.5;
	global.musicVolume = 0.5;
	global.menuVolume = 0.5;
	global.worldVolume = 0.5;

	global.lighting = 2
	global.resolution = 0
	global.usePirateFont = true
}

