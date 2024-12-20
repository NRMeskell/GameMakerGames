function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = -9999; // Timer
	global.__objectDepths[1] = 0; // WorkerTag
	global.__objectDepths[2] = 0; // TownHall
	global.__objectDepths[3] = 0; // TowerVars
	global.__objectDepths[4] = 0; // ArrowTower
	global.__objectDepths[5] = 0; // MagicTower
	global.__objectDepths[6] = 0; // House
	global.__objectDepths[7] = 1; // Tavern
	global.__objectDepths[8] = 0; // Inn
	global.__objectDepths[9] = 0; // WorkHouse
	global.__objectDepths[10] = 1; // Homestead
	global.__objectDepths[11] = 0; // Farm
	global.__objectDepths[12] = 1; // Bloodstone
	global.__objectDepths[13] = 1; // Bomb
	global.__objectDepths[14] = 0; // Gong
	global.__objectDepths[15] = 0; // Altar
	global.__objectDepths[16] = 0; // Academy
	global.__objectDepths[17] = -11000; // Selectable
	global.__objectDepths[18] = 0; // Wall
	global.__objectDepths[19] = 0; // NoWallPlace
	global.__objectDepths[20] = 0; // WoodWall
	global.__objectDepths[21] = 0; // StoneWall
	global.__objectDepths[22] = 0; // SelectWorkerDrag
	global.__objectDepths[23] = -5000; // ObjectPlacer
	global.__objectDepths[24] = 0; // NoPlace
	global.__objectDepths[25] = 0; // TreePlacer
	global.__objectDepths[26] = -1000; // Building
	global.__objectDepths[27] = -1; // Worker
	global.__objectDepths[28] = 0; // Hero
	global.__objectDepths[29] = 0; // Warrior
	global.__objectDepths[30] = 0; // Archer
	global.__objectDepths[31] = 0; // Wizard
	global.__objectDepths[32] = 0; // Healer
	global.__objectDepths[33] = 0; // Tree
	global.__objectDepths[34] = 0; // Dropped
	global.__objectDepths[35] = 0; // RockDropped
	global.__objectDepths[36] = 0; // Mine
	global.__objectDepths[37] = 0; // MonsterTarget
	global.__objectDepths[38] = 0; // Enemy
	global.__objectDepths[39] = 0; // Goblin
	global.__objectDepths[40] = 0; // Orc
	global.__objectDepths[41] = 0; // Oger
	global.__objectDepths[42] = 0; // Ooze
	global.__objectDepths[43] = 0; // OozePuddle
	global.__objectDepths[44] = 0; // Imp
	global.__objectDepths[45] = 0; // Skeleton
	global.__objectDepths[46] = 0; // Spider
	global.__objectDepths[47] = 0; // Troll
	global.__objectDepths[48] = 0; // Drake
	global.__objectDepths[49] = 0; // Ghost
	global.__objectDepths[50] = 0; // Elemental
	global.__objectDepths[51] = 0; // ElementalSmash
	global.__objectDepths[52] = 0; // SmashTrail
	global.__objectDepths[53] = 0; // Ent
	global.__objectDepths[54] = 0; // Roller
	global.__objectDepths[55] = 0; // Dragon
	global.__objectDepths[56] = 0; // DragonDeath
	global.__objectDepths[57] = 0; // Arrow
	global.__objectDepths[58] = 0; // Magic
	global.__objectDepths[59] = 0; // OnFire
	global.__objectDepths[60] = 0; // Explotion
	global.__objectDepths[61] = 0; // EnemyFire
	global.__objectDepths[62] = -1000; // VarsAndMonsters
	global.__objectDepths[63] = -1000; // MonsterInfo
	global.__objectDepths[64] = -500; // GoldDing
	global.__objectDepths[65] = 0; // MusicController
	global.__objectDepths[66] = 0; // MonsterVars
	global.__objectDepths[67] = 0; // Button
	global.__objectDepths[68] = 0; // NewGame
	global.__objectDepths[69] = 0; // Continue
	global.__objectDepths[70] = 0; // LoadGame
	global.__objectDepths[71] = 0; // SaveGame
	global.__objectDepths[72] = -3; // SaveGameFile
	global.__objectDepths[73] = 0; // LoadGameFile
	global.__objectDepths[74] = 0; // Options
	global.__objectDepths[75] = 0; // Tutorial
	global.__objectDepths[76] = 0; // MainMenu
	global.__objectDepths[77] = 0; // Exit
	global.__objectDepths[78] = -1; // MusicOption
	global.__objectDepths[79] = -1; // SoundOption
	global.__objectDepths[80] = -3; // Slider
	global.__objectDepths[81] = -3; // DoneButton
	global.__objectDepths[82] = 0; // EasyOption
	global.__objectDepths[83] = 0; // MedOption
	global.__objectDepths[84] = 0; // HardOption
	global.__objectDepths[85] = 0; // CancelButton
	global.__objectDepths[86] = 0; // OptionMenu
	global.__objectDepths[87] = 0; // Crumble
	global.__objectDepths[88] = 0; // WorkerTagController


	global.__objectNames[0] = "Timer";
	global.__objectNames[1] = "WorkerTag";
	global.__objectNames[2] = "TownHall";
	global.__objectNames[3] = "TowerVars";
	global.__objectNames[4] = "ArrowTower";
	global.__objectNames[5] = "MagicTower";
	global.__objectNames[6] = "House";
	global.__objectNames[7] = "Tavern";
	global.__objectNames[8] = "Inn";
	global.__objectNames[9] = "WorkHouse";
	global.__objectNames[10] = "Homestead";
	global.__objectNames[11] = "Farm";
	global.__objectNames[12] = "Bloodstone";
	global.__objectNames[13] = "Bomb";
	global.__objectNames[14] = "Gong";
	global.__objectNames[15] = "Altar";
	global.__objectNames[16] = "Academy";
	global.__objectNames[17] = "Selectable";
	global.__objectNames[18] = "Wall";
	global.__objectNames[19] = "NoWallPlace";
	global.__objectNames[20] = "WoodWall";
	global.__objectNames[21] = "StoneWall";
	global.__objectNames[22] = "SelectWorkerDrag";
	global.__objectNames[23] = "ObjectPlacer";
	global.__objectNames[24] = "NoPlace";
	global.__objectNames[25] = "TreePlacer";
	global.__objectNames[26] = "Building";
	global.__objectNames[27] = "Worker";
	global.__objectNames[28] = "Hero";
	global.__objectNames[29] = "Warrior";
	global.__objectNames[30] = "Archer";
	global.__objectNames[31] = "Wizard";
	global.__objectNames[32] = "Healer";
	global.__objectNames[33] = "Tree";
	global.__objectNames[34] = "Dropped";
	global.__objectNames[35] = "RockDropped";
	global.__objectNames[36] = "Mine";
	global.__objectNames[37] = "MonsterTarget";
	global.__objectNames[38] = "Enemy";
	global.__objectNames[39] = "Goblin";
	global.__objectNames[40] = "Orc";
	global.__objectNames[41] = "Oger";
	global.__objectNames[42] = "Ooze";
	global.__objectNames[43] = "OozePuddle";
	global.__objectNames[44] = "Imp";
	global.__objectNames[45] = "Skeleton";
	global.__objectNames[46] = "Spider";
	global.__objectNames[47] = "Troll";
	global.__objectNames[48] = "Drake";
	global.__objectNames[49] = "Ghost";
	global.__objectNames[50] = "Elemental";
	global.__objectNames[51] = "ElementalSmash";
	global.__objectNames[52] = "SmashTrail";
	global.__objectNames[53] = "Ent";
	global.__objectNames[54] = "Roller";
	global.__objectNames[55] = "Dragon";
	global.__objectNames[56] = "DragonDeath";
	global.__objectNames[57] = "Arrow";
	global.__objectNames[58] = "Magic";
	global.__objectNames[59] = "OnFire";
	global.__objectNames[60] = "Explotion";
	global.__objectNames[61] = "EnemyFire";
	global.__objectNames[62] = "VarsAndMonsters";
	global.__objectNames[63] = "MonsterInfo";
	global.__objectNames[64] = "GoldDing";
	global.__objectNames[65] = "MusicController";
	global.__objectNames[66] = "MonsterVars";
	global.__objectNames[67] = "Button";
	global.__objectNames[68] = "NewGame";
	global.__objectNames[69] = "Continue";
	global.__objectNames[70] = "LoadGame";
	global.__objectNames[71] = "SaveGame";
	global.__objectNames[72] = "SaveGameFile";
	global.__objectNames[73] = "LoadGameFile";
	global.__objectNames[74] = "Options";
	global.__objectNames[75] = "Tutorial";
	global.__objectNames[76] = "MainMenu";
	global.__objectNames[77] = "Exit";
	global.__objectNames[78] = "MusicOption";
	global.__objectNames[79] = "SoundOption";
	global.__objectNames[80] = "Slider";
	global.__objectNames[81] = "DoneButton";
	global.__objectNames[82] = "EasyOption";
	global.__objectNames[83] = "MedOption";
	global.__objectNames[84] = "HardOption";
	global.__objectNames[85] = "CancelButton";
	global.__objectNames[86] = "OptionMenu";
	global.__objectNames[87] = "Crumble";
	global.__objectNames[88] = "WorkerTagController";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
