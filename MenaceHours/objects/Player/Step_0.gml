/// @description Move Player
// You can write your code in this editor

move_left = keyboard_check(ord("A")) or keyboard_check(vk_left)
move_right = keyboard_check(ord("D")) or keyboard_check(vk_left)

if TaskController.currMiniGame == noone{
	if move_left{
		if !sprinting{
			x = max(sprite_get_width(PlayerSpriteSpr)/2, x-mvSpeed)
		}
		else{
			x = max(sprite_get_width(PlayerSpriteSpr)/2, x-mvSpeed)
		}
	}

	if move_right{
		if !sprinting{
			x = min(room_width - sprite_get_width(PlayerSpriteSpr)/2, x+mvSpeed)
		}
		else{
			x = min(room_width - sprite_get_width(PlayerSpriteSpr)/2, x+mvSpeed)
		}
	}
}
