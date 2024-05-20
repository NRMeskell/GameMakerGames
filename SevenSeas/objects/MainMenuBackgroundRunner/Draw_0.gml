/// @description Draw Background Land
with Clock
	event_user(1)

draw_background(PirateChooseBack, 10, 0)

with MenuCloud
        draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, merge_color(Clock.cloudColor, c_white, 0.2), image_alpha)
        
draw_background_ext(PirateCoveLand, 0, room_height/2 + landYShift + 10, 1, 1, 0, c_ltgray, 1)
draw_background_ext(BackgroundLandShading,  0, room_height/2 + landYShift, 1, 1, 0, merge_color(Clock.cloudColor, c_white, 0.6), 1)

///Draw Waves
with backWaves
	event_user(0)
with middleWaves
	event_user(0)
with frontWaves
	event_user(0)
	
//Draw Wheel
draw_background_ext(MenuBackWheel, 0, 0, 1, 1, 0, merge_color(c_white, Clock.cloudColor, 0.4), 1)

