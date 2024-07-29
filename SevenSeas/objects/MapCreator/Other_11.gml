/// @description Conquer Sea

if (global.doTime or global.inPort) and ds_list_size(global.notificationList) == 0
    {
	global.moraleBoost = "conquering"
	UpdateMorale(3, -1)
	ds_map_replace(seas[currentSea], "conquered", true)
	GameStatsController.seasConquered ++	
		
    if instance_exists(ConquerPannel)
        {
        ConquerPannel.animating = true
        ConquerPannel.animation = 0
        }
    else    
        with instance_create(room_width/2, room_height/2, ConquerPannel){
            animating = true
            mySeaType = other.currentSeaType
            myCurrentSea = other.currentSea
            event_user(3)
        }
    }
else
    alarm[1] = 5

