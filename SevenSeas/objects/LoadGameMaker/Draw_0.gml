/// @description Draw Self

if (view_current == 0)
{
//draw text backing
draw_sprite(sprite_index, image_index, x, y)

//draw buttons
for(i=buttonPos; i<min(ds_list_size(myGames), buttonPos + 4); i++){
    draw_sprite(LoadGameButtonSpr, overButton[i] + 2*overTrash[i], x - buttonAlign, y - buttonStartY + buttonDistance*(i-buttonPos))
    draw_set_font(global.LargePirateFont)
    draw_set_halign(fa_left)
    draw_set_valign(fa_center)
    draw_set_color(merge_color(c_gray, c_ltgray, 0.2))
    draw_text_transformed(x - buttonAlign, y - buttonStartY + buttonDistance*(i-buttonPos), string_hash_to_newline(ds_list_find_value(myGames, i)), 1, 1, 0)
    }
 
draw_set_font(global.LargePirateFont)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(make_color_rgb(182,154,8))
draw_text(x, y - 96, string_hash_to_newline("Load Game"))
draw_set_color(merge_color(c_red, c_gray, 0.4))
draw_text(x, y + 104, string_hash_to_newline("return"))
}
