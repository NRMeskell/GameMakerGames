/// @description Sea conquering

//getSeaNumber
currentSeaNumber = -1
for(i=0; i<seaNumber; i++)
    if ds_map_find_value(seas[i], "type") = global.seaType{
        currentSeaNumber = i;
		break;
	}

//open pannel
cs = sprite_get_width(ConquerSpr)/2
overConquer = !instance_exists(PirateLeveler) and !instance_exists(CombatRunner) and point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), conquerButtonX - cs, conquerButtonY - cs, conquerButtonX + cs, conquerButtonY + cs)

if overConquer and mouse_check_button_pressed(mb_left) 
    {
    if ds_list_size(ItemRunner.floatingItems)==0 and !instance_exists(Store) and !instance_exists(Event) and ds_list_size(global.notificationList) == 0 and !instance_exists(CombatRunner) and !instance_exists(Defeat)
		with instance_create(room_width/2, room_height/2, ConquerPannel){
            event_user(3)
        }
    else
        with ConquerPannel{
            event_user(3)
            event_user(1)
            }
    }
    
//check conquering
    
//cove conquering
if currentSeaNumber == 0{
    stars = 0
    with Pirate
        {
        other.stars += stars
        }
    if stars > 3 and ds_map_find_value(seas[currentSeaNumber], "conquered") == false
        event_user(1)
    }
if currentSeaNumber == 3{
	if HasStored(8, 5){
		LoseCargo(8, 5)
		StoreCargo(1, 5)
			
		event_user(1)
		ds_list_add(global.notificationList, "Spirits Lifted!", "As the gem are reunited, ghostly spirits rise from the treasure! all curses are lifted from the ship!")
		LiftCurses()
	}
}


