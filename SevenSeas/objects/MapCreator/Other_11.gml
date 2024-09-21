/// @description Conquer Sea

if ds_list_size(ItemRunner.floatingItems)==0 and !instance_exists(Store) and !instance_exists(Event) and ds_list_size(global.notificationList) == 0 and !instance_exists(CombatRunner) and !instance_exists(Defeat)
    {
	with Pirate	
		event_user(0)
		
	global.moraleBoost = "conquering"
	UpdateMorale(3, -1)
	ds_map_replace(seas[currentSeaNumber], "conquered", true)
	GameStatsController.seasConquered ++	
		
    if instance_exists(ConquerPannel)
        {
        ConquerPannel.animating = true
        ConquerPannel.animation = 0
        }
    else    
        with instance_create(room_width/2, room_height/2, ConquerPannel){
            animating = true
            mySeaType = global.seaType
            myCurrentSea = other.currentSeaNumber
            event_user(3)
        }
    }
else
    alarm[1] = 5

