/// @description Creation of Marble
// You can write your code in this editor

mySpotX = x
mySpotY = y

image_index = irandom(image_number-1)
readyToTrack = true
image_blend = merge_color(c_ltgray, choose(c_fuchsia, c_green, c_blue, c_orange, c_white, c_yellow, c_maroon), 0.3)
image_xscale = choose(-1, 1)
image_yscale = choose(-1, 1)

depth = 10