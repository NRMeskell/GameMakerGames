/// @description Draw Self
var __b__;
if viewed
    {
    draw_sprite(StoreItemSpr, (overButton or previewSelect) + selected*2, drawX, drawY)
    
    if hidden = false
        {
        DrawItem(spriteIndex, itemNumber, myColor, drawX-13, drawY-13, 0, 0, sprite_get_width(spriteIndex), sprite_get_height(spriteIndex))
        }
    else
        draw_sprite(StoreHealthSpr, 2, drawX, drawY)
    
    draw_set_valign(fa_center)
    draw_set_halign(fa_left)
    draw_set_color(c_black)
    maxLen = 11
    if string_length(itemName) < maxLen
        draw_text(drawX + 25, drawY, string_hash_to_newline(itemName))
    else
        draw_text(drawX + 25, drawY, string_hash_to_newline(string_copy(itemName, 0, (maxLen - 4) + (string_char_at(itemName, maxLen - 3) != " ")) + "..."))
        
    draw_set_color(merge_color(c_yellow, c_black, 0.2))
    draw_set_halign(fa_right)
    if cost != 0
        draw_text(drawX + sprite_get_width(sprite_index) - 50, drawY, string_hash_to_newline(cost))

    }


