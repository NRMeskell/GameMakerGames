function CustomSeaLoot(itemsAllowed) {
	//pearls
	if global.seaType == global.seaNames[1]
	    {
	    if irandom(2) == 0{
	        item = instance_create(0,0,StoreObjectStorable)
        
	        with item
	            {
	            name = "pearl"
	            description = "A rare pearl, small enough to not need storage space!"
	            previewName = "pearl"
	            amount = 1
	            itemNumber = 7     
	            cost = 0
	            }
            
	        ds_list_replace(items, irandom(min(4,ds_list_size(items)-1)), item)
	        }
		}
	if global.seaType == global.seaNames[1]
	    {
		//tropical crown
		if !ItemExists("Tropical Crown") and irandom(19) == 0 and itemsAllowed{
	        specialItem = instance_create(0,0,StoreObjectItem)
        
	        specialItem = GenerateHatItem(0)
			specialItem.itemNumber = 19
			specialItem.itemName = "Tropical Crown"
			specialItem.itemInfo = "The long-lost crown of the royal frog bloodline."
			specialItem.twoHanded = false
			for(i=0; i<9; i++)
			    specialItem.bonus[i] = 0
			specialItem.bonus[0] = 2
			specialItem.bonus[6] = 1
				
			ds_list_replace(items, 0, specialItem)
	    }
		if !ItemExists("Tropical Crown") and irandom(19) == 0 and itemsAllowed{
	        specialItem = instance_create(0,0,StoreObjectItem)
        
	        specialItem = GenerateHatItem(0)
			specialItem.itemNumber = 19
			specialItem.itemName = "Tropical Crown"
			specialItem.itemInfo = "The long-lost crown of the royal frog bloodline."
			specialItem.twoHanded = false
			for(i=0; i<9; i++)
			    specialItem.bonus[i] = 0
			specialItem.bonus[0] = 2
			specialItem.bonus[6] = 1
				
			ds_list_replace(items, 0, specialItem)
	    }
	}
}
