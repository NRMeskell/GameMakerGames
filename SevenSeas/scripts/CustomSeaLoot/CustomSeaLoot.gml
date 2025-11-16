function CustomSeaLoot(itemsAllowed) {
	var specialItem, item;
	
	if ds_list_size(items) > 0{
		//tropical islands
		if global.seaType == global.seaNames[1]
		    {
			//pearls
		    if irandom(2) == 0{
		        item = instance_create(0,0,StoreObjectStorable)
        
		        with item
		            {
		            description = "A rare pearl, highly valued by the tropical locals!"
		            previewName = "pearl"
		            amount = 1
		            itemNumber = 7    
					name = ItemRunner.cargoName[itemNumber]
		            cost = 0
		            }
            
		        ds_list_replace(items, max(0, irandom(min(3,ds_list_size(items)-1))), item)
		    }
			//tropical crown
			if !ItemExists("Tropical Crown") and irandom(12) == 0 and itemsAllowed{
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
			//tropical trident
			if !ItemExists("Trident") and irandom(16) == 0 and itemsAllowed{
		        specialItem = instance_create(0,0,StoreObjectItem)
        
		        specialItem = GenerateHandItem(0)
				specialItem.itemNumber = 18
				specialItem.itemName = "Trident"
				specialItem.itemInfo = "The classic weapon of the ocean dwellers."
				specialItem.twoHanded = true
				for(i=0; i<9; i++)
				    specialItem.bonus[i] = 0
				specialItem.bonus[0] = 3
				
				ds_list_replace(items, 0, specialItem)
		    }
		}
		//shipwreck shores
		if global.seaType == global.seaNames[2]{
			//hand cannon
			if !ItemExists("Hand Cannon") and irandom(16) == 0 and itemsAllowed{
		        specialItem = instance_create(0,0,StoreObjectItem)
        
		        specialItem = GenerateHandItem(0)
				specialItem.itemNumber = 17
				specialItem.itemName = "Hand Cannon"
				specialItem.itemInfo = "An unstable and powerful weapon, likely creating using scraps"
				specialItem.twoHanded = true
				for(i=0; i<9; i++)
				    specialItem.bonus[i] = 0
				specialItem.bonus[1] = 3
				
				ds_list_replace(items, 0, specialItem)
		    }
			//Scavenged pants
			if !ItemExists("Scraped Pants") and irandom(16) == 0 and itemsAllowed{
		        specialItem = instance_create(0,0,StoreObjectItem)
        
		        specialItem = GeneratePantsItem(0)
				specialItem.itemNumber = 18
				specialItem.itemName = "Scraped Pants"
				specialItem.itemInfo = "made from cloth scraps and tough scales, perfect for intense work."
				specialItem.twoHanded = false
				for(i=0; i<9; i++)
				    specialItem.bonus[i] = 0
				specialItem.bonus[2] = 1
				specialItem.bonus[3] = 1
				
				ds_list_replace(items, 0, specialItem)
		    }
		}
		//sea of the dead
		if global.seaType == global.seaNames[3] {
			
			if irandom(4) == 0{
		        item = instance_create(0,0,StoreObjectVictory)
        
		        with item
		            {
		            description = "An ancient spirit, trapped in a beautiful stone."
		            previewName = "soul stone"
		            amount = 1  
					itemType = 8    
					name = ItemRunner.cargoName[itemType]
		            cost = 0
		            }
            
		        ds_list_replace(items, max(0, irandom(min(3,ds_list_size(items)-1))), item)
		    }
			
			
			if !ItemExists("Cursed Hat") and irandom(24) == 0 and itemsAllowed{
		        specialItem = instance_create(0,0,StoreObjectItem)
        
		        specialItem = GenerateHatItem(0)
				specialItem.itemNumber = 20
				specialItem.itemName = "Cursed Hat"
				specialItem.itemInfo = "A cursed bicorn. Until the curse is lifted, the wearer cannot eat!"
				specialItem.twoHanded = false
				for(i=0; i<9; i++)
				    specialItem.bonus[i] = 0
				specialItem.bonus[6] = 2
				specialItem.bonus[5] = 1
				
				ds_list_replace(items, 0, specialItem)
		    }
			if !ItemExists("Cursed Boots") and irandom(18) == 0 and itemsAllowed{
		        specialItem = instance_create(0,0,StoreObjectItem)
        
		        specialItem = GeneratePantsItem(0)
				specialItem.itemNumber = 19
				specialItem.itemName = "Cursed Boots"
				specialItem.itemInfo = "cursed Work boots. Until the curse is lifted, the wearer cannot eat!"
				specialItem.twoHanded = false
				for(i=0; i<9; i++)
				    specialItem.bonus[i] = 0
				specialItem.bonus[3] = 2
				specialItem.bonus[2] = 1
				
				ds_list_replace(items, 0, specialItem)
		    }
			if !ItemExists("Cursed Coat") and irandom(16) == 0 and itemsAllowed{
		        specialItem = instance_create(0,0,StoreObjectItem)
        
		        specialItem = GenerateShirtItem(0)
				specialItem.itemNumber = 29
				specialItem.itemName = "Cursed Coat"
				specialItem.itemInfo = "A cursed heavy coat. Until the curse is lifted, the wearer cannot eat!"
				specialItem.twoHanded = false
				for(i=0; i<9; i++)
				    specialItem.bonus[i] = 0
				specialItem.bonus[5] = 2
				specialItem.bonus[3] = 1
				
				ds_list_replace(items, 0, specialItem)
		    }
		}
		
		if global.seaType == global.seaNames[4] {
			//pearls
		    if irandom(3) == 0{
		        item = instance_create(0,0,StoreObjectStorable)
        
		        with item
		            {
		            description = "A stone dropped from the heart of the volcano!"
		            previewName = "ember stone"
		            amount = 1
		            itemNumber = 9  
					name = ItemRunner.cargoName[itemNumber]
		            cost = 0
		            }
            
		        ds_list_replace(items, max(0, irandom(min(3,ds_list_size(items)-1))), item)
		    }
			
			if irandom(16) and itemsAllowed{
			    specialItem = instance_create(0,0,StoreObjectItem)
        
		        specialItem = GenerateHandItem(0)
				specialItem.itemNumber = 16
				specialItem.itemName = "Obsidian Knife"
				specialItem.itemInfo = "The sharpest rocks make the sharpest weapons."
				specialItem.twoHanded = false
				for(i=0; i<9; i++)
				    specialItem.bonus[i] = 0
				specialItem.bonus[0] = 2
				
				ds_list_replace(items, 0, specialItem)
			}
		}
	}
}
