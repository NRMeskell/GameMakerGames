/// @description Insert description here
// You can write your code in this editor

if image_angle < 0
	image_angle = 360 + image_angle
if image_angle > 359
	image_angle = image_angle mod 360

// Inherit the parent event
draw_sprite_outline(sprite_index, image_index, phy_position_x, phy_position_y, image_xscale, image_yscale*(1+(currEx/sprite_height)), image_angle, c_white, 1, other.hovering, c_gray)


with myPlat{
	image_angle =other.image_angle
	draw_sprite_outline(sprite_index, round(image_angle / 90) mod 4, phy_position_x, phy_position_y, image_xscale, image_yscale, image_angle, c_white, 1, other.hovering, c_gray)
}
