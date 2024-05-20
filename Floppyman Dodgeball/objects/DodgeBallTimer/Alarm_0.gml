/// @description Drop Ball

if ds_list_size(ballList) > 0{
	ballType = ds_list_find_value(ballList, 0)
	if ds_list_size(ballList) > 1{
		if irandom(ds_list_find_index(ballList, DodgeBall) != -1)
			ballType = DodgeBall
		else{
			ballType = ds_list_find_value(ballList, irandom(ds_list_size(ballList)-1))
			while ballType == DodgeBall
				ballType = ds_list_find_value(ballList, irandom(ds_list_size(ballList)-1))
		}
	}
	event_user(0)
}
playerAdjustment = power(0.9, ds_list_size(CharacterCreator.inputControllerList))
alarm[0] = (room_speed*random_range(1, 2)*dodgeballTimer*dropRate/global.timeDiff)*playerAdjustment