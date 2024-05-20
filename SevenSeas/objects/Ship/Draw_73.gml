var __b__;
__b__ = action_if_variable(view_current, 0, 0);
if __b__
{
{
///Draw Front Waves
with frontWaves
	event_user(0)

///Draw Port/Land Front
with PortDrawerFront
    {
    myLayer = 4
    event_user(1)
    }

with DrawPort
    if mySlot = 1 and x != -50
        {
        DrawWithLighting(sprite_index, Ship.animate, x, y, 0, c_white, 1, 4)
        DrawLandMenu()
        }

        
with PortDrawerFront
    {
    myLayer = 4
    event_user(0)
    }
}
}
