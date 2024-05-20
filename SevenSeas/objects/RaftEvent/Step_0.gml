/// @description Move

image_angle = GetWaterAngle(Ship.middleWaves, x)
x = Ship.drawX + placeX
y = GetWaterLevel(Ship.middleWaves, x)


if x < -100
    instance_destroy()


