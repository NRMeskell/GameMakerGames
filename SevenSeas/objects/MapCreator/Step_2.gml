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
    if ds_list_size(ItemRunner.floatingItems)==0 and !instance_exists(Store) and !global.eventOpen and ds_list_size(global.notificationList) == 0 and !instance_exists(CombatRunner) and !instance_exists(Defeat)
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
if ds_map_find_value(seas[currentSeaNumber], "conquered") == false {
	//cove conquering
	if currentSeaNumber == 0{
	    var stars = 0
	    with Pirate
	        {
	        stars += self.stars
	        }
	    if stars > 3
	        event_user(1)
	    }
	if currentSeaNumber == 3{
		if winCond[3] = 5{
			event_user(1)
			ds_list_add(global.notificationList, "Spirits Lifted!", "As the fifth soul is freed from their prison, other spirits can be heard rejoicing!")
		}
	}
	
	if currentSeaNumber == 4{
		if winCond[4] = 3{
			event_user(1)
			ds_list_add(global.notificationList, "The final sanctuary!", "The crew rejoice, having discovered all the hidden havens in these boiling waters.")
		}
	}
}


