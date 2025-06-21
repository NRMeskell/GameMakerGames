/// @description Move to place

image_angle = GetWaterAngle(Ship.middleWaves, placeX) 

if floatAway{
    placeX -= 0.2*(Ship.middleWaves.waveSpeeds[0]/2)*!global.mapPause*max(1, global.doTime*global.gameRate)
    placeY *= 1.012*max(1, global.doTime*global.gameRate)
    image_angle -= placeY*0.9
    }
	
x = Ship.drawX + placeX
y = GetWaterLevel(Ship.middleWaves, x) + placeY

