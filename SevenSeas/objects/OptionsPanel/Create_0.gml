/// @description vars
mainMenuY = y + sprite_get_height(OptionsPanelSpr) + 14
overMainMenu = false
overOther = false


tab = true

xc = 0
optionWidth = 65
volumeWidth = 45
catColor = make_color_rgb(153, 143, 0)
buttonColor[0] = c_black
buttonColor[1] = c_dkgray

goAway = false
slideSpeed = -10

largeGap = 25
smallGap = 16

optionY = ds_map_create()

//## GAMEPLAY TAB ##
// Experience
var drawY = y + 35
experienceY = drawY; drawY += largeGap; //GAME PLAY
optionY[? "sail"] = drawY;  drawY += smallGap; // Sail Rate
optionY[? "combat"] = drawY;  drawY += smallGap; // Combat speed
optionY[? "camp"] = drawY;  drawY += largeGap; // Skip camping

// Difficulty
drawY += smallGap; 
diffY = drawY; drawY += largeGap; // DIFFICULTY
optionY[? "enemy"] = drawY;  drawY += smallGap; // enemy AI
optionY[? "saving"] = drawY;  drawY += smallGap; // saving
optionY[? "loot"] = drawY;  drawY += smallGap; // looting rate
optionY[? "event"] = drawY;  drawY += largeGap // event diff
optionY[? "reset"] = drawY; // reset to normal difficulty

//## SETTINGS TAB ##
// sound
var drawY = y + 25
soundY = drawY; drawY += largeGap + smallGap*1/2
optionY[? "master"] = drawY; drawY += smallGap*3/2; //Master 
optionY[? "music"] = drawY; drawY += smallGap*3/2; //Music
optionY[? "menu"] = drawY; drawY += smallGap*3/2; //Menu
optionY[? "game"] = drawY; drawY += largeGap;     //Game

graphicsY = drawY; drawY += largeGap
optionY[? "reso"] = drawY; drawY += smallGap // Resolution
optionY[? "font"] = drawY; drawY += smallGap // Font
optionY[? "light"] = drawY;					  // Lighting


mouseOverOption = ds_map_create()
for (var k = ds_map_find_first(optionY); !is_undefined(k); k = ds_map_find_next(optionY, k)) {
	mouseOverOption[? k] = false
}


///OPTION OPTIONS
optionText = ds_map_create()

optionText[? "sail"] = ["CALM", "QUICK", "RAPID"]
optionText[? "combat"] = ["CALM", "QUICK", "RAPID"]
optionText[? "camp"] = ["ANIMATED", "SKIPPED"]

optionText[? "enemy"] = ["SIMPLE", "NORMAL", "CHEATING"]
optionText[? "saving"] = ["IN PORT", "AT LAND", "ALWAYS"]
optionText[? "loot"] = ["SLIM", "NORMAL", "GENEROUS"]
optionText[? "event"] = ["EASY", "NORMAL", "HARD"]

optionText[? "master"] = string(((200*global.masterVolume) div 5 * 5)) + "%"
optionText[? "music"] = string(((200*global.musicVolume) div 5 * 5)) + "%"
optionText[? "menu"] = string(((200*global.menuVolume) div 5 * 5)) + "%"
optionText[? "game"] = string(((200*global.worldVolume) div 5 * 5)) + "%"


optionText[? "reso"] = ["4:3", "16:9", "21:9"]
optionText[? "font"]= ["PLAIN", "PIRATE"]
optionText[? "light"] = ["NONE", "PARTIAL", "FULL"]


/// OPTION TABS
optionTab = ds_map_create()

optionTab[? "sail"] = false
optionTab[? "camp"] = false
optionTab[? "combat"] = false

optionTab[? "enemy"] = false
optionTab[? "saving"] = false
optionTab[? "loot"] = false
optionTab[? "event"] = false

optionTab[? "master"] = true
optionTab[? "music"] = true
optionTab[? "menu"] = true
optionTab[? "game"] = true

optionTab[? "reso"] = true
optionTab[? "font"] = true
optionTab[? "light"] = true

depth = -100000

