
function ReduceReputation(){	
	for(var i=0; i<ds_list_size(global.reputation); i++){	
		if irandom(4) == 0{
			reduceValue = ds_list_find_value(global.reputation, i)
			ds_list_delete(global.reputation, i)
			reduceValue[1] -= sign(reduceValue[1])
			if abs(reduceValue[1]) > 0
				ds_list_add(global.reputation, reduceValue)
		}
		
	}
	
}

