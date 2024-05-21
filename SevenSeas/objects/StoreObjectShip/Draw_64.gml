var __b__;
__b__ = action_if_variable(preview, true, 0);
if __b__
{
{
///Draw info DONT

draw_sprite(CargoSheetPreviewSpr, 0, xWindow, yWindow)
draw_sprite(ShipIconSpr, myShipType, xWindow + 27, yWindow + 26)

draw_sprite(StatSymbolSpr, 3, xWindow + 40, yWindow + 88)
draw_sprite(StatSymbolSpr, 2, xWindow + 87, yWindow + 88)
draw_sprite(StatSymbolSpr, 6, xWindow + 134, yWindow + 88)

draw_set_valign(fa_center)
draw_set_color(c_black)
draw_set_halign(fa_left)
draw_text(xWindow + 59, yWindow + 26, string_hash_to_newline(name))
draw_set_halign(fa_center)
draw_text(xWindow + 87, yWindow + 47, string_hash_to_newline("Slots:"))

draw_text(xWindow + 40, yWindow + 112, string_hash_to_newline(myRigging))
draw_text(xWindow + 87, yWindow + 112, string_hash_to_newline(myCannons))
draw_text(xWindow + 134, yWindow + 112, string_hash_to_newline(myCargo))

draw_text_ext(xWindow + sprite_get_width(CargoSheetPreviewSpr)/2, yWindow + 182, string_hash_to_newline(description), 12, sprite_get_width(CargoSheetPreviewSpr) - 30)

draw_set_halign(fa_right)
draw_text(xWindow + 80, yWindow + 142, string_hash_to_newline(myHealth))
draw_text(xWindow + 138, yWindow + 142, string_hash_to_newline(maxCrew))

/*
if overClose
    draw_sprite(EndCombatSpr, 1, xWindow + sprite_get_width(CargoSheetPreviewSpr)-2, yWindow+2)
else
    draw_sprite(EndCombatSpr, 0, xWindow + sprite_get_width(CargoSheetPreviewSpr)-2, yWindow+2)
    

/* */
}
}
/*  */
