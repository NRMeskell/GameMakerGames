/// @description Draw Self
// You can write your code in this editor

image_index = (image_angle div 30)*image_xscale*image_yscale
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
draw_sprite_ext(MarbleColorSpr, image_index, x, y, image_xscale, image_yscale, 0, image_blend, 1)
draw_sprite_ext(MarbleShadingSpr, 0, x, y, 1, 1, 0, c_white, 0.5)