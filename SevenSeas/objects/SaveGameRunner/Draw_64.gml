/// @description ///Draw Menu Options
// You can write your code in this editor

if !instance_exists(CombatRunner) and room != PirateChooserRoom{
	draw_sprite(OptionsSpr, overMenuButton, menuButtonX, menuButtonY)
	
	if overMenuButton and mouse_check_button_pressed(mb_left){
		if !instance_exists(OptionsPanel)
			instance_create(room_width + 10, room_height/2 - sprite_get_height(OptionsPanelSpr)/2 - (room==GameRoom)*12, OptionsPanel)
		else
			with OptionsPanel
				goAway = true
	}
}


