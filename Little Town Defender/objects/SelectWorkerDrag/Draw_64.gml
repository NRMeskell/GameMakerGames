/// @description Draw Selecting

if TownHall.visible = true
if global.Selectings = true
    {
    draw_set_color(c_yellow)
    draw_rectangle(global.GrabStartX, global.GrabStartY, mouse_x, mouse_y, true)
    draw_set_alpha(0.2)
    draw_rectangle(global.GrabStartX, global.GrabStartY, mouse_x, mouse_y, false)
    draw_set_alpha(1)
    draw_set_color(c_black)
    }

