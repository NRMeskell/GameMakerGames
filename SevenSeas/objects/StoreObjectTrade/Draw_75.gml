/// @description Draw Self

var __b__;
__b__ = action_if_variable(preview, true, 0);
if __b__
{
{
///Draw info

draw_sprite(CargoSheetPreviewSpr, 1, xWindow, yWindow)
draw_sprite(StoreHealthSpr, type, xWindow + 27, yWindow + 30)

/*if overClose
    draw_sprite(EndCombatSpr, 1, xWindow + sprite_get_width(CargoSheetPreviewSpr)-2, yWindow+2)
else
    draw_sprite(EndCombatSpr, 0, xWindow + sprite_get_width(CargoSheetPreviewSpr)-2, yWindow+2)
*/  

draw_set_font(global.PirateFont)
draw_set_color(c_black)
draw_set_valign(fa_center)
draw_set_halign(fa_left)
draw_text(xWindow + 58, yWindow + 30, string_hash_to_newline("sell " + ItemRunner.cargoName[type]))

draw_set_halign(fa_center)
draw_text(xWindow + sprite_get_width(CargoSheetPreviewSpr)/2, yWindow + 58, string_hash_to_newline("amount:"))
draw_text(xWindow + sprite_get_width(CargoSheetPreviewSpr)/2, yWindow + 77, string_hash_to_newline(sellAmount))

draw_text_ext(xWindow + sprite_get_width(CargoSheetPreviewSpr)/2, yWindow + 150, string_hash_to_newline(description), 12, sprite_get_width(CargoSheetPreviewSpr) - 30)


/* */
}
}
/*  */
