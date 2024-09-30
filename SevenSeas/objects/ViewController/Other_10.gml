/// @description Update Graphics
// You can write your code in this editor

windowHeight = min(display_get_height(), display_get_width()*room_height/room_width)
windowWidth = windowHeight*(room_width/room_height)

if global.modernRes
	surface_resize(application_surface, windowWidth, windowHeight)
else
	surface_resize(application_surface, room_width, room_height)

window_set_rectangle(0, 0, display_get_width(), display_get_height());
view_wport[0] = display_get_width();
view_hport[0] = display_get_height();
view_xport[0] = 0
view_yport[0] = 0

//view_wport[2] = windowWidth
//view_hport[2] = windowHeight
//view_xport[2] = 0
//view_yport[2] = 0

display_set_gui_size(room_width, room_height)
display_set_gui_maximize(windowWidth/room_width,windowHeight/room_height,abs((window_get_width()-windowWidth))/2,(window_get_height()-windowHeight)/2)

if global.usePirateFont{
	global.PirateFont = font_add_sprite(FontSpr, ord("!"), true, 2)
	global.LargePirateFont = font_add_sprite(LargeFontSpr, ord("!"), true, 2)
	}
else{
	global.PirateFont = font_add_sprite(PlainFontSpr, ord("!"), true, 2)
	global.LargePirateFont = font_add_sprite(PlainLargeFontSpr, ord("!"), true, 2)
}