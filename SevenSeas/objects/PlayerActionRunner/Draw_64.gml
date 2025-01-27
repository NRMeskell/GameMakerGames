var __b__;
__b__ = action_if_variable(instance_exists(Defeat), false, 0);
if __b__
{
///draw self

if __view_get( e__VW.XView, 0 ) = 0
    draw_sprite_ext(sprite_index, image_index + (!canUseActions)*4, x, y, 1, 1, 0, c_white, 1)	
}
