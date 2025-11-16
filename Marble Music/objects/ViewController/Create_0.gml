/// @description Set Up Game
// You can write your code in this editor

last_known_display_width = -1;
last_known_display_height = -1;
last_over_button = false

game_width = room_width;
game_height = room_height;

depth = 1

fullscreen_button = clickable_add(display_get_width() - 50, display_get_height()-50, sprite_get_tpe(FullScreenSpr, 0), "gmcallback_fullscreen", "_self", "");
