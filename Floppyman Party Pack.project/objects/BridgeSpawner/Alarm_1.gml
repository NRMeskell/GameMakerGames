/// @description Spawn Car

if BridgeBridge.y == BridgeBridge.minLevel
    {
    instance_create(-100,-100,BridgeCar)
    }
    
alarm[1] = irandom_range(carRateMin, carRateMax)/global.timeDiff

