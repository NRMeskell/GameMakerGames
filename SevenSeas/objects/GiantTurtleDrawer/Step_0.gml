/// @description Move to place

image_angle = GetWaterAngle(Ship.middleWaves, placeX) 

if floatAway{
    placeX += 0.25*((Ship.waveShipSpeed + Ship.landSpeed)*!global.mapPause*Ship.rockScale*1.8 * global.gameSpeed)
    placeY *= 1.012
    image_angle -= placeY*0.9
    }
	
x = Ship.drawX + placeX
y = GetWaterLevel(Ship.middleWaves, x) - 30 + placeY

