/// @description Draw Over Button

if x < 0{
	for(var i=0; i<array_length(myLight); i++){
		if myLight[i] != noone
			instance_destroy(myLight[i])
	}
	instance_deactivate_object(id)
}

buffer = 3
drawHeight = (106 - sprite_get_height(LandMenuButtonSpr)/2 - buffer*2)/buttonNumber
drawStart = 21 + sprite_get_height(LandMenuButtonSpr)/2 + buffer
for(i=0; i<buttonNumber; i++)
    {
    drawButtonHeight = currentHeight-drawHeight*i-drawStart
    overMenuButton[i] = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x-sprite_get_width(LandMenuButtonSpr)/2, y-drawButtonHeight-sprite_get_height(LandMenuButtonSpr)/2, x+sprite_get_width(LandMenuButtonSpr)/2, y-drawButtonHeight+sprite_get_height(LandMenuButtonSpr)/2)

    }
    
if !overButton
    overButton = distance_to_point(window_view_mouse_get_x(0),window_view_mouse_get_y(0)) < 1
else
    overButton = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x-sprite_get_width(LandMenuSpr)/2, y-sprite_get_height(LandMenuSpr), x+sprite_get_width(LandMenuSpr)/2, y)

if Clock.alarm[2] > 0 or global.pirateSelected or ds_list_size(ItemRunner.floatingItems) > 0 or  instance_exists(Store) or instance_exists(Event) or ds_list_size(global.notificationList) > 0// or sprite_index = CampFireDyingSpr
    overButton = false

///Press Button

if overButton
for(i=0; i<buttonNumber; i++)
    {
    if mouse_check_button_pressed(mb_left) and overMenuButton[i]
        {
		event_user(i+1)
		
		if object_index = Camp{
			audio_stop_sound(CampFireSnd)
			
			with Clock{
				alarm[2] = campTime
				}
			
			alarm[0] = 1
			}
        }
    }
        

