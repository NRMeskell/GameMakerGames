/// @description button pressed


if (!instance_exists(LevelButton) or object_index == LevelButton)
    {
    if point_in_rectangle(mouse_x, mouse_y, x-width, y-height, x+width, y+height) and !instance_exists(Credits)
        {
		if overButton == false{
			audio_play_sound(ButtonReleaseSnd, 1, false, 0.1)
			overButton = true
		}
        window_set_cursor(cr_handpoint);
        if mouse_check_button_pressed(mb_left) {
			audio_play_sound(LeverSnd, 1, false, 0.5)
            script_execute(myAction)
			}
			
        }
	else overButton = false
    }
	

