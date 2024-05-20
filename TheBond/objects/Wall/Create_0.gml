/// @description Vars

x = (x div 16) * 16
y = (y div 16) * 16

if place_meeting(x, y, Wall)
	instance_destroy()

b0 = place_meeting(x-5, y, Wall)
b1 = place_meeting(x, y-5, Wall)
b2 = place_meeting(x+5, y, Wall)
b3 = place_meeting(x, y+5, Wall)

image_index = 1*b0 + 2*b1 + 4*b2 + 8*b3
image_speed = 0 

