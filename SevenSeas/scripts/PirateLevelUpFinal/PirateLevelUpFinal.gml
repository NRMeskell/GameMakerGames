/// @description Level Up Real
function PirateLevelUpFinal(argument0, argument1) {
	with argument0
	    {
	    slot = 0
	    if myAction[0] != noone and myAction[0] != LostEyeAction
	        slot ++
	    if myAction[1] != noone and myAction[1] != LostEyeAction
	        slot ++
	    if myAction[2] != noone and myAction[2] != LostEyeAction
	        slot ++
    
	    if slot < 3{
	        myAction[slot] = argument1
	        }
	    }
}