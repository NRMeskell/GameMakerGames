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
		GetRandomLoot(1, "treasure", [1])
		with StoreObjectStorable
			amount = 5
			
		event_user(1)
		ds_list_add(global.notificationList, "Curse Lifted!", "As the jewels are reunited, ghostly spirits rise from the treasure! all curses are lifted from the ship!")
	
		for(var i=0; i<instance_number(Pirate); i++){
			var checkPirate = instance_find(Pirate, i)
			if checkPirate.body == sprite_get_number(PirateManSkinSpr) -1{
				checkPirate.face = myMainPer * 2 + irandom(1)
				checkPirate.body = irandom(sprite_get_number(PirateManSkinSpr)-2)
				with checkPirate{
					UpdateMorale(3, -1)
					if surface_exists(fullPirateSurface)
						MakePirateSurface(fullPirateSurface, 0, 0)
					if surface_exists(smallPirateSurface)
						MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy)
					if surface_exists(tagPirateSurface)
						MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY)
				}
			}
			if string_starts_with(checkPirate.myShirt.itemName, "Cursed"){
				checkPirate.myShirt.itemName = "Skeletal Coat"
				checkPirate.myShirt.itemInfo = "A bicorn, now restored to it's former glory"
			}
			if string_starts_with(checkPirate.myHat.itemName, "Cursed"){
				checkPirate.myHat.itemName = "Skeletal Hat"
				checkPirate.myHat.itemInfo = "A bicorn, now restored to it's former glory"
			}
			if string_starts_with(checkPirate.myPants.itemName, "Cursed"){
				checkPirate.myPants.itemName = "Skeletal Boots"
				checkPirate.myPants.itemInfo = "work boots, now restored to their former glory"
			}
		}
	}
}

///Release new seas



