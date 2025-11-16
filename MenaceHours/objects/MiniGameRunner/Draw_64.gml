/// @description Draw Mini Game
// You can write your code in this editor


if TaskController.currMiniGame == id{
	// Draw custom game stuff
	if !surface_exists(gameSurf)
		gameSurf = surface_create(width, height)
	surface_set_target(gameSurf)
	event_user(0)
	surface_reset_target()
	draw_surface(gameSurf, xc-width/2, yc-height/2)
	
	// Draw overlay
	draw_sprite(MiniFrameSpr, 0, xc-width/2, yc-height/2)
	draw_set_color(make_color_rgb(229, 229, 229))
	draw_set_halign(fa_center)
	draw_set_halign(fa_right)
	draw_text(xc-width/2 + 35, yc-height/2-5-sprite_get_width(PlainFontSpr)/2, string(completeness) + "%")
	draw_set_halign(fa_left)
	draw_text(xc-width/2 + 40, yc-height/2-5-sprite_get_width(PlainFontSpr)/2, "COMPLETE")
}