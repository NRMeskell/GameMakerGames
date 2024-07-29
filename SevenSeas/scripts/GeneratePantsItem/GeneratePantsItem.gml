function GeneratePantsItem(argument0) {
	newItem = instance_create(0,0,StoreObjectItem)
	with newItem
	    {   
		if argument0 != -1{
		    color[0] = make_color_rgb(155,0,0)
		    color[1] = make_color_rgb(128,0,0)
		    color[2] = make_color_rgb(0,44,119)
		    color[3] = make_colour_rgb(200,200,200)
		    color[4] = make_color_rgb(25,25,25)
		    color[5] = make_color_rgb(158,126,2)
		    color[6] = make_color_rgb(140,0,145)
		    color[7] = make_color_rgb(22,98,0)
		}
		else{
			color[0] = make_color_rgb(84,50,7)
		    color[1] = make_color_rgb(50,50,50)
		    color[2] = make_color_rgb(150,150,150)
		    color[3] = make_colour_rgb(200,200,200)
			color[4] = make_colour_rgb(133,83,19)
		}
    
	    myColor = color[irandom(array_length_1d(color)-1)]
    
	    itemNumber = ds_list_find_value(ItemRunner.pantsLevel[argument0+1], irandom(ds_list_size(ItemRunner.pantsLevel[argument0+1])-1))
	    itemName = ItemRunner.pantsNames[itemNumber]
	    spriteIndex = EquipPantsSpr
	    itemInfo = ItemRunner.pantsInfo[itemNumber]
    
	    itemBonuses = 1+argument0
    
	    for(i=0; i<itemBonuses; i++)
	        {
	        if ds_list_find_index(ItemRunner.deckhandPants, itemNumber) != -1  
	                bonus[irandom_range(2,3)] ++
	        else
	            bonus[choose(5,6)] ++
	        }
        
               
	    itemCost = 12+itemBonuses*17+irandom_range(-3,3)
	    }
    
	return newItem
}
