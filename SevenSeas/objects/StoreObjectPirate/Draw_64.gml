var __b__;
__b__ = action_if_variable(preview, true, 0);
if __b__
{
{
///Draw preview Pirate

draw_sprite_ext(PirateSheetPreviewSpr, 0, xWindow, yWindow, size, size, 0, c_white, 1)

/*if overClose
    draw_sprite(EndCombatSpr, 1, xWindow + sprite_get_width(PirateSheetSpr)-2, yWindow+2)
else
    draw_sprite(EndCombatSpr, 0, xWindow + sprite_get_width(PirateSheetSpr)-2, yWindow+2)
*/
if !surface_exists(fullPirateSurface){
	fullPirateSurface = surface_create(sprite_get_width(PirateManSkinSpr), sprite_get_height(PirateManSkinSpr))
	MakePirateSurface(fullPirateSurface, 0, 0)
}	
DrawPirateSurface(fullPirateSurface, xWindow + xPicture, yWindow + yPicture)

/* */
///Draw Name Menu

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_black)
draw_set_font(global.PirateFont)

draw_text_transformed(xWindow+(sprite_get_width(PirateSheetSpr)/2)*size, yWindow+19*size, string_hash_to_newline(name), size, size, 0)

/* */
///Draw Backstory

draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_black)
draw_text_ext(xWindow + sprite_get_width(PirateSheetPreviewSpr)/2, yWindow + 200, string_hash_to_newline(backstory), 12, sprite_get_width(PirateSheetPreviewSpr) - 30) 

draw_set_font(global.PirateFont)

/* */
}
}
/*  */
