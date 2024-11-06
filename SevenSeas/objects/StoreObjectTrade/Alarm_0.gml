/// @description Vars

if CargoAmount(type) == 0
	maxAmount = irandom(9) + 1
else
	maxAmount = 1

if type == 1 or type == 7
    {
    sellAmount = max(maxAmount, CargoAmount(1))
    amount = irandom_range(sellAmount*(ItemRunner.cargoCost[1]*0.9) div 1, 1.5*sellAmount*ItemRunner.cargoCost[1])
    }
else
    {
    sellAmount = max(maxAmount, choose(CargoAmount(type) div 2, CargoAmount(type)))
    amount = max(1, irandom_range(sellAmount*(ItemRunner.cargoCost[type]*0.75) div 1, sellAmount*ItemRunner.cargoCost[type]*0.8 div 1))
    }
    
name = string(sellAmount) + " " + ItemRunner.cargoName[type]
description = "sell " + string(sellAmount) + " " + ItemRunner.cargoName[type] + " to the trader for " + string(amount) + " gold"

