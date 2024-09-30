/// @description Look at rum

with instance_create(room_width*5/6, room_height/2, Store)
    {
    items = other.itemList[2]
    
    for(i=0; i< ds_list_size(items); i++)
        {
		instance_activate_object(ds_list_find_value(items, i))
        with ds_list_find_value(items, i)
            {
            myStore = other.id
            viewed = false
            selected = false
            preview = false
            }
        }
    
    storeName = "PURCHASE GROG"
    leftButtonText = "buy"
    rightButtonText = "exit"
    }

