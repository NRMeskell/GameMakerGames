//Set Timer To New Ball

alarm[0] = 5/global.timeDiff
if global.golfBall < 5
	image_index = global.golfBall
else
	image_index = irandom(4)
image_speed = 0