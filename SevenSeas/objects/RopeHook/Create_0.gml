/// @description vars


if id != instance_find(RopeHook, 0){
	instance_destroy(instance_find(RopeHook, 0))
	image_index = irandom_range(30, 35)
}else
	image_index = 16

image_speed = 0.2
