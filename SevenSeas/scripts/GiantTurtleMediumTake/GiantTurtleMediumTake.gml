function GiantTurtleMediumTake() {
	
	if argument0{
    
	item = irandom(1)

	if item == 0{
	    //Hat Item
	    specialItem = GenerateHatItem(1)
	    specialItem.itemNumber = 18
	    specialItem.itemName = "Shell Hat"
	    specialItem.itemInfo = "A hard shell, perfectly fit for wearing"
	    }    
	if item == 1{
	    //Shirt Item
	    specialItem = GenerateShirtItem(1)
	    specialItem.itemNumber = 28
	    specialItem.itemName = "Kelp vest"
	    specialItem.itemInfo = "A natural covering from nature"
	    } 
        
	GetRandomLoot(1, "TURTLE GIFT", undefined)
	with Store{
	    CustomSeaLoot()
	    ds_list_add(items, specialItem)
	    }
		GiantTurtle.myVar = 0
	}
	else{
		ds_list_add(global.notificationList, "Item fell!", "The item was knocked off the turtle, and it dives slowly down after it")
	}
    
	script_execute(closeEventCode)




}
