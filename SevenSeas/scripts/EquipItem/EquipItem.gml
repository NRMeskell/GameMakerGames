function EquipItem(argument0, argument1) {
	isEquipped = false

	if argument1.sprite_index = EquipHandSpr
	    {
	    if argument1.twoHanded == false
	        {
	        if argument0.myRightHand.itemName == "none" and !argument0.handLostRight
	            {
	            argument0.myRightHand = argument1
	            isEquipped = true
	            }
	        else if argument0.myLeftHand.itemName == "none" and !argument0.handLostLeft
	            {
	            argument0.myLeftHand = argument1
	            isEquipped = true
	            }
	        else if !argument0.handLostRight
	            {
				//choose right hand
				if irandom(1) or argument0.myRightHand.twoHanded == true{
		            UnequipItem(argument0.myRightHand)
		            if argument0.myRightHand.twoHanded == true
		                argument0.myLeftHand = instance_create(0,0,ItemParent)
                
		            argument0.myRightHand = argument1
		            isEquipped = true
					}
				else{
					UnequipItem(argument0.myLeftHand)
		            argument0.myLeftHand = argument1
		            isEquipped = true
					}
	            }
	        else if !argument0.handLostLeft
	            {
	            UnequipItem(argument0.myLeftHand)
	            argument0.myLeftHand = argument1
	            isEquipped = true
	            }
	        }
	    else
	        {
	        if !argument0.handLostRight and !argument0.handLostLeft
	            {
	            if argument0.myLeftHand.itemName != "none"
	                {
	                UnequipItem(argument0.myLeftHand)
	                }
	            argument0.myLeftHand = argument1
	            isEquipped = true
            
	            if argument0.myRightHand.itemName != "none"
	                {
	                UnequipItem(argument0.myRightHand)
	                }
	            argument0.myRightHand = argument1
	            isEquipped = true
	            }
	        }
	    }
	else if argument1.sprite_index = EquipShirtSpr
	    {
	    if argument0.myShirt.itemName != "none"
	        UnequipItem(argument0.myShirt)  
        
	    argument0.myShirt = argument1
	    isEquipped = true
	    }
	else if argument1.sprite_index = EquipPantsSpr
	    {
	    if argument0.myPants.itemName != "none"
	        UnequipItem(argument0.myPants)  
        
	    argument0.myPants = argument1
	    isEquipped = true
	    }
	else if argument1.sprite_index = EquipHatSpr
	    {
	    if argument0.myHat.itemName != "none"
	        UnequipItem(argument0.myHat)  
        
	    argument0.myHat = argument1
	    isEquipped = true
	    }
	else if argument1.sprite_index = EquipPetSpr
	    {
	    if argument0.myPet.itemName != "none"
	        UnequipItem(argument0.myPet)  
        
	    argument0.myPet = argument1
	    isEquipped = true
	    }
    
	if isEquipped = true
	    {
	    with ItemParent
	        selected = false
	    argument1.state = "equipped"
		argument1.myPirate = argument0.id
    
	    while ds_list_find_index(ItemRunner.floatingItems, argument1) != -1
	        ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, argument1))
	    }
		
    with argument0{
		if surface_exists(fullPirateSurface)
			MakePirateSurface(fullPirateSurface, 0, 0)
		if surface_exists(smallPirateSurface)
			MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy)
		if surface_exists(tagPirateSurface)
			MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY)
	}
	return isEquipped
}
