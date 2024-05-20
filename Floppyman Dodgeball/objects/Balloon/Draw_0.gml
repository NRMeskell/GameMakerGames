/// @description Insert description here
// You can write your code in this editor

if super > 0 {
	for(var i=0; i<360; i+=360/6){
		draw_sprite_ext(SuperRaySpr, 0, x, y, (1 + 0.2*dsin(current_time/20)), 1, i+current_time/10, c_white, 1)
	}
}

draw_sprite_ext(sprite_index, image_index, x, y, 1+super, 1+super, image_angle, c_white, 1)