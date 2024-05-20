/// @description Draw Text

draw_self()

draw_set_color(c_black)
draw_set_valign(fa_center)
draw_set_halign(fa_center)
draw_text(x, y - sprite_get_height(sprite_index)/2 + 20, string_hash_to_newline(storeName))

if totalCost == 0
    draw_text(x - sprite_get_width(sprite_index)/4 + 5, y + sprite_get_height(sprite_index)/2 - 12, string_hash_to_newline(leftButtonText))
else
    {
    draw_text(x - sprite_get_width(sprite_index)/4 + 5 - string_width(string_hash_to_newline(string(totalCost)))/2, y + sprite_get_height(sprite_index)/2 - 12, string_hash_to_newline(leftButtonText + ": ")) 
    draw_set_color(merge_color(c_yellow, c_black, 0.2))
    draw_text(x - sprite_get_width(sprite_index)/4 + 5 + string_width(string_hash_to_newline(leftButtonText + ": "))/2, y + sprite_get_height(sprite_index)/2 - 12, string_hash_to_newline(string_repeat("+", totalCost < 0) + string(abs(totalCost)))) 
    draw_set_color(c_black)
    }
    
draw_text(x + sprite_get_width(sprite_index)/4 - 5, y + sprite_get_height(sprite_index)/2 - 12, string_hash_to_newline(rightButtonText))

