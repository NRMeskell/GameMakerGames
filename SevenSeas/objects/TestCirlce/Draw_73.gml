/// @description Draw Self Lighting
// You can write your code in this editor


DrawWithLighting(sprite_index, image_index, x, y, image_angle, c_white, 1, 2);

if keyboard_check(vk_left)
	image_angle += 1
if keyboard_check(vk_right)
	image_angle -= 1