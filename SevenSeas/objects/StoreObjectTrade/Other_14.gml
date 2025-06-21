/// @description Vars

var tempAmount;

if CargoAmount(type) == 0
	tempAmount = irandom(5) + 1
else
	tempAmount = 1

if type == 1
    {
    sellAmount = max(tempAmount, CargoAmount(1))
    amount = irandom_range(sellAmount*(ItemRunner.cargoCost[1]*0.9), 1.1*sellAmount*ItemRunner.cargoCost[1])
    }
else if type == 7
    {
    sellAmount = max(tempAmount, CargoAmount(7))
    amount = irandom_range(sellAmount*(ItemRunner.cargoCost[1]*0.9), 1.1*sellAmount*ItemRunner.cargoCost[1])
    }
else
    {
    sellAmount = max(tempAmount, choose(CargoAmount(type) div 2, CargoAmount(type)))
    amount = max(1, irandom_range(sellAmount*(ItemRunner.cargoCost[type])*0.85 div 1, sellAmount*ItemRunner.cargoCost[type]))
    }
	
sellAmount = min(sellAmount, global.storeSize[type]) 
name = string(sellAmount) + " " + ItemRunner.cargoName[type]
description = "sell " + string(sellAmount) + " " + ItemRunner.cargoName[type] + " to the trader for " + string(amount) + " gold"

