/// @description Look at pirates

with instance_create(room_width*5/6, room_height/2, Store)
    {
    items = other.itemList[0]
    
    for(i=0; i< ds_list_size(items); i++)
        {
		instance_activate_object(ds_list_find_value(items, i))
        with ds_list_find_value(items, i)
            {
            myStore = other.id
            viewed = false
            selected = false
            preview = false
			
			instance_activate_object(myHat)
			instance_activate_object(myShirt)
			instance_activate_object(myPants)
			instance_activate_object(myPet)
			instance_activate_object(myRightHand)
			instance_activate_object(myLeftHand)
            }
        }
    
    storeName = "PIRATES FOR HIRE"
    leftButtonText = "hire"
    rightButtonText = "exit"
    }

