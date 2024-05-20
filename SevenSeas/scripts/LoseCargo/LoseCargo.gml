function LoseCargo(argument0, argument1) {
	cargoLeft = argument1

	if argument0 != 6
	    removeCargoType = argument0
	else
	    removeCargoType = 4
    
	while cargoLeft > 0
	    {
	    cargoTypeFound = false
	    smallestCargo = 101
	    //find smallest pile
	    for(i=0; i < instance_number(Cargo); i++)
	        {
	        checkCargo =  instance_find(Cargo, i)
        
	        if checkCargo.cargoType = removeCargoType and 0 < checkCargo.cargoAmount and checkCargo.cargoAmount < smallestCargo 
	            {
	            smallestCargo = checkCargo.cargoAmount
	            cargoTypeFound = true
	            cargoPile = checkCargo
	            }
	        }
	    //no smallest pile found
	    if cargoTypeFound = false
	        cargoLeft = 0
	    //remove from smallest pile
	    else
	        {
	        lostCargoNumber = min(cargoLeft, cargoPile.cargoAmount)
	        cargoPile.cargoAmount -= lostCargoNumber
	        cargoLeft -= lostCargoNumber
	        if cargoPile.cargoAmount < 1
	            with cargoPile
	                event_user(2)
	        }
	    }



}
