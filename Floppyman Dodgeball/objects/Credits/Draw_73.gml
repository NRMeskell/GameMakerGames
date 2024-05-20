/// @description Draw Self

draw_set_font(CharacterCreator.mainSmallFont)
draw_set_color(borderColor)
draw_rectangle(x-width-2, y-height-2, x+width+2, y+height+2, false)
draw_set_color(myColor)
draw_rectangle(x-width, y-height, x+width, y+height, false)
draw_set_color(c_black)
draw_rectangle(x-width, y-height, x+width, y+height, true)
draw_rectangle(x-width-2, y-height-2, x+width+2, y+height+2, true)

draw_set_color(textColor)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(x + drawX, y + drawY, string_hash_to_newline(textString))

