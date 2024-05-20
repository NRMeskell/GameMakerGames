/// @description Draw self

draw_self()


draw_set_font(CharacterCreator.mainFont)
draw_sprite_ext(ExitSpr, 0, x, y, size, size, 0, color, 1)
draw_set_valign(fa_center)
draw_set_halign(fa_middle)
draw_set_color(make_color_rgb(192, 192, 0))
draw_text_transformed(x, y, string_hash_to_newline("MAIN MENU"), size*1.25, size*1.25, 0)
draw_set_font(CharacterCreator.mainFont)

