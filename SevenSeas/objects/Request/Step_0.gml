/// @description Button Pressed

buttonNumber = ds_list_size(buttons)

overButton[0] = point_in_rectangle(mouse_x, mouse_y, drawX - sprite_get_width(ButtonSpr)/2, drawY + buttonCenter - sprite_get_height(ButtonSpr)/2, drawX - 3, drawY + buttonCenter + sprite_get_height(ButtonSpr)/2)
overButton[1] = point_in_rectangle(mouse_x, mouse_y, drawX + 3, drawY + buttonCenter - sprite_get_height(ButtonSpr)/2, drawX + sprite_get_width(ButtonSpr)/2, drawY + buttonCenter + sprite_get_height(ButtonSpr)/2)

if mouse_check_button_pressed(mb_left)
    {                                       
    if overButton[0] or overButton[1]
        {   
        if overButton[0]     
            {
			try{
	            script_execute(ds_list_find_value(buttons, 0), myPirate)
	            with myPirate
	                UpdateMorale(1, -1)
				}		
			catch( _exception){
				showException( _exception)
				}
            }
        if overButton[1]{
            global.moraleBoost = "denied"
            with myPirate
                UpdateMorale(-1, -1)
            }

        audio_play_sound(StoreSelectSnd, 1, false)
        closeEventCode()
        }
    }

instance_create(0,0,CollectionCounter)
