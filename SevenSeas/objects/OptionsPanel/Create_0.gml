/// @description vars
mainMenuY = y + sprite_get_height(OptionsPanelSpr) + 14
overMainMenu = false

xc = 0
optionWidth = 65
volumeWidth = 45
catColor = make_color_rgb(153, 143, 0)
buttonColor[0] = c_black
buttonColor[1] = c_dkgray

goAway = false
slideSpeed = -10

largeGap = 20
smallGap = 14

drawY = y + 25
GAMEPLAYY = drawY					//GAME PLAY
drawY += largeGap
optionY[0] = drawY //DIFFICULTY
drawY += smallGap
optionY[1] = drawY //SAVING
drawY += largeGap

SOUNDY = drawY						//SOUND
drawY += largeGap + smallGap*1/2
optionY[2] = drawY //Master
drawY += smallGap*3/2
optionY[3] = drawY //music
drawY += smallGap*3/2
optionY[4] = drawY //world
drawY += largeGap

GRAPHICSY = drawY
drawY += largeGap
optionY[5] = drawY
drawY += smallGap
optionY[6] = drawY
drawY += smallGap
optionY[7] = drawY

for(var i=0; i<array_length(optionY); i++){
	mouseOverOption[i] = false
}


///OPTION OPTIONS

optionText[0][0] = "CALM"
optionText[0][1] = "NORMAL"
optionText[0][2] = "FIERCE"

optionText[1][0] = "PORTS"
optionText[1][1] = "SHELTERS"
optionText[1][2] = "ALWAYS"

optionText[2][0] = string(global.masterVolume) + "%"
optionText[3][0] = string(global.musicVolume) + "%"
optionText[4][0] = string(global.worldVolume) + "%"

optionText[5][0] = "NONE"
optionText[5][1] = "PARTIAL"
optionText[5][2] = "FULL"

optionText[6][0] = "RETRO"
optionText[6][1] = "MODERN"

optionText[7][0] = "PLAIN"
optionText[7][1] = "PIRATE"

depth = -100000

