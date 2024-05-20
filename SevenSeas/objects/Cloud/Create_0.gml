/// @description Vars

image_index = irandom(image_number)
image_xscale = (random_range(0,1))*choose(-1, 1)
image_yscale = abs(image_xscale)
moveSpeed = random_range(0.1, 0.2)*abs(image_xscale)
image_speed = 0
image_alpha = random_range(0.85, 1)*sqrt(abs(image_xscale))

if place_meeting(x, y, Cloud)
	instance_destroy()


