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
overConquer = !instance_exists(PirateLeveler) and !instance_exists(CombatRunner) and point_in_rectangle(mouse_x, mouse_y, conquerButtonX - cs, conquerButtonY - cs, conquerButtonX + cs, conquerButtonY + cs)

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
		
	//count number of cursed items
	var foundCursed = 0;
	for(var fc=0; fc<instance_number(ItemParent); fc++){
		var checkItem = instance_find(ItemParent, fc);
		if string_starts_with(checkItem.itemName, "Cursed")
			foundCursed ++;
	}
		
	if foundCursed == 3 and ds_map_find_value(seas[currentSeaNumber], "conquered") == false{
		event_user(1)
		ds_list_add(global.notificationList, "Curse Lifted!", "As the treasures are reunited, a powerful wind is felt, and the curse is lifted!")
		with ItemParent{
			if itemName == "Cursed Hat"{
				itemName = "Skeletal Hat"
				itemInfo = "A bicorn, now restored to it's former glory"
				bonus[6] = 2
			}
			if itemName == "Cursed Coat"{
				itemName = "Skeletal Coat"
				itemInfo = "A heavy coat, now restored to it's former glory"
				bonus[5] = 2
			}
			if itemName == "Cursed Boots"{
				itemName = "Skeletal Boots"
				itemInfo = "work boots, now restored to their former glory"
				bonus[3] = 2
			}
		}
	}
}

///Release new seas



