/// @description Create

image_index = 0
image_speed = 0

occupied = false
damaged = false

myPicture = ds_map_create()
ds_map_add(myPicture, "wheel", 0)
ds_map_add(myPicture, "rigging", 2)
ds_map_add(myPicture, "cannon", 3)
ds_map_add(myPicture, "medical", 4)
ds_map_add(myPicture, "bed", 5)
ds_map_add(myPicture, "cargo", 6)

