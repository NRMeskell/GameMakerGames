/// @description Fall

if dropSpeed != 0{
    dropSpeed += myGrav
    y += dropSpeed
    }

if y > dropY{
    if dropSpeed < 0.05{
        y = dropY
        dropSpeed = 0
        }
    else
        {
        y = dropY
        dropSpeed = -dropSpeed/4
        }
    }
    
if y > room_height + 100
    instance_destroy()


///Over Button

if dropSpeed < 0.01{
    overButton = position_meeting(mouse_x, mouse_y, id) and !instance_exists(OptionsPanel)
    }
else{
    overButton = false
    }
    
image_index = myIndex
image_speed = 0

if overButton 
    image_xscale = 1.1
else
    image_xscale = 1
      
image_yscale = image_xscale

///Click Button

if overButton and mouse_check_button_pressed(mb_left){
    audio_play_sound(StoreSelectSnd, 1, false)
	event_user(myAction)
}

