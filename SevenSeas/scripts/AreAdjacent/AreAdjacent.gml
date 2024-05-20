function AreAdjacent(argument0, argument1) {

	if argument0.object_index = Pirate
	    {
	    if abs(ds_list_find_index(global.crewList, argument0.id) - ds_list_find_index(global.crewList, argument1.id)) < 2
	        return true
	    else
	        return false
	    }
	else
	    {
	    if abs(argument1.x - argument0.x) <= Enemy.xGap
	        return true
	    else
	        return false
	    }



}
