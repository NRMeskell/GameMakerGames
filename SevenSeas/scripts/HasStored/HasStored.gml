function HasStored(argument0, argument1) {
	hasStored = false
	needsStored = argument1

	for(i=0; i < instance_number(Cargo); i++)
	    {
	    checkCargo =  instance_find(Cargo, i)

	    if checkCargo.cargoType = argument0
	        {
	        needsStored -= checkCargo.cargoAmount 
	        }
	    }
    
	if needsStored <= 0
	    hasStored = true
    
	return hasStored



}
