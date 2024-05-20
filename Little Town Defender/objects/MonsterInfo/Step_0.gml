/// @description Clicked

if TownHall.visible = true
if mouse_check_button_pressed(mb_left)
    {
    if distance_to_point(mouse_x,mouse_y) < 2
        Selected = true
    else
        Selected = false
    }

///Pushed Out

if y < room_height - 30 - 7 * (sprite_height + 10)
    {
    instance_destroy()
    }

