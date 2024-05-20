var __b__;
__b__ = action_if_variable(CharacterCreator.inMenu, true, 0);
if __b__
{
///Draw self

draw_sprite(StageButtonSpr, selected + ((selected*(current_time/100)) mod (image_number-1)), x, y)
if selected
    draw_set_color(c_white)
else
    draw_set_color(c_ltgray)
    
draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_text(x + 26, y, string_hash_to_newline(name))


}
