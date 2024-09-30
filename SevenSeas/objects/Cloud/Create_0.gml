/// @description Vars

sprite_index = CloudSpr
if global.weather == 2
	sprite_index = BigCloudSpr
else if global.weather == 0
	sprite_index = CloudSpr

image_index = irandom(image_number)
moveSpeed = random_range(0.10, 0.15)*(1+image_index)/5
image_speed = 0
image_alpha = random_range(0.3, 7.0)


if place_meeting(x, y, Cloud)
	instance_destroy()


