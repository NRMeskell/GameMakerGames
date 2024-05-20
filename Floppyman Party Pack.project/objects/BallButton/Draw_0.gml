var __b__;
__b__ = action_if_variable(CharacterCreator.inMenu, true, 0);
if __b__
{
///Draw self

{
    draw_sprite_ext(BallButtonSpr, selected, x, y, 1, 1, 0, c_white, 1)
    if selected
        drawColor = c_white
    else
        drawColor = c_ltgray
        
    draw_sprite_ext(DodgeBallSpr, sprite, x, y + cos((current_time/500 + bounceOffset))*0.5, 1, 1, 90, drawColor, 1)
    }



}
