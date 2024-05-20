function MakePantsItem(argument0) {
	newItem = instance_create(0,0,ItemParent)
	with newItem
	    {        
	    myColor = argument0.myColor    
    
	    itemNumber = argument0.itemNumber
	    itemName = argument0.itemName
	    sprite_index = argument0.spriteIndex
	    itemInfo = argument0.itemInfo
	    damage = argument0.damage
	    accuracy = argument0.accuracy
	    myAction = argument0.myAction
	    cost = argument0.itemCost
    
	    for(i=0; i<8; i++)
	        bonus[i] = argument0.bonus[i]
    
	    twoHanded = argument0.twoHanded
	    }
    
	return newItem




}
