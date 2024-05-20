/// @description Move

rockAngle += rockSpeed
x += dcos(moveDir)*moveSpeed
y += dsin(moveDir)*moveSpeed

if (x > room_width + 100 or x < -100) or (y > room_height + 100 or y < -100)
    {
    if irandom(1) = 0
        {
        x = choose(-100, room_width + 100)
        y = irandom_range(-100, room_height + 100)
        }
    else
        {
        x = irandom_range(-100, room_width + 100)
        y = choose(-100, room_height + 100)
        }
        
    startX = x
    startY = y
    moveDir = irandom(360)
    if moveDir < 90 or moveDir > 270
        image_xscale = 1
    else
        image_xscale = -1
    }

