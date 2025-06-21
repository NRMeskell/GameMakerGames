/// @description Draw Self


draw_sprite_ext(MenuButtonSpr, myIndex + overButton, x, y, image_xscale, image_yscale, 0, c_white, 1)
draw_set_color(merge_color(make_color_rgb(182,154,8), c_black, overButton*0.2))
draw_set_font(global.LargePirateFont)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

draw_text_transformed(x, y, string_hash_to_newline(name), image_xscale + (myIndex=0)*0.4, image_yscale + (myIndex=0)*0.4, 0)

