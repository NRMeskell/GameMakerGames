/// @description Draw Black Bars
// You can write your code in this editor

draw_set_color(c_black)
draw_rectangle(-abs((window_get_width()-windowWidth))/2, 0, 0, room_height, false)
draw_rectangle(0, -abs((window_get_height()-windowHeight))/2, room_width, 0, false)

draw_rectangle(room_width, 0, room_width+abs((window_get_width()-windowWidth))/2, room_height, false)
draw_rectangle(0, room_height, room_width, room_height+abs((window_get_height()-windowHeight))/2, false)
