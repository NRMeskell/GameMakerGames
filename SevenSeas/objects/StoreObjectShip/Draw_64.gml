var __b__;
__b__ = action_if_variable(preview, true, 0);
if __b__
{
{
///Draw info DONT

draw_sprite(CargoSheetPreviewSpr, 0, xWindow, yWindow)
draw_sprite(ShipIconSpr, myShipType, xWindow + 27, yWindow + 26)

draw_sprite(StatSymbolSpr, 3, xWindow + 54, yWindow + 67)
draw_sprite(StatSymbolSpr, 2, xWindow + 95, yWindow + 67)
draw_sprite(StatSymbolSpr, 6, xWindow + 54, yWindow + 106)
draw_sprite(StatSymbolSpr, 9, xWindow + 95, yWindow + 106)

draw_set_valign(fa_center)
draw_set_color(c_black)
draw_set_halign(fa_left)
draw_text(xWindow + 59, yWindow + 26, string_hash_to_newline(name))
draw_set_halign(fa_center)
draw_text(xWindow + 87, yWindow + 51, string_hash_to_newline("Slots:"))

draw_text(xWindow + 36, yWindow + 81, string_hash_to_newline(myRigging))
draw_text(xWindow + 138, yWindow + 81, string_hash_to_newline(myCannons))
draw_text(xWindow + 36, yWindow + 120, string_hash_to_newline(myBeds))
draw_text(xWindow + 138, yWindow + 120, string_hash_to_newline(myCargo))

draw_text_ext(xWindow + sprite_get_width(CargoSheetPreviewSpr)/2, yWindow + 189, string_hash_to_newline(description), 12, sprite_get_width(CargoSheetPreviewSpr) - 30)

draw_set_halign(fa_right)
draw_text(xWindow + 80, yWindow + 152, string_hash_to_newline(myHealth))
draw_text(xWindow + 138, yWindow + 152, string_hash_to_newline(maxCrew))

/*
if overClose
    draw_sprite(EndCombatSpr, 1, xWindow + sprite_get_width(CargoSheetPreviewSpr)-2, yWindow+2)
else
    draw_sprite(EndCombatSpr, 0, xWindow + sprite_get_width(CargoSheetPreviewSpr)-2, yWindow+2)
    

/* */
}
}
/*  */
