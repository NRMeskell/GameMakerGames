/// @description Draw Self
//draw text backing

draw_sprite(sprite_index, image_number-1, x, y)

draw_set_color(merge_color(c_gray, c_black, 0.2))
draw_set_color(make_color_rgb(182,154,8))
draw_set_font(global.LargePirateFont)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
//draw text

a = ds_list_size(firstNames)
b = ds_list_size(lastNames)

//draw_text_transformed(x - 47, y + drawFirstY - 2*drawDistance, ds_list_find_value(firstNames, (currentFirst + 2 + a)%a), 1.2, 1.2, 0)
draw_text_transformed(x - 47, y + drawFirstY - drawDistance, string_hash_to_newline(ds_list_find_value(firstNames, (currentFirst + 1 + a)%a)), 1.2, 1.2, 0)
draw_text_transformed(x - 47, y + drawFirstY, string_hash_to_newline(ds_list_find_value(firstNames, currentFirst)), 1.2, 1.2, 0)
draw_text_transformed(x - 47, y + drawFirstY + drawDistance, string_hash_to_newline(ds_list_find_value(firstNames, (currentFirst - 1 + a)%a)), 1.2, 1.2, 0)
//draw_text_transformed(x - 47, y + drawFirstY + 2*drawDistance, ds_list_find_value(firstNames, (currentFirst - 2 + a)%a), 1.2, 1.2, 0)

//draw_text_transformed(x + 48, y + drawSecondY - 2*drawDistance, ds_list_find_value(lastNames, (currentLast + 2 + b) % b), 1.2, 1.2, 0)
draw_text_transformed(x + 48, y + drawSecondY - drawDistance, string_hash_to_newline(ds_list_find_value(lastNames, (currentLast + 1 + b) % b)), 1.2, 1.2, 0)
draw_text_transformed(x + 48, y + drawSecondY, string_hash_to_newline(ds_list_find_value(lastNames, currentLast)), 1.2, 1.2, 0)
draw_text_transformed(x + 48, y + drawSecondY + drawDistance, string_hash_to_newline(ds_list_find_value(lastNames, (currentLast - 1 + b) % b)), 1.2, 1.2, 0)
//draw_text_transformed(x + 48, y + drawSecondY + 2*drawDistance, ds_list_find_value(lastNames, (currentLast - 2 + b) % b), 1.2, 1.2, 0)

//draw rest of image
draw_sprite(sprite_index, image_index, x, y)
draw_text(x, y - 81, string_hash_to_newline("Choose Ship Name"))
draw_set_color(merge_color(c_red, c_gray, 0.4))
draw_text(x-58, y + 82, string_hash_to_newline("return"))
draw_set_color(c_green)
draw_text(x+58, y + 82, string_hash_to_newline("confirm"))

