/// @description Srink

image_xscale = image_xscale * 0.9
image_yscale = image_yscale * 0.9

if image_yscale <= 0
    instance_destroy()

