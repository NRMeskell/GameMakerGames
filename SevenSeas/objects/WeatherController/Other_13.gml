/// @description Draw Front Rain
// You can write your code in this editor

//draw grid of rain textures
for(var ix=-1; ix<1; ix++) for(var iy=-1; iy<1; iy++)
	draw_sprite_ext(RainSpr, 0, frontRainX + ix*sprite_get_width(RainSpr), frontRainY+ iy*sprite_get_height(RainSpr), 1, 1, 0, c_gray, 0.8)
	
//move rain
frontRainX += frontRainSpeed/5
frontRainY += frontRainSpeed

frontRainX = frontRainX mod room_width
frontRainY = frontRainY mod room_height