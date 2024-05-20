/// @description Draw self

testSize = 1.25

if startable
    {
    draw_sprite_ext(GameModeSpr, image_index, x, y, size, size, 0, c_white, 1)
    draw_set_font(CharacterCreator.mainFont)
    draw_set_valign(fa_center)
    draw_set_halign(fa_middle)
    draw_set_color(make_color_rgb(192, 192, 0))
    if image_index = 0
        draw_text_transformed(x, y, string_hash_to_newline("DODGEBALL"), size*testSize, size*testSize, 0)
    else if image_index = 1
        draw_text_transformed(x, y, string_hash_to_newline("RACE GOLF"), size*testSize, size*testSize, 0)
    else
        draw_text_transformed(x, y, string_hash_to_newline("SECRET MODE#(coming soon!)"), size*testSize, size*testSize, 0)
    }
else
    {
    draw_sprite_ext(GameModeSpr, image_index, x, y, size, size, 0, c_ltgray, 1)
    draw_set_font(CharacterCreator.mainFont)
    draw_set_valign(fa_center)
    draw_set_halign(fa_middle)
    draw_set_color(c_gray)
    if image_index = 0
        draw_text_transformed(x, y, string_hash_to_newline("DODGEBALL"), size*testSize, size*testSize, 0)
    else if image_index = 1
        draw_text_transformed(x, y, string_hash_to_newline("RACE GOLF"), size*testSize, size*testSize, 0)
    else
        draw_text_transformed(x, y, string_hash_to_newline("SECRET MODE#(coming soon!)"), size*testSize, size*testSize, 0)
    
    }
draw_set_font(CharacterCreator.mainFont)

