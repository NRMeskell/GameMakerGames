/// @description Insert description here
// You can write your code in this editor
overMainMenu = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x - 25, mainMenuY - 10, xc + sprite_get_width(ButtonSpr)/3, mainMenuY + 10) 
overOther = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x-25, y + 40 + 70*tab, x, y + 107 + 70*tab) 

if x < room_width - sprite_get_width(OptionsPanelSpr) + 30{
	slideSpeed = min(slideSpeed + 1, 4)
}
if x > room_width - sprite_get_width(OptionsPanelSpr) - 12 {
	if slideSpeed > 0 and !goAway
		slideSpeed = 0
	else if goAway
		slideSpeed += 1
}

x += slideSpeed

if x > room_width + 10{
	ini_open("GameSettings")
	ini_write_real("Gameplay", "sailing", global.gameRate);
	ini_write_real("Gameplay", "combat", global.combatRate);
	ini_write_real("Gameplay", "camping", global.skipCamp);
	
	ini_write_real("Difficulty", "event diff", global.eventDiffBase);
	ini_write_real("Difficulty", "saving", global.saveType);
	ini_write_real("Difficulty", "loot", global.lootDrop);
	ini_write_real("Difficulty", "enemy AI", global.enemyDiff);
	
	ini_write_real("Sound", "master", global.masterVolume);
	ini_write_real("Sound", "music", global.musicVolume);
	ini_write_real("Sound", "menu", global.menuVolume);
	ini_write_real("Sound", "world", global.worldVolume);
	
	ini_write_real("Graphics", "lighting", global.lighting);
	ini_write_real("Graphics", "resolution", global.resolution);
	ini_write_real("Graphics", "font", global.usePirateFont);
	ini_close()
	instance_destroy()
}
	
if mouse_check_button_pressed(mb_left) {
	if mouseOverOption[? "sail"]{
		var oldRate = global.gameRate
		global.gameRate = sqr(sqrt(global.gameRate-1) + 1) +1
		if global.gameRate > 5
			global.gameRate = 1
		if instance_exists(EventController)
			EventController.eventTimer *= oldRate/global.gameRate
	}
	if mouseOverOption[? "camp"]{
		global.skipCamp = !global.skipCamp
	}
	if mouseOverOption[? "combat"]{
		global.combatRate += 0.5
		if global.combatRate >= 2
			global.combatRate = 1
	}
	
	if mouseOverOption[? "saving"]{
		global.saveType = (global.saveType + 1) % 3
	}
	if mouseOverOption[? "loot"]{
		global.lootDrop = (global.lootDrop + 1) % 3
	}
	if mouseOverOption[? "enemy"]{
		global.enemyDiff = (global.enemyDiff + 1) % 3
	}
	if mouseOverOption[? "event"]{
		global.eventDiffBase = (global.eventDiffBase + 1) % 3
	}
	
	
	if mouseOverOption[? "light"]{
		global.lighting = (global.lighting + 1) % 3
	}
	if mouseOverOption[? "reso"]{
		global.resolution = (global.resolution + 1) % 3
	}
	if mouseOverOption[? "font"]{
		global.usePirateFont = !global.usePirateFont
		with ViewController 
			event_user(0)
	}
	if overMainMenu and room == GameRoom{
		if global.saveType == 2 or (global.inPort and (MapShip.targetPort.image_index = 1 or global.saveType == 1))
			with SaveGameRunner
				event_user(1)
		instance_create(0, 0, MainMenuCheck)
		audio_play_sound(StoreSelectSnd, 1, false)
	}
	if overOther{
		event_user(2)
	}
}

if mouse_check_button(mb_left) {
	if mouseOverOption[? "master"]{
		global.masterVolume = min(1, max(0, (window_view_mouse_get_x(0) - (xc - volumeWidth))/(volumeWidth*2)))
	}
	if mouseOverOption[? "music"]{
		global.musicVolume = min(1, max(0, (window_view_mouse_get_x(0) - (xc - volumeWidth))/(volumeWidth*2)))
	}
	if mouseOverOption[? "menu"]{
		global.menuVolume = min(1, max(0, (window_view_mouse_get_x(0) - (xc - volumeWidth))/(volumeWidth*2)))
	}
	if mouseOverOption[? "game"]{
		global.worldVolume = min(1, max(0, (window_view_mouse_get_x(0) - (xc - volumeWidth))/(volumeWidth*2)))
	}
	optionText[? "master"] = string(((global.masterVolume) div 5 * 5)) + "%"
	optionText[? "music"] = string(((200*global.musicVolume) div 5 * 5)) + "%"
	optionText[? "menu"] = string(((200*global.menuVolume) div 5 * 5)) + "%"
	optionText[? "game"] = string(((200*global.worldVolume) div 5 * 5)) + "%"
	with SoundController
		event_user(0)
}

	


