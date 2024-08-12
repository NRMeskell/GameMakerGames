/// @description Draw Self


var __b__;
__b__ = action_if_variable(preview, true, 0);
if __b__
{
{
///Draw info

draw_sprite(CargoSheetPreviewSpr, 1, xWindow, yWindow)
draw_sprite(StoreVictorySpr, itemType, xWindow + 27, yWindow + 30)

/*if overClose
    draw_sprite(EndCombatSpr, 1, xWindow + sprite_get_width(CargoSheetPreviewSpr)-2, yWindow+2)
else
    draw_sprite(EndCombatSpr, 0, xWindow + sprite_get_width(CargoSheetPreviewSpr)-2, yWindow+2)
*/

draw_set_font(global.PirateFont)
draw_set_color(c_black)
draw_set_valign(fa_center)
draw_set_halign(fa_left)
draw_text(xWindow + 58, yWindow + 30, string_hash_to_newline(previewName))

draw_set_halign(fa_center)
draw_text(xWindow + sprite_get_width(CargoSheetPreviewSpr)/2, yWindow + 58, string_hash_to_newline("amount:"))
draw_text(xWindow + sprite_get_width(CargoSheetPreviewSpr)/2, yWindow + 77, string_hash_to_newline(amount))

draw_text_ext(xWindow + sprite_get_width(CargoSheetPreviewSpr)/2, yWindow + 150, string_hash_to_newline(description), 12, sprite_get_width(CargoSheetPreviewSpr) - 16)


/* */
}
}
/*  */




if viewed
    {
    draw_sprite(StoreItemSpr, (overButton or previewSelect) + selected*2, drawX, drawY)
    
    draw_sprite(StoreVictorySpr, itemType, drawX, drawY)
    
    draw_set_valign(fa_center)
    draw_set_halign(fa_left)
    draw_set_color(c_black)
    draw_text(drawX + 25, drawY, string_hash_to_newline(string_copy(name, 0, min(string_length(name), 10))))
    
    draw_set_color(merge_color(c_yellow, c_black, 0.2))
    draw_set_halign(fa_right)
    if cost != 0
        draw_text(drawX + sprite_get_width(sprite_index) - 50, drawY, string_hash_to_newline(cost))
    }


