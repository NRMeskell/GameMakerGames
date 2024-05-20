function LoseRandomCargo(argument0) {
	//Lose Cargo
	for(i=0; i < sprite_get_number(CargoSpr); i++)
	    numberCargoLost[i] = 0

	lostCargo = ""
	lostCargoAmount = min(CargoAmount(-1), argument0)

	while lostCargoAmount > 0
	    {
	    cargoType = irandom(sprite_get_number(CargoSpr)-1)
	    if HasStored(cargoType, 1)
	        {
	        LoseCargo(cargoType, 1)
	        numberCargoLost[cargoType] ++
	        lostCargoAmount --
	        }
	    }
    
	for(i=0; i<array_length_1d(numberCargoLost); i++)
	    {
	    if numberCargoLost[i] > 0
	        lostCargo += string(numberCargoLost[i]) + " " + ItemRunner.cargoName[i] + "#"
	    }
    
	return lostCargo



}
