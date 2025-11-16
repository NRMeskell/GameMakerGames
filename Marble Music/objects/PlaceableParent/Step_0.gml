/// @description Test if over
// You can write your code in this editor

if room == GameRoom{
	hovering = position_meeting(mouse_x, mouse_y, id) or grabbed

	if hovering{
		if mouse_check_button_pressed(mb_left){
			with PlaceableParent
				grabbed = false
			grabbed = true
			grabDis = [mouse_x - x, mouse_y - y]
		}
		if mouse_check_button_released(mb_left){
			var box = getGameBox()
			if (x > box[0] and x < box[2]) and (y > box[1] and y < box[3])
				grabbed = false
			else{
				instance_destroy()
			}
		}
	}

	phy_active = true
	if grabbed{
		for(var i=0; i<instance_number(Target); i++){
			with instance_find(Target, i){
				alarm[0] = -1
				active = false
			}
		}
	
		phy_active = false
		phy_position_x = (mouse_x - grabDis[0]) div 1
		phy_position_y = (mouse_y - grabDis[1]) div 1
		if keyboard_check(ord("A")) or keyboard_check(vk_left){
			phy_rotation -= 1
		}
		else if keyboard_check(ord("D")) or keyboard_check(vk_right){
			phy_rotation += 1
		}
	}
}