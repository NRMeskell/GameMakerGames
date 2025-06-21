/// @description Update Graphics
// You can write your code in this editor

// show_debug_overlay(true)

global.WINDOW_WIDTH = -1;
global.WINDOW_HEIGHT = -1;

windowHeight = min(display_get_height(), display_get_width()*room_height/room_width)
windowWidth = windowHeight*(room_width/room_height)

realWidths = [room_width, (windowWidth + room_width)/2, windowWidth]
realHeights = [room_height, (windowHeight + room_height)/2, windowHeight]

surface_resize(application_surface, realWidths[global.resolution], realHeights[global.resolution])

view_wport[0] = realWidths[global.resolution];
view_hport[0] = realHeights[global.resolution];
view_xport[0] = 0
view_yport[0] = 0
camera_set_view_size(0, room_width, room_height)
// set content to fill screen
window_set_rectangle(0, 0, display_get_width(), display_get_height());

//adjust GUI to match odd sizes/ full screen
display_set_gui_size(room_width, room_height)
display_set_gui_maximize(windowWidth/room_width, windowHeight/room_height, abs((window_get_width()-windowWidth))/2, (window_get_height()-windowHeight)/2)

if global.usePirateFont{
	global.PirateFont = font_add_sprite(FontSpr, ord("!"), true, 2)
	global.LargePirateFont = font_add_sprite(LargeFontSpr, ord("!"), true, 2)
	}
else{
	global.PirateFont = font_add_sprite(PlainFontSpr, ord("!"), true, 2)
	global.LargePirateFont = font_add_sprite(PlainLargeFontSpr, ord("!"), true, 2)
}