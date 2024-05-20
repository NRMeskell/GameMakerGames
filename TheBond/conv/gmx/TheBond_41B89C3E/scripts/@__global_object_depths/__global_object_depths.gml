// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // SpiritParent
global.__objectDepths[1] = 0; // WhiteSpirit
global.__objectDepths[2] = 0; // BlackSpirit
global.__objectDepths[3] = -1; // RainbowSpirit
global.__objectDepths[4] = 0; // Drawable
global.__objectDepths[5] = 10; // GroundTile
global.__objectDepths[6] = 0; // GrassPatch
global.__objectDepths[7] = 0; // WaterPatch
global.__objectDepths[8] = 0; // StonePatch
global.__objectDepths[9] = 1000; // RoomRunner
global.__objectDepths[10] = 0; // Bush
global.__objectDepths[11] = 0; // Door
global.__objectDepths[12] = 0; // ClosedDoor
global.__objectDepths[13] = -5; // AllDoor
global.__objectDepths[14] = -5; // ClosedAllDoor
global.__objectDepths[15] = -5; // BlackDoor
global.__objectDepths[16] = -5; // ClosedBlackDoor
global.__objectDepths[17] = -5; // WhiteDoor
global.__objectDepths[18] = -5; // ClosedWhiteDoor
global.__objectDepths[19] = 0; // Portal
global.__objectDepths[20] = 0; // Button
global.__objectDepths[21] = 0; // Switch
global.__objectDepths[22] = -5; // Wall
global.__objectDepths[23] = 0; // SoulTrap
global.__objectDepths[24] = -10; // PanelParent
global.__objectDepths[25] = -20; // ButtonParent
global.__objectDepths[26] = -10; // LevelFailed
global.__objectDepths[27] = -10; // Restart
global.__objectDepths[28] = -10; // LevelComplete
global.__objectDepths[29] = -30; // Credits
global.__objectDepths[30] = 0; // GameRunner
global.__objectDepths[31] = 0; // MenuCreator
global.__objectDepths[32] = -30; // LevelButton
global.__objectDepths[33] = -25; // LevelPanel
global.__objectDepths[34] = 0; // Title
global.__objectDepths[35] = 0; // ArrowDrawer
global.__objectDepths[36] = 0; // Butterfly
global.__objectDepths[37] = 5; // Cloud


global.__objectNames[0] = "SpiritParent";
global.__objectNames[1] = "WhiteSpirit";
global.__objectNames[2] = "BlackSpirit";
global.__objectNames[3] = "RainbowSpirit";
global.__objectNames[4] = "Drawable";
global.__objectNames[5] = "GroundTile";
global.__objectNames[6] = "GrassPatch";
global.__objectNames[7] = "WaterPatch";
global.__objectNames[8] = "StonePatch";
global.__objectNames[9] = "RoomRunner";
global.__objectNames[10] = "Bush";
global.__objectNames[11] = "Door";
global.__objectNames[12] = "ClosedDoor";
global.__objectNames[13] = "AllDoor";
global.__objectNames[14] = "ClosedAllDoor";
global.__objectNames[15] = "BlackDoor";
global.__objectNames[16] = "ClosedBlackDoor";
global.__objectNames[17] = "WhiteDoor";
global.__objectNames[18] = "ClosedWhiteDoor";
global.__objectNames[19] = "Portal";
global.__objectNames[20] = "Button";
global.__objectNames[21] = "Switch";
global.__objectNames[22] = "Wall";
global.__objectNames[23] = "SoulTrap";
global.__objectNames[24] = "PanelParent";
global.__objectNames[25] = "ButtonParent";
global.__objectNames[26] = "LevelFailed";
global.__objectNames[27] = "Restart";
global.__objectNames[28] = "LevelComplete";
global.__objectNames[29] = "Credits";
global.__objectNames[30] = "GameRunner";
global.__objectNames[31] = "MenuCreator";
global.__objectNames[32] = "LevelButton";
global.__objectNames[33] = "LevelPanel";
global.__objectNames[34] = "Title";
global.__objectNames[35] = "ArrowDrawer";
global.__objectNames[36] = "Butterfly";
global.__objectNames[37] = "Cloud";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for