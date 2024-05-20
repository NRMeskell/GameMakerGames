/// @description Draw self

testSize = 1.2
draw_sprite_ext(sprite_index, image_index + 2*selected, x, y, size, size, 0, c_white, 1)

if selected{
draw_set_font(CharacterCreator.mainFont)
draw_set_valign(fa_center)
draw_set_halign(fa_middle)
draw_set_color(make_color_rgb(192, 192, 0))
if image_index = 0
    draw_text_transformed(x, y, string_hash_to_newline("CASUAL COURSE"), size*testSize, size*testSize, 0)
else
    draw_text_transformed(x, y, string_hash_to_newline("PROFESSIONAL COURSE"), size*testSize, size*testSize, 0)
draw_set_font(CharacterCreator.mainFont)
}

