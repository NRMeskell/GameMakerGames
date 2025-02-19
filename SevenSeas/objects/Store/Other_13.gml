/// @description Update Can Take
  
canTake = true
overflow = false
hasSelected = false

//find how many ship slots are open
slotNumber = 0
for(i=0; i < instance_number(ShipSlot); i++)
	{
	checkSlot = instance_find(ShipSlot, i)
	if checkSlot.slotType = "storage" and checkSlot.xSpot[Ship.shipType] != -50 and checkSlot.damaged = false
		slotNumber += 1
	}

//reset cargo array
for(i=0; i < array_length(cargoAmounts); i++)
	cargoAmounts[i] = CargoAmount(i);

//adjust cargo array based on selected cargo
for(r=0; r < ds_list_size(items); r++)
    {
    checkCanStore = ds_list_find_value(items, r)
    if checkCanStore.selected
        {
		other.hasSelected = true
        if checkCanStore.object_index = StoreObjectStorable
            {
			if checkCanStore.itemNumber < 6
				cargoAmounts[checkCanStore.itemNumber] += checkCanStore.amount
            else
				cargoAmounts[4] += checkCanStore.amount
			cargoAmounts[0] -= checkCanStore.cost
            }
        else if checkCanStore.object_index = StoreObjectPirate
            {
            if instance_number(Pirate) >= global.shipMaxCrew[Ship.shipType]
                canTake = false
				
			cargoAmounts[0] -= checkCanStore.cost
            }
        else if checkCanStore.object_index = StoreObjectTrade
            {
			cargoAmounts[checkCanStore.type] -= checkCanStore.sellAmount
            cargoAmounts[0] += checkCanStore.amount
            }
		else{
			cargoAmounts[0] -= checkCanStore.cost
		}
    }
}

slotsNeeded = 0
for(i=0; i<array_length(cargoAmounts); i++){
	if cargoAmounts[i] < 0
		canTake = false
	if cargoAmounts[i] > 0{
		slotsNeeded += 1 + ((cargoAmounts[i] - 1) div global.storeSize[i])
	}
}

totalCost = CargoAmount(0) - cargoAmounts[0]
canTake = canTake and hasSelected
if slotsNeeded > slotNumber
	overflow = true;