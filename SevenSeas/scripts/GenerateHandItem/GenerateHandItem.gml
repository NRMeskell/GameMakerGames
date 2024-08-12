function GenerateHandItem(argument0) {
	newItem = instance_create(0,0,StoreObjectItem)
	with newItem
	    {
	    color[0] = make_color_rgb(155,0,0)
	    color[1] = make_color_rgb(128,0,0)
	    color[2] = make_color_rgb(0,44,119)
	    color[3] = make_colour_rgb(156,156,156)
	    color[4] = make_color_rgb(43,43,43)
	    color[5] = make_color_rgb(158,126,2)
	    color[6] = make_color_rgb(140,0,145)
	    color[7] = make_color_rgb(53,73,0)
    
	    myColor = color[irandom(array_length_1d(color)-1)]
	    itemType = irandom(1)
    
	    foundItemType = false
	    while !foundItemType
	        {
	        itemNumber = ds_list_find_value(ItemRunner.handLevel[argument0], irandom(ds_list_size(ItemRunner.handLevel[argument0])-1))
        
	        if itemType != 0
	            {
	            if ds_list_find_index(ItemRunner.melleList, itemNumber) != -1
	                foundItemType = true
	            }
	        else
	            {
	            if ds_list_find_index(ItemRunner.melleList, itemNumber) == -1
	                foundItemType = true
	            }
	        }
    
	    itemName = ItemRunner.handNames[itemNumber]
	    spriteIndex = EquipHandSpr
	    itemInfo = ItemRunner.handInfo[itemNumber]
    
	    bonusNum = argument0 + 1
    
	    if ds_list_find_index(ItemRunner.twoHandedList, itemNumber) != -1
	        {
	        twoHanded = true
	        bonus[1] = bonusNum + 1
	        }
	    else if ds_list_find_index(ItemRunner.melleList, itemNumber) != -1
	        {
	        bonus[0] = bonusNum
	        }
	    else
	        {
	        bonus[1] = bonusNum
	        }
           
	    itemCost = 10 + bonusNum*10 + irandom_range(-2,2) + 3*(ds_list_find_index(ItemRunner.twoHandedList, itemNumber) != -1)
	    }
    
	return newItem



}
