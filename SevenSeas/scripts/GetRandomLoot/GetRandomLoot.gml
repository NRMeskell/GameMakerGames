function GetRandomLoot(argument0, argument1, argument2) {
	//Get Loot
	itemNames = ds_list_create()
	itemList = ds_list_create()
	lootList = [3]
	//Generate Loot
	repeat(argument0)
	    {
	    if argument2 == undefined
	        {
	        lootList = [-1,0,0,0,1,irandom(6)]
	        }
	    else
	        {
			lootList = argument2
			}
		
		randomVal = lootList[max(irandom(array_length(lootList)-1),irandom(array_length(lootList)-1))]
				
	    if randomVal < 0
	        {
			itemLevel = irandom(global.seaLevel div 2)
	        type = choose(1,1,1,1,2,2,2,3,3,0,4)
	        if type == 0 
	            newItem = GenerateHatItem(min(0, itemLevel))
	        else if type == 1
	            newItem = GenerateShirtItem(itemLevel)
	        else if type == 2
	            newItem = GeneratePantsItem(max(itemLevel, 0))
	        else if type == 3
	            newItem = GenerateHandItem(irandom(global.seaLevel div 2))
			else if type == 4
	            newItem = GeneratePetItem(choose(choose(0,1),2,2))
                
	        with newItem
	            {
	            selected = false
	            cost = 0
	            }
                
	        ds_list_add(itemList, newItem)
	        }
	    else
	        {            
	        newItem = instance_create(0,0,StoreObjectStorable)
	        with newItem
	            {        
	            itemNumber = other.randomVal
				var tmpAmount = irandom_range(2,6)+2*((global.seaLevel)+(itemNumber==0)+(global.lootDrop))
	            amount = min(global.storeSize[itemNumber], max(1, round(tmpAmount/ItemRunner.cargoCost[itemNumber])))
	            cost = 0     
	            selected = false
	            }
	        ds_list_add(itemList, newItem)
	        }
	    }

	//Make Store        
	with instance_create(room_width*5/6, room_height/2, Store)
	    {
	    items = other.itemList
	    CustomSeaLoot(other.lootList[0] == -1)
    
	    for(i=0; i< ds_list_size(items); i++)
	        {
	        addItem = ds_list_find_value(items, i)
			with addItem{
	            myStore = other.id
	            viewed = false
	            selected = false
	            preview = false
				}
				
			if addItem.object_index == StoreObjectStorable{
				if ds_list_find_index(other.itemNames, addItem.itemNumber) == -1
					ds_list_add(other.itemNames, addItem.itemNumber)
			} else{
				if ds_list_find_index(other.itemNames, -1) == -1
					ds_list_add(other.itemNames, -1)
			}
		}
    
		storeName = argument1
		leftButtonText = "grab"
		rightButtonText = "exit"
		}
		
	return itemNames
}

function getItemText(argument0, argument1){
	itemNames = ""
	for(var i=0; i<ds_list_size(argument0); i++){
		itemType = ds_list_find_value(argument0, i) + 1
		
		var newItem = ""
		if itemType <= 7
			newItem = argument1[itemType]
		else if itemType == 8
			newItem = "pearls"
		else if itemType == 9
			newItem = "cursed gems"
		
		if i < ds_list_size(argument0)-2{
			itemNames += newItem + ", "
		}
		else if i == ds_list_size(argument0)-2{
			if ds_list_size(argument0) == 2
				itemNames += newItem + " and "
			else
				itemNames += newItem + ", and "
		}
		else{
			itemNames += newItem
		}		
	}
	if itemNames == ""{
		return "nothing"
	}
	else{
		return itemNames
	}
}