/// @description Buy Ships

with instance_create(room_width*5/6, room_height/2, Store)
    {
    allowManySelects = false
    items = other.itemList[0]
    
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
    
    storeName = "AVAILABLE SHIPS"
    leftButtonText = "buy"
    rightButtonText = "exit"
    }
