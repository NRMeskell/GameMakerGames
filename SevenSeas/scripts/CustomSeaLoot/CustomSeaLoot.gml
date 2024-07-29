function CustomSeaLoot(itemsAllowed) {
	//pearls
	if global.seaType == global.seaNames[1]
	    {
	    if irandom(1) == 0{
	        item = instance_create(0,0,StoreObjectVictory)
        
	        with item
	            {
	            name = "pearl"
	            description = "A rare, beautiful pearl found in the Tropical Waters"
	            previewName = "pearl"
	            amount = 1
	            itemType = 0       
	            cost = 0
	            }
            
	        ds_list_replace(items, irandom(min(4,ds_list_size(items)-1)), item)
	        }
		}
	//tropical crown
	if global.seaType == global.seaNames[1] or global.seaType == global.seaNames[2]
	    {
		if irandom(19) == 0 and instance_exists(FrogKing) and itemsAllowed{
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
				
			//search for other item
			with ItemParent{
				if itemName = other.specialItem.itemName{
					instance_destroy(other.specialItem)
				}		
			}
			
            if instance_exists(specialItem)
				ds_list_replace(items, 0, specialItem)
	    }
	}
}
