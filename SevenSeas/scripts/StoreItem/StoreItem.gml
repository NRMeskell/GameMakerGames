///@description StoreItem(type, amount)
///@param type
///@param amount

function StoreItem(argument0, argument1) {
	//Work with food types
	if argument0 == 6
	    {
	    myStoreItemType = 4
    
	    if object_index != Store
	        itemQuality = 3
	    else
	        itemQuality = global.foodQuality
	    }
	else
	    {
	    myStoreItemType = argument0
    
	    if object_index != Store
	        itemQuality = 1
	    else
	        itemQuality = global.foodQuality
	    }

	//Store Items
	repeat(argument1)
	    {
	    storedOne = false
	    for(i=0; i < instance_number(Cargo) and !storedOne; i++)
	        {
	        checkCargo = instance_find(Cargo, i)
        
	        if checkCargo.cargoType == myStoreItemType
	            if checkCargo.cargoAmount < global.storeSize[myStoreItemType]
	                {
	                if myStoreItemType == 4
	                    global.foodQuality = (global.foodQuality*(CargoAmount(4)) + itemQuality)/(CargoAmount(4)+1)
	                if myStoreItemType == 0
	                    GameStatsController.goldCollected ++
	                checkCargo.cargoAmount += 1
	                storedOne = true
	                }
	        }
        
	    for(i=0; i < instance_number(ShipSlot) and !storedOne; i++)
	        {
	        checkSlot = instance_find(ShipSlot, i)
        
	        if checkSlot.slotType = "storage" and checkSlot.xSpot[Ship.shipType] != -50 and !checkSlot.occupied
	            {
	            if myStoreItemType == 4
	                global.foodQuality = (global.foodQuality*(CargoAmount(4)) + itemQuality)/(CargoAmount(4)+1)
	            if myStoreItemType == 0
	                    GameStatsController.goldCollected ++
            
	            storedOne = true
	            with instance_create(0,0,Cargo)
	                {
	                mySlot = other.checkSlot
	                mySlot.occupied = true
	                mySlot.myThing = id
	                cargoType = other.myStoreItemType
	                cargoAmount = 1
	                }
	            }
	        }
	    }



}
