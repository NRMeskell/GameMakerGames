/// @description Draw basic ship

if view_current == 0{
	placeX = Ship.drawX + farDistance - currentDistance*0.75
	placeY = sinkY + GetWaterLevel(Ship.middleWaves, placeX)
	rockAngle = sinkRotate + GetWaterAngle(Ship.middleWaves, placeX)

	DrawShip(myShipHull, round((1-myHealth/maxHealth)*2), placeX, placeY, rockAngle/2, c_white, flagSprite, flagColor, 2)
}
