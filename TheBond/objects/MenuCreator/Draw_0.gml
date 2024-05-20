/// @description Draw Title

cardWidth = 120

draw_set_color(c_black)
draw_rectangle(room_width/2 - cardWidth, 0, room_width/2 + cardWidth, room_height, true)
draw_set_color(c_dkgray)
draw_set_alpha(0.4)
draw_rectangle(room_width/2 - cardWidth, 0, room_width/2 + cardWidth, room_height, false)
draw_set_alpha(1)
draw_sprite(TitleCard, 0, room_width/2, room_height/2 - 75)

