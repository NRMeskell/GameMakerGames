/// @description Move about

direction += irandom_range(-180,180)

if direction > 360
    direction -= 360
if direction < 0
    direction += 360
    
if direction > 90 and direction < 270
    image_xscale = -1
else
    image_xscale = 1
    
alarm[0] = room_speed / 2

