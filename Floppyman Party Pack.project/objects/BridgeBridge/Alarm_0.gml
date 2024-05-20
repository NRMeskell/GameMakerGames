/// @description Move Bridge

if (y == minLevel or y == maxLevel) and !instance_exists(BridgeCar)
    {
    if y == minLevel
        {
        moving = -1
        alarm[0] = bridgeUpTime*random_range(0.75, 1.25)/global.timeDiff
        }  
    else if y == maxLevel
        {
        moving = 1
        alarm[0] = bridgeDownTime*random_range(0.75, 1.25)/global.timeDiff
        }
    }
else 
    alarm[0] = 5

