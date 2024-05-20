function GenerateShipItem(argument0) {
	//Make Ship

	newShip = instance_create(0, 0, StoreObjectShip)
	with newShip
	    {
	    myShipType = argument0
        
	    cost = 60 + (30 * (myShipType > 0)) + 50*(myShipType > 3) + irandom_range(-5, 5)
	    }
	return newShip




}
