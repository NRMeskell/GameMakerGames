/// @description Move and buttons

upNext = true
with PirateLeveler
    {
    if ds_list_find_index(global.crewList, myPirate.id) < ds_list_find_index(global.crewList, other.myPirate.id)
        other.upNext = false
    }
        
if upNext and x == -1000 and !instance_exists(Store) and !instance_exists(Event)
    {
    x = room_width*5/6
    with myPirate
        event_user(1)
    }
    
for(i=0; i<2; i++)
    {    
    buttonx[i] = x - buttonMax + buttonWidth*i
    if point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), buttonx[i] - 16, buttony - 16, buttonx[i] + 16, buttony + 16) and !instance_exists(DumpItem)
        overButton[i] = true
    else
        overButton[i] = false
        
    if overButton[i] and mouse_check_button_pressed(mb_left)
        {
        PirateLevelUpFinal(myPirate, action[i])
        alarm[0] = 1
        }
    }
	
if myPirate.selected == false
	with myPirate
		event_user(1)


