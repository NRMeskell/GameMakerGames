/// @description Trade Items

with instance_create(room_width*5/6, room_height/2, Store)
    {
    items = other.itemList[2]
    
    for(var i=0; i<ds_list_size(items); i++)
        {
		instance_activate_object(ds_list_find_value(items, i))
        with ds_list_find_value(items, i)
            {
            myStore = other.id
            viewed = false
            selected = false
            preview = false
			if HasStored(type, 1) and (amount > CargoAmount(type) or (type == 1 and amount != CargoAmount(type)))
				event_user(4)
        }
    }
    
    storeName = "TRADES"
    leftButtonText = "sell"
    rightButtonText = "exit"
    }

