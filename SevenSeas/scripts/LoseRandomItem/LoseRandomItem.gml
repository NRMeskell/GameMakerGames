function LoseRandomItem() {
	//lose random item. If item is lost, return true

	myItem = instance_create(0,0,ItemParent)
	runNumber = 9

	while myItem.itemName == "none" and runNumber > 0{
	    itemLost = irandom(runNumber)
	    runNumber --
    
	    if itemLost == 0 or itemLost == 1 //lose hat
	        myItem = myHat
	    if itemLost == 2  //lose right hand
	        myItem = myRightHand 
	    if itemLost == 3  //lose left hand
	        myItem = myLeftHand
	    if itemLost == 4 or itemLost == 5  //lose shirt
	        myItem = myShirt
	    if itemLost == 6 or itemLost == 7 //lose pants
	        myItem = myPants
	    if itemLost == 8 or itemLost == 9 //lose pet
	        myItem = myPet
	    }

	if myItem.itemName != "none"{
	    with myItem
	        {
	        UnequipItem(id)
	        while ds_list_find_index(ItemRunner.floatingItems, id) != -1
	            ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, self.id))
	        other.lostItemName = itemName    
	        instance_destroy()
	        }
	    }
	else{
	    lostItemName = "morale"
	    global.moraleBoost = "lost item"
	    UpdateMorale(-1, -1)
	}

	return lostItemName



}
