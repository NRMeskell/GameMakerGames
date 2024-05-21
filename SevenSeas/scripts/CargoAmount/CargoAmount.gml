///@description CargoAmount(type)
///@param type

function CargoAmount(argument0) {
	cargoStored = 0

	for(tempCargo=0; tempCargo < instance_number(Cargo); tempCargo++)
	    {
	    myCurrentCheckCargo =  instance_find(Cargo, tempCargo)
	    if argument0 == -1 or myCurrentCheckCargo.cargoType == argument0
	        cargoStored += myCurrentCheckCargo.cargoAmount 
	    }
    
	return cargoStored



}
