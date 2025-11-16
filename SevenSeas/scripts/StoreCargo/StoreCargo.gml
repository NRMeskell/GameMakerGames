///@description StoreCargo(type, amount)
///@param type
///@param amount

function StoreCargo(argument0, argument1) {
	var storeAmount = argument1;
	var canStore = true;
	var myStoreCargoType, itemQuality;
	//Work with food types
	if argument0 == 6
	    {
	    myStoreCargoType = 4
		itemQuality = 3
	    }
	else
	    {
	    myStoreCargoType = argument0
		itemQuality = 1
	    }

	// Store Items Into Existing Piles
	for(var i=0; i < instance_number(Cargo); i++){
	    var checkCargo = instance_find(Cargo, i)
        
	    if checkCargo.cargoType == myStoreCargoType and !checkCargo.mySlot.damaged{
	        var slotRoom = global.storeSize[myStoreCargoType] - checkCargo.cargoAmount
			var slotStoring = min(slotRoom, storeAmount)

	        if myStoreCargoType == 4
	            global.foodQuality = (global.foodQuality*(CargoAmount(4)) + slotStoring*itemQuality)/(CargoAmount(4)+slotStoring)

	        checkCargo.cargoAmount += slotStoring
			storeAmount -= slotStoring
		}
	}
	
	// Overflow into new cargo slots
	for(i=0; i < instance_number(ShipSlot); i++) {
		if storeAmount > 0{
			var checkSlot = instance_find(ShipSlot, i)
        
			// Found open slot!
			if checkSlot.slotType = "storage" and checkSlot.xSpot[Ship.shipType] != -50 and !checkSlot.occupied and !checkSlot.damaged {
				var slotStoring = min(global.storeSize[myStoreCargoType], storeAmount)
					
				if myStoreCargoType == 4
				    global.foodQuality = (global.foodQuality*(CargoAmount(4)) + slotStoring*itemQuality)/(CargoAmount(4)+slotStoring)
            
				var newCargo =  instance_create(0,0,Cargo)
				newCargo.mySlot = checkSlot
				newCargo.mySlot.occupied = true
				newCargo.mySlot.myThing = newCargo.id
				newCargo.cargoType = myStoreCargoType
				newCargo.cargoAmount = slotStoring
				newCargo.xReal = newCargo.mySlot.x + 1 + newCargo.realWidth/2
				newCargo.yReal = newCargo.mySlot.y + 1 + newCargo.realHeight/2
				
				storeAmount -= slotStoring
			}
		}
	}
}
