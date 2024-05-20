/// @description Vars and look

image_speed = 0
image_xscale = choose(-1,1)
image_index = irandom(11)
depth = -y
Health = 12

Targeted = false

///Destroy if outside map

if x - sprite_width < 0 or y - sprite_height < 0 or x + sprite_width > room_width or y + sprite_height > room_height
    instance_destroy()

