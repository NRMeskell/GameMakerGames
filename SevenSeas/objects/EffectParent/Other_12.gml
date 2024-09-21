/// @description Change sparkle

if team == "pirate"
    {
    sparkleX[i] = Ship.drawX + 0.75*irandom_range(-sprite_get_xoffset(Ship.hullDict[Ship.shipType]), sprite_get_width(Ship.hullDict[Ship.shipType]) - sprite_get_xoffset(Ship.hullDict[Ship.shipType]))
    sparkleY[i] = GetWaterLevel(Ship.middleWaves, Ship.drawX) - 0.75*irandom_range(0, sprite_get_height(Ship.hullDict[Ship.shipType]))
    }
else
    {
    sparkleX[i] = CombatRunner.placeX - 0.75*irandom_range(-sprite_get_xoffset(CombatRunner.myShipHull), sprite_get_width(CombatRunner.myShipHull) - sprite_get_xoffset(CombatRunner.myShipHull))
    sparkleY[i] = GetWaterLevel(Ship.middleWaves, CombatRunner.placeX) - 0.75*irandom_range(0, sprite_get_height(CombatRunner.myShipHull))
    }

