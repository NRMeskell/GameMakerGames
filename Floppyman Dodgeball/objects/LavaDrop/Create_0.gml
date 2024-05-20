/// @description Change image

image_index = irandom(image_number-1)
image_speed = 0
fire = false
physics_apply_impulse(x, y, random_range(-0.001, 0.001), random_range(-0.001,-0.004))
image_blend = choose(c_red, c_orange, c_black, c_red, c_yellow)

