/// @description Draw self

if y == Ship.frontWaves.waveBase
	DrawWithLighting(sprite_index, image_index, x, room_height - y + 10, 0, c_white, 1, 5)
else
	DrawWithLighting(sprite_index, image_index, x, room_height - y + 30, 0, c_white, 1, 2)

