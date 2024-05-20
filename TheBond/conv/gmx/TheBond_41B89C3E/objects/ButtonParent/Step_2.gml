/// @description button pressed


if (!instance_exists(LevelButton) or object_index == LevelButton)
    {
    if point_in_rectangle(mouse_x, mouse_y, x-width, y-height, x+width, y+height) and !instance_exists(Credits)
        {
        window_set_cursor(cr_handpoint);
        if mouse_check_button_pressed(mb_left) 
            script_execute(myAction)
        }
    }

