/// @description Move

x = Ship.drawX + placeX
y = GetWaterLevel(Ship.middleWaves, x)
image_angle = GetWaterAngle(Ship.middleWaves, x)

if x < -1000
    instance_destroy()


