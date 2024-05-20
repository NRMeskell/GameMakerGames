/// @description Insert description here
// Check When to save

if room == GameRoom{
	overMenuButton = point_in_circle(mouse_x, mouse_y, menuButtonX, menuButtonY, sprite_get_width(OptionsSpr)/2) and (MapCreator.drawMiniHeight == 0)
	if MapCreator.instantClose{
		saveNow = true
	}

	if !MapCreator.instantClose and saveNow and global.saveType == 2{
		event_user(1)
		saveNow = false
	}
	menuButtonX = room_width - 31
	if instance_exists(OptionsPanel)
		menuButtonX -= max(0, (room_width - OptionsPanel.x - 7))
	menuButtonY = 68
}
else{
	overMenuButton = point_in_circle(mouse_x, mouse_y, menuButtonX, menuButtonY, sprite_get_width(OptionsSpr)/2)
	
	menuButtonX = room_width - 50
	menuButtonY = 32
}

saveGameTimer += 1


