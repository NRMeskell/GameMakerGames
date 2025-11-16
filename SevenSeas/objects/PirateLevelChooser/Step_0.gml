/// @description Move and buttons

upNext = true
with PirateLeveler
	if upNext = true and id != other.id
		upNext = false
        
if upNext and x == -1000 and !instance_exists(Store) and !global.eventOpen
    {
    x = room_width*5/6
    with myPirate
        event_user(1)
    }
    
for(var i=0; i<buttonNumber; i++)
    {    
    buttonx[i] = x - buttonMax + buttonWidth*i
    if point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), buttonx[i] - 16, buttony - 16, buttonx[i] + 16, buttony + 16) and !instance_exists(DumpItem)
        overButton[i] = true
    else
        overButton[i] = false
        
    if overButton[i] and mouse_check_button_pressed(mb_left)
        {
		with myPirate{
	        var leveler = PirateLevelUp(true, true)
			leveler.upNext = true
			leveler.replaceSlot = i
		}
		instance_destroy()
    }
}

overDecline = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x - sprite_get_width(ButtonSpr)*(2/3)/2, y + sprite_height/2 -2, x + sprite_get_width(ButtonSpr)*(2/3)/2, y  + sprite_height/2 -2 + sprite_get_height(ButtonSpr)*(2/3)) and !instance_exists(DumpItem)
if overDecline and mouse_check_button_pressed(mb_left){
	myPirate.morale = 0
	myPirate.prevMorale = 0
	instance_destroy()
}