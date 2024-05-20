/// @description Update Graphics
// You can write your code in this editor


if global.modernRes
	surface_resize(application_surface, windowWidth, windowHeight)
else
	surface_resize(application_surface, room_width, room_height)

window_set_rectangle(0, 0, windowWidth, windowHeight);
view_wport[0] = windowWidth;
view_hport[0] = windowHeight;

if global.usePirateFont{
	global.PirateFont = font_add_sprite(FontSpr, ord("!"), true, 2)
	global.LargePirateFont = font_add_sprite(LargeFontSpr, ord("!"), true, 2)
	}
else{
	global.PirateFont = font_add_sprite(PlainFontSpr, ord("!"), true, 2)
	global.LargePirateFont = font_add_sprite(PlainLargeFontSpr, ord("!"), true, 2)
			}