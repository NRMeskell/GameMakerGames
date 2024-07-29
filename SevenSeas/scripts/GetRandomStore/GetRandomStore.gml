function GetRandomStore(argument0, argument1) {
	//Get Loot
	itemList = ds_list_create()
	itemTypes = ds_list_create()
	
	if argument0 > 4
		tradeAmount = 4
	else
		tradeAmount = argument0
	
	//Generate Loot
	repeat(tradeAmount)
	    {
		if irandom(2) == 0{
	        newItem = instance_create(0,0,StoreObjectTrade)
			type = choose(1, irandom_range(2,5))
			while ds_list_find_index(itemTypes, type) != -1
				type = choose(1, irandom_range(2,5))
				
			ds_list_add(other.itemTypes, type)
			
	        with newItem{    
				type = other.type
				selected = false
			}
		}
	    else if irandom(2) == 0{
	        type = irandom(4)
	        if type == 0 
	            newItem = GenerateHatItem(irandom(global.seaLevel div 2) + choose(0,1))
	        else if type == 1
	            newItem = GenerateShirtItem(irandom(global.seaLevel div 2) + choose(-1,1))
	        else if type == 2
	            newItem = GeneratePantsItem(irandom(global.seaLevel div 2) + choose(-1,1))
	        else if type == 3
	            newItem = GenerateHandItem(irandom(global.seaLevel div 2))
	        else if type == 4
	            newItem = GeneratePetItem(irandom(1))
            
	        with newItem
	            {
	            selected = false
	            cost = itemCost
	        }
	    }
	    else{
	        type = irandom_range(2,sprite_get_number(CargoSpr)-1)	
			ds_list_add(itemTypes, type)
			
	        newItem = instance_create(0,0,StoreObjectStorable)
	        with newItem
	            {        
	            itemNumber = other.type
	            amount = round((irandom_range(5,10) + (5*(global.seaLevel + 1)))/ItemRunner.cargoCost[itemNumber]) + 1
	            selected = false
	            cost = ItemRunner.cargoCost[itemNumber]+ irandom(2) + ItemRunner.cargoCost[itemNumber]*amount               
	            selected = false
			}
	    }
	    ds_list_add(itemList, newItem)
	}

	//Make Store        
	with instance_create(room_width*5/6, room_height/2, Store)
	    {
	    items = other.itemList
    
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
    
	    storeName = argument1
	    leftButtonText = "trade"
	    rightButtonText = "exit"
	    }



}
