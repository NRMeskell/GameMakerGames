/// @description Creation

image_xscale = random_range(0.8,1.2)*choose(-1, 1)
image_yscale = abs(image_xscale)
image_index = irandom(image_number -1)
image_speed = 0

myspeed = random_range(0.2, 0.4)

if global.gameMode == "golf" and irandom(1){
	frontCloud = true
	image_alpha = 0.5
}
else
	frontCloud = false

