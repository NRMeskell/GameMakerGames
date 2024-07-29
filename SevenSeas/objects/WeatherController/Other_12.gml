/// @description Draw Back Rain
// You can write your code in this editor

//draw grid of rain textures
for(var ix=-1; ix<1; ix++) for(var iy=-1; iy<1; iy++)
	draw_sprite_ext(RainSpr, 0, backRainX + ix*sprite_get_width(RainSpr), backRainY+ iy*sprite_get_height(RainSpr), 1, 1, 0, c_dkgray, 0.5)
	
//move rain
backRainX += backRainSpeed/5
backRainY += backRainSpeed

backRainX = backRainX mod room_width
backRainY = backRainY mod room_height