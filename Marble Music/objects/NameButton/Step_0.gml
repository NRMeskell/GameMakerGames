/// @description Insert description here
// You can write your code in this editor

event_inherited()

if (mouse_check_button_pressed(mb_left) and !hovering) or keyboard_check_pressed(vk_enter){
	writing = false
	if string_length(showName) > 0{
		with ScoreController{
			userName = other.showName
			LootLockerSetPlayerName(userName)
		}
	}
	else{
		showName = ScoreController.userName
	}
}

if writing{
	if keyboard_check(vk_anykey){
		if string_length(keyboard_string) > 12
			keyboard_string = string_delete(keyboard_string, 13, 1)
		showName = keyboard_string
	}
}