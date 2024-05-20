/// @description Vars

image_speed = 0

startable = false
size = 1

if image_index == 0 and global.firstHole == NewMap1
	selected = true
else if image_index == 1 and global.firstHole == GolfMap1B
	selected = true
else
	selected = false

color = c_white

myY = y
y += irandom_range(500, 1000)


