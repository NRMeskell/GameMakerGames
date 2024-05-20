/// @description Draw Self
// You can write your code in this editor

optionText[2][0] = string(round(global.masterVolume*200) div 5 * 5) + "%"
optionText[3][0] = string(round(global.musicVolume*200) div 5 * 5) + "%"
optionText[4][0] = string(round(global.worldVolume*200) div 5 * 5) + "%"

xc = x + sprite_get_width(OptionsPanelSpr)/2


//GAME PLAY
draw_set_color(c_black)
washX = (room_width + 10 - x)/room_width
draw_set_alpha(washX)
draw_rectangle(-1, -1, room_width+1, room_height+1, false)
draw_set_alpha(1)
draw_sprite(OptionsPanelSpr, 0, x, y)
draw_set_font(global.LargePirateFont)
draw_set_halign(fa_center)
draw_set_color(catColor)
draw_text(xc, GAMEPLAYY, "GAME PLAY")

draw_set_font(global.PirateFont)
draw_set_color(c_black)
draw_set_halign(fa_left)
draw_text(xc - optionWidth, optionY[0], "DIFFICULTY:")
draw_text(xc - optionWidth, optionY[1], "SAVING:")

draw_set_halign(fa_right)
draw_set_color(buttonColor[mouseOverOption[0]])
draw_text(xc + optionWidth, optionY[0], optionText[0][global.gameDiff])
draw_set_color(buttonColor[mouseOverOption[1]])
draw_text(xc + optionWidth, optionY[1], optionText[1][global.saveType])


//PREFERENCES
drawY += largeGap
draw_set_font(global.LargePirateFont)
draw_set_halign(fa_center)
draw_set_color(catColor)
draw_text(xc, SOUNDY, "VOLUME")
drawY += largeGap

draw_set_font(global.PirateFont)
draw_set_color(c_black)
draw_text(xc, optionY[2] - smallGap*3/5, "MASTER: " + optionText[2][0])
scaleHeight = optionY[2]
//draw volume slider
sliCol = merge_color(c_gray, c_dkgray, 0.7)
draw_rectangle(xc-volumeWidth, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
draw_set_color(sliCol)
draw_rectangle(xc-volumeWidth, scaleHeight, xc+volumeWidth, scaleHeight, false)

volumeX = -volumeWidth + (global.masterVolume)*volumeWidth*2/sqrt(1)
draw_set_color(c_black)
draw_rectangle(xc-volumeWidth-3, scaleHeight-2, xc-volumeWidth+1, scaleHeight+2, false)
draw_rectangle(xc+volumeWidth-3, scaleHeight-2, xc+volumeWidth+1, scaleHeight+2, false)
draw_rectangle(xc+volumeX-3, scaleHeight-2, xc+volumeX+1, scaleHeight+2, false)
draw_set_color(c_dkgray)
draw_rectangle(xc-volumeWidth-2, scaleHeight-1, xc-volumeWidth, scaleHeight+1, false)
draw_rectangle(xc+volumeWidth-2, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
draw_set_color(buttonColor[mouseOverOption[2]])
draw_rectangle(xc+volumeX-2, scaleHeight-1, xc+volumeX, scaleHeight+1, false)


// VOLUME
draw_set_color(c_black)
draw_text(xc, optionY[3] - smallGap*3/5, "MUSIC: " + optionText[3][0])
scaleHeight = optionY[3]
//draw volume slider
sliCol = merge_color(c_gray, c_dkgray, 0.7)
draw_rectangle(xc-volumeWidth, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
draw_set_color(sliCol)
draw_rectangle(xc-volumeWidth, scaleHeight, xc+volumeWidth, scaleHeight, false)

volumeX = -volumeWidth + (global.musicVolume)*volumeWidth*2/sqrt(1)
draw_set_color(c_black)
draw_rectangle(xc-volumeWidth-3, scaleHeight-2, xc-volumeWidth+1, scaleHeight+2, false)
draw_rectangle(xc+volumeWidth-3, scaleHeight-2, xc+volumeWidth+1, scaleHeight+2, false)
draw_rectangle(xc+volumeX-3, scaleHeight-2, xc+volumeX+1, scaleHeight+2, false)
draw_set_color(c_dkgray)
draw_rectangle(xc-volumeWidth-2, scaleHeight-1, xc-volumeWidth, scaleHeight+1, false)
draw_rectangle(xc+volumeWidth-2, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
draw_set_color(buttonColor[mouseOverOption[3]])
draw_rectangle(xc+volumeX-2, scaleHeight-1, xc+volumeX, scaleHeight+1, false)


//WORLD
draw_set_color(c_black)
draw_text(xc, optionY[4] - smallGap*3/5, "SOUND: "  + optionText[4][0])
scaleHeight = optionY[4]
//draw volume slider
sliCol = merge_color(c_gray, c_dkgray, 0.7)
draw_rectangle(xc-volumeWidth, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
draw_set_color(sliCol)
draw_rectangle(xc-volumeWidth, scaleHeight, xc+volumeWidth, scaleHeight, false)

volumeX = -volumeWidth + (global.worldVolume)*volumeWidth*2/sqrt(1)
draw_set_color(c_black)
draw_rectangle(xc-volumeWidth-3, scaleHeight-2, xc-volumeWidth+1, scaleHeight+2, false)
draw_rectangle(xc+volumeWidth-3, scaleHeight-2, xc+volumeWidth+1, scaleHeight+2, false)
draw_rectangle(xc+volumeX-3, scaleHeight-2, xc+volumeX+1, scaleHeight+2, false)
draw_set_color(c_dkgray)
draw_rectangle(xc-volumeWidth-2, scaleHeight-1, xc-volumeWidth, scaleHeight+1, false)
draw_rectangle(xc+volumeWidth-2, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
draw_set_color(buttonColor[mouseOverOption[4]])
draw_rectangle(xc+volumeX-2, scaleHeight-1, xc+volumeX, scaleHeight+1, false)


//Graphics
draw_set_font(global.LargePirateFont)
draw_set_halign(fa_center)
draw_set_color(catColor)
draw_text(xc, GRAPHICSY, "GRAPHICS")

draw_set_font(global.PirateFont)
draw_set_halign(fa_left)
draw_set_color(c_black)
draw_set_halign(fa_left)
draw_text(xc - optionWidth, optionY[5], "EFFECTS:")
draw_text(xc - optionWidth, optionY[6], "RESOLUTION:")
draw_text(xc - optionWidth, optionY[7], "GAME FONT:")
draw_set_halign(fa_right)
draw_set_color(buttonColor[mouseOverOption[5]])
draw_text(xc + optionWidth, optionY[5], optionText[5][global.lighting])
draw_set_color(buttonColor[mouseOverOption[6]])
draw_text(xc + optionWidth, optionY[6], optionText[6][global.modernRes])
draw_set_color(buttonColor[mouseOverOption[7]])
draw_text(xc + optionWidth, optionY[7], optionText[7][global.usePirateFont])

draw_sprite(OptionsSpr, SaveGameRunner.overMenuButton, SaveGameRunner.menuButtonX, SaveGameRunner.menuButtonY)

if room == GameRoom{
	draw_sprite(ButtonSpr, overMainMenu*3, xc, mainMenuY)
	draw_set_halign(fa_center)
	draw_set_color(c_black)
	draw_text(xc, mainMenuY, "Main Menu")
}
