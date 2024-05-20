var __b__;
__b__ = action_if_variable(CharacterCreator.inMenu, true, 0);
if __b__
{
///Draw

{

draw_self()
if overRight
    draw_sprite_ext(BallArrowSpr, 0, x + xButtonWidth, y, 1, 1, 0, c_ltgray, 1)
else
    draw_sprite_ext(BallArrowSpr, 0, x + xButtonWidth, y, 1, 1, 0, c_white, 1)
    
if overLeft
    draw_sprite_ext(BallArrowSpr, 0, x - xButtonWidth, y, -1, 1, 0, c_ltgray, 1)
else
    draw_sprite_ext(BallArrowSpr, 0, x - xButtonWidth, y, -1, 1, 0, c_white, 1)
    
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

displayString = string_upper(rateName[buttonNumber])

draw_text(x, y, string_hash_to_newline(displayString))
}

}
