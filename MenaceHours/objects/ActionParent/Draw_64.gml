/// @description Show Menu
// You can write your code in this editor

if hoveringOver{
	var drawX = 160-sprite_get_width(OptionBoxSpr)/2
	var drawY = 200-sprite_get_height(OptionBoxSpr)-4
	
	draw_sprite(OptionBoxSpr, InReach(), drawX, drawY) 
	
	draw_set_font(global.mainFont)
	draw_set_color(InReach() ? c_white : make_color_rgb(201, 201, 201))
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_text(drawX+sprite_get_width(OptionBoxSpr)/2, drawY+12, string_upper(name))
	
	draw_set_halign(fa_left)
	draw_text(drawX+120, drawY+28, mainAction)
	draw_text(drawX+31, drawY+28, !pickedUp ? "Pick Up" : "Drop")


}
