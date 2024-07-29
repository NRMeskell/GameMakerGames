/// @description Vars

sprite_index = choose(CloudSpr, CloudSpr, BigCloudSpr)
if global.weather == 2
	sprite_index = BigCloudSpr
else if global.weather == 0
	sprite_index = CloudSpr

image_index = irandom(image_number)
image_xscale = (random_range(0.5,1.0))*choose(-1, 1)
image_yscale = abs(image_xscale)
moveSpeed = random_range(0.10, 0.15)*abs(image_xscale)
image_speed = 0
image_alpha = random_range(0.85, 1)*sqrt(abs(image_xscale))+0.2


if place_meeting(x, y, Cloud)
	instance_destroy()


