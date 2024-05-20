/// @description Pirate Ship

startX = x
startY = y

moveDir = irandom(360)
moveSpeed = 0.2
rockAngle = 0
rockSpeed = 0.015
rockMax = 10

if moveDir < 90 or moveDir > 270
    image_xscale = 1
else
    image_xscale = -1

