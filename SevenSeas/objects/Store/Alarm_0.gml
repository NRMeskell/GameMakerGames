/// @description Select all

if allowManySelects{
	for(var i=0; i<ds_list_size(items); i++){
        var myCurrentItem = ds_list_find_value(items, i) 
		
		if myCurrentItem.object_index != StoreObjectTrade{
			if myCurrentItem.cost == 0
				myCurrentItem.selected = true
		}
    } 
}
    

