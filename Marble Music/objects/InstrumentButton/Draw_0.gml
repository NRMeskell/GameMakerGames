/// @description Draw Self


draw_set_color(hovering ? c_ltgray : c_gray)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_sprite_ext(sprite_index, SoundController.instrument, x, y, image_xscale, image_yscale, image_angle, hovering ? c_white : c_ltgray, 1)
