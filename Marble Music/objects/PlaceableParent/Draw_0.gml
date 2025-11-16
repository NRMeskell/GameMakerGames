/// @description Draw Self

if image_angle < 0
	image_angle = 360 + image_angle
if image_angle > 359
	image_angle = image_angle mod 360

draw_sprite_outline(sprite_index, image_index, phy_position_x, phy_position_y, image_xscale, image_yscale, image_angle, c_white, 1, hovering, c_gray)