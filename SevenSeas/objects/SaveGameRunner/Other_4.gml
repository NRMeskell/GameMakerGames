/// @description Insert description here
// You can write your code in this editor

//surface_resize(application_surface, 640, 360)
//surface_resize(application_surface, display_get_width(), display_get_height())

if room == GameRoom{
	//menuButtonX = MapCreator.conquerButtonX - 5 - sprite_get_width(OptionsSpr)
	//menuButtonY = MapCreator.conquerButtonY
	menuButtonX = room_width - 31
	if instance_exists(OptionsPanel)
		menuButtonX -= max(0, (room_width - OptionsPanel.x - 7))
	menuButtonY = 68
	}
else{
	menuButtonX = room_width - 50
	menuButtonY = 32
}


