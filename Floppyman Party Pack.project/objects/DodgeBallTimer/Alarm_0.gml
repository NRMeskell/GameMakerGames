/// @description Drop Ball

ballType = DodgeBall
event_user(0)

playerAdjustment = power(0.9, ds_list_size(CharacterCreator.inputControllerList))
alarm[0] = (room_speed*random_range(1, 2)*dodgeballTimer*dropRate/global.timeDiff)*playerAdjustment