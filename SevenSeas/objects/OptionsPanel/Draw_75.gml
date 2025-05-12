/// @description Draw Self
// You can write your code in this editor

xc = x + (sprite_get_width(OptionsPanelSpr) - 26)/2

// Draw Self
draw_set_color(c_black)
var washX = (room_width + 10 - x)/room_width
draw_set_alpha(washX)
draw_rectangle(-1, -1, room_width+1, room_height+1, false)
draw_set_alpha(1)
draw_sprite(OptionsPanelSpr, overOther ? 2 : !tab, x, y)
draw_set_font(global.PirateFont)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text_transformed(x-9, y+72, "SFX/VFX", 0.8, 0.8, 90)
draw_text_transformed(x-9, y+141, "gameplay", 0.8, 0.8, 90)

// GAME PLAY
if !tab{
	// experience 
	draw_set_font(global.LargePirateFont)
	draw_set_halign(fa_center)
	draw_set_color(catColor)
	draw_text(xc, experienceY, "ANIMATIONS")
	draw_text(xc, diffY, "DIFFICULTY")

	draw_set_font(global.PirateFont)
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	draw_text(xc - optionWidth, optionY[? "sail"], "SAIL RATE:")
	draw_text(xc - optionWidth, optionY[? "combat"], "COMBAT:")
	draw_text(xc - optionWidth, optionY[? "camp"], "CAMPS:")
	
	draw_text(xc - optionWidth, optionY[? "enemy"], "ENEMIES:")
	draw_text(xc - optionWidth, optionY[? "saving"], "SAVING:")
	draw_text(xc - optionWidth, optionY[? "loot"], "LOOTING:")
	draw_text(xc - optionWidth, optionY[? "event"], "EVENTS:")
	
	draw_set_halign(fa_right)
	draw_set_color(buttonColor[mouseOverOption[? "sail"]])
	draw_text(xc + optionWidth, optionY[? "sail"], optionText[? "sail"][sqrt(global.gameRate-1)])
	draw_set_color(buttonColor[mouseOverOption[? "combat"]])
	draw_text(xc + optionWidth, optionY[? "combat"], optionText[? "combat"][(global.combatRate*2)-2])
	draw_set_color(buttonColor[mouseOverOption[? "camp"]])
	draw_text(xc + optionWidth, optionY[? "camp"], optionText[? "camp"][global.skipCamp])
	draw_set_color(buttonColor[mouseOverOption[? "enemy"]])
	draw_text(xc + optionWidth, optionY[? "enemy"], optionText[? "enemy"][global.enemyDiff])
	draw_set_color(buttonColor[mouseOverOption[? "saving"]])
	draw_text(xc + optionWidth, optionY[? "saving"], optionText[? "saving"][global.saveType])
	draw_set_color(buttonColor[mouseOverOption[? "loot"]])
	draw_text(xc + optionWidth, optionY[? "loot"], optionText[? "loot"][global.lootDrop])
	draw_set_color(buttonColor[mouseOverOption[? "event"]])
	draw_text(xc + optionWidth, optionY[? "event"], optionText[? "event"][global.eventDiffBase])
}
else{
	//PREFERENCES
	draw_set_font(global.LargePirateFont)
	draw_set_halign(fa_center)
	draw_set_color(catColor)
	draw_text(xc, soundY, "VOLUME")
	draw_text(xc, graphicsY, "GRAPHICS")

	// master volume
	draw_set_font(global.PirateFont)
	draw_set_color(c_black)
	draw_text(xc, optionY[? "master"] - smallGap*3/5, "MASTER: " + optionText[? "master"])
	scaleHeight = optionY[? "master"]
	//draw volume slider
	sliCol = merge_color(c_gray, c_dkgray, 0.7)
	draw_rectangle(xc-volumeWidth, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
	draw_set_color(sliCol)
	draw_rectangle(xc-volumeWidth, scaleHeight, xc+volumeWidth, scaleHeight, false)

	volumeX = -volumeWidth + (global.masterVolume*2)*volumeWidth
	draw_set_color(c_black)
	draw_rectangle(xc-volumeWidth-3, scaleHeight-2, xc-volumeWidth+1, scaleHeight+2, false)
	draw_rectangle(xc+volumeWidth-3, scaleHeight-2, xc+volumeWidth+1, scaleHeight+2, false)
	draw_rectangle(xc+volumeX-3, scaleHeight-2, xc+volumeX+1, scaleHeight+2, false)
	draw_set_color(c_dkgray)
	draw_rectangle(xc-volumeWidth-2, scaleHeight-1, xc-volumeWidth, scaleHeight+1, false)
	draw_rectangle(xc+volumeWidth-2, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
	draw_set_color(buttonColor[mouseOverOption[? "master"]])
	draw_rectangle(xc+volumeX-2, scaleHeight-1, xc+volumeX, scaleHeight+1, false)

	// music volume
	draw_set_font(global.PirateFont)
	draw_set_color(c_black)
	draw_text(xc, optionY[? "music"] - smallGap*3/5, "MUSIC: " + optionText[? "music"])
	scaleHeight = optionY[? "music"]
	//draw volume slider
	sliCol = merge_color(c_gray, c_dkgray, 0.7)
	draw_rectangle(xc-volumeWidth, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
	draw_set_color(sliCol)
	draw_rectangle(xc-volumeWidth, scaleHeight, xc+volumeWidth, scaleHeight, false)

	volumeX = -volumeWidth + (global.musicVolume*2)*volumeWidth
	draw_set_color(c_black)
	draw_rectangle(xc-volumeWidth-3, scaleHeight-2, xc-volumeWidth+1, scaleHeight+2, false)
	draw_rectangle(xc+volumeWidth-3, scaleHeight-2, xc+volumeWidth+1, scaleHeight+2, false)
	draw_rectangle(xc+volumeX-3, scaleHeight-2, xc+volumeX+1, scaleHeight+2, false)
	draw_set_color(c_dkgray)
	draw_rectangle(xc-volumeWidth-2, scaleHeight-1, xc-volumeWidth, scaleHeight+1, false)
	draw_rectangle(xc+volumeWidth-2, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
	draw_set_color(buttonColor[mouseOverOption[? "music"]])
	draw_rectangle(xc+volumeX-2, scaleHeight-1, xc+volumeX, scaleHeight+1, false)


	// menu volume
	draw_set_font(global.PirateFont)
	draw_set_color(c_black)
	draw_text(xc, optionY[? "menu"] - smallGap*3/5, "MENU: " + optionText[? "menu"])
	scaleHeight = optionY[? "menu"]
	//draw volume slider
	sliCol = merge_color(c_gray, c_dkgray, 0.7)
	draw_rectangle(xc-volumeWidth, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
	draw_set_color(sliCol)
	draw_rectangle(xc-volumeWidth, scaleHeight, xc+volumeWidth, scaleHeight, false)

	volumeX = -volumeWidth + (global.menuVolume*2)*volumeWidth
	draw_set_color(c_black)
	draw_rectangle(xc-volumeWidth-3, scaleHeight-2, xc-volumeWidth+1, scaleHeight+2, false)
	draw_rectangle(xc+volumeWidth-3, scaleHeight-2, xc+volumeWidth+1, scaleHeight+2, false)
	draw_rectangle(xc+volumeX-3, scaleHeight-2, xc+volumeX+1, scaleHeight+2, false)
	draw_set_color(c_dkgray)
	draw_rectangle(xc-volumeWidth-2, scaleHeight-1, xc-volumeWidth, scaleHeight+1, false)
	draw_rectangle(xc+volumeWidth-2, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
	draw_set_color(buttonColor[mouseOverOption[? "menu"]])
	draw_rectangle(xc+volumeX-2, scaleHeight-1, xc+volumeX, scaleHeight+1, false)

	// game volume
	draw_set_font(global.PirateFont)
	draw_set_color(c_black)
	draw_text(xc, optionY[? "game"] - smallGap*3/5, "EFFECTS: " + optionText[? "game"])
	scaleHeight = optionY[? "game"]
	//draw volume slider
	sliCol = merge_color(c_gray, c_dkgray, 0.7)
	draw_rectangle(xc-volumeWidth, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
	draw_set_color(sliCol)
	draw_rectangle(xc-volumeWidth, scaleHeight, xc+volumeWidth, scaleHeight, false)

	volumeX = -volumeWidth + global.worldVolume*2*volumeWidth
	draw_set_color(c_black)
	draw_rectangle(xc-volumeWidth-3, scaleHeight-2, xc-volumeWidth+1, scaleHeight+2, false)
	draw_rectangle(xc+volumeWidth-3, scaleHeight-2, xc+volumeWidth+1, scaleHeight+2, false)
	draw_rectangle(xc+volumeX-3, scaleHeight-2, xc+volumeX+1, scaleHeight+2, false)
	draw_set_color(c_dkgray)
	draw_rectangle(xc-volumeWidth-2, scaleHeight-1, xc-volumeWidth, scaleHeight+1, false)
	draw_rectangle(xc+volumeWidth-2, scaleHeight-1, xc+volumeWidth, scaleHeight+1, false)
	draw_set_color(buttonColor[mouseOverOption[? "game"]])
	draw_rectangle(xc+volumeX-2, scaleHeight-1, xc+volumeX, scaleHeight+1, false)

	//Graphics
	draw_set_font(global.PirateFont)
	draw_set_halign(fa_left)
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	draw_text(xc - optionWidth, optionY[? "reso"], "RESOLUTION:")
	draw_text(xc - optionWidth, optionY[? "font"], "GAME FONT:")
	draw_text(xc - optionWidth, optionY[? "light"], "LIGHTING:")
	draw_set_halign(fa_right)
	draw_set_color(buttonColor[mouseOverOption[? "reso"]])
	draw_text(xc + optionWidth, optionY[? "reso"], optionText[? "reso"][global.resolution])
	draw_set_color(buttonColor[mouseOverOption[? "font"]])
	draw_text(xc + optionWidth, optionY[? "font"], optionText[? "font"][global.usePirateFont])
	draw_set_color(buttonColor[mouseOverOption[? "light"]])
	draw_text(xc + optionWidth, optionY[? "light"], optionText[? "light"][global.lighting])
}
	
draw_sprite(OptionsSpr, SaveGameRunner.overMenuButton, SaveGameRunner.menuButtonX, SaveGameRunner.menuButtonY)

if room == GameRoom{
	draw_sprite(ButtonSpr, overMainMenu*3, xc, mainMenuY)
	draw_set_halign(fa_center)
	draw_set_color(c_black)
	draw_text(xc, mainMenuY, "Main Menu")
}
