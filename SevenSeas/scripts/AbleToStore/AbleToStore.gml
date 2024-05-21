///@description AbleToStore(type, amount)
///@param type
///@param amount

function AbleToStore(argument0, argument1) {
	slotNumber = 0

	for(i=0; i < instance_number(ShipSlot); i++)
	    {
	    checkSlot = instance_find(ShipSlot, i)
	    if checkSlot.slotType = "storage" and checkSlot.xSpot[Ship.shipType] != -50 and checkSlot.damaged = false
	        slotNumber += 1
	    }
    
	if slotNumber > instance_number(Cargo)
	    return true
	else
	    {
	    for(i=0; i < instance_number(Cargo); i++)
	        {
	        checkCargo = instance_find(Cargo, i)
        
	        if checkCargo.cargoType = argument0 or (argument0 == 6 and checkCargo.cargoType == 4)
	            if global.storeSize[checkCargo.cargoType] - checkCargo.cargoAmount >= argument1
	                return true
	        }
	    return false
	    }



}
