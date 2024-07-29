/// @description Look at supplies

with instance_create(room_width*5/6, room_height/2, Store)
    {
    items = other.itemList[1]
    
    for(i=0; i< ds_list_size(items); i++)
        {
        with ds_list_find_value(items, i)
            {
            myStore = other.id
            viewed = false
            selected = false
            preview = false
            }
        }
    
    storeName = "BUY SUPPLIES"
    leftButtonText = "buy"
    rightButtonText = "exit"
    }

