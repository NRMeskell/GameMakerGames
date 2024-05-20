/// @description Health Bar

draw_self()

HealthRed = make_colour_hsv(0,220,160)

draw_rectangle_color(x - 8, y + 5, x + 8, y + 7, c_black, c_black, c_black, c_black, false)

HealthGreen = make_colour_hsv(80,220,80)

draw_rectangle_colour(x - 8, y + 5, x - 8 + ((Health/MaxHealth) * 16), y + 7, HealthGreen, HealthGreen, HealthGreen, HealthGreen, false)

draw_rectangle_color(x - 8, y + 5, x + 8, y + 7, c_black, c_black, c_black, c_black, true)

