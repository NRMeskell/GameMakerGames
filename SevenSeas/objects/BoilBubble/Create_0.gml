/// @description Vars

myPath = path_start(SleepingPath, 0.2, path_action_continue, false)
path_position = random(1)
path_speed = random_range(1, 2)
image_speed = 0

var waterColor = merge_color(WaveController.oceanColor[? global.seaNames[0]], WaveController.oceanColor[? global.seaType], (Volcano.myVar+1)/3)
image_blend = make_color_hsv(colour_get_hue(waterColor), colour_get_saturation(waterColor), (color_get_value(waterColor)+colour_get_value(Clock.skyColor))/2)

popPlace = GetWaterLevel(Ship.middleWaves, x)
alarm[0] = irandom(room_speed)

placeX = 0
floatAway = false

myLight = noone

mySound = noone

image_angle = irandom_range(-10,10)

