/// @description Drop Rare

if ds_list_size(ballList) != 0
    {
    ballType = ds_list_find_value(ballList, irandom(ds_list_size(ballList)-1))
    event_user(0)
    
    playerAdjustment = power(0.9, ds_list_size(CharacterCreator.inputControllerList))
	alarm[1] = (room_speed*random_range(1, 2)*rareTimer*dropRate/global.timeDiff)*playerAdjustment
	}

