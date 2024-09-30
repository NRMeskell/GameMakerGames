/// @description Insert description here
// You can write your code in this editor
overMainMenu = point_in_rectangle(window_view_mouse_get_x(0), mouse_y, xc - sprite_get_width(ButtonSpr)/3, mainMenuY - 10, xc + sprite_get_width(ButtonSpr)/3, mainMenuY + 10) 

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
	ini_write_real("Gameplay", "diff", global.gameDiff);
	ini_write_real("Gameplay", "saving", global.saveType);
	ini_write_real("Sound", "master", global.masterVolume);
	ini_write_real("Sound", "music", global.musicVolume);
	ini_write_real("Sound", "world", global.worldVolume);
	ini_write_real("Graphics", "lighting", global.lighting);
	ini_write_real("Graphics", "resolution", global.modernRes);
	ini_write_real("Graphics", "font", global.usePirateFont);
	ini_close()
	instance_destroy()
}
	
if mouse_check_button_pressed(mb_left){
	if mouseOverOption[0]{
		
		global.gameDiff = (global.gameDiff + 1) % 3
	}
	if mouseOverOption[1]{
		global.saveType = (global.saveType + 1) % 3
	}
	if mouseOverOption[5]{
		global.lighting = (global.lighting + 1) % 3
	}
	if mouseOverOption[6]{
		global.modernRes = !global.modernRes
		with ViewController 
			event_user(0)
	}
	if mouseOverOption[7]{
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
}

if mouse_check_button(mb_left){
	if mouseOverOption[2]{
		global.masterVolume = min(sqrt(1), max(0, (window_view_mouse_get_x(0) - (xc - volumeWidth))/(volumeWidth*2/sqrt(1))))
	}
	if mouseOverOption[3]{
		global.musicVolume = min(sqrt(1), max(0, (window_view_mouse_get_x(0) - (xc - volumeWidth))/(volumeWidth*2/sqrt(1))))
	}
	if mouseOverOption[4]{
		global.worldVolume = min(sqrt(1), max(0, (window_view_mouse_get_x(0) - (xc - volumeWidth))/(volumeWidth*2/sqrt(1))))
	}
	with SoundController
		event_user(0)
}

	


