/// @description Draw Frame

if !instance_exists(Defeat){
    if overClose
        {
        draw_sprite_ext(MapFrameSpr, 1, miniX - 7, miniY+drawMiniHeight-1, 1, 1, 0, merge_colour(c_white, c_gray, overClose/10) , 1)
        draw_sprite_part_ext(MapFrameSpr, 0, 0, 0, sprite_get_width(MapFrameSpr), drawMiniHeight + 20, miniX - 7, miniY-20, 1, 1, merge_colour(c_white, c_gray, overClose/10) , 1)
        }
    else
        {
        draw_sprite_ext(MapFrameSpr, 1, miniX - 7, miniY+drawMiniHeight-1, 1, 1, 0, -1, 1)
        draw_sprite_part(MapFrameSpr, 0, 0, 0, sprite_get_width(MapFrameSpr), drawMiniHeight + 20, miniX - 7, miniY-20)
        }
}

///Draw Map View

if surface_exists(surf)
    {
    draw_surface_stretched(surf, __view_get( e__VW.XPort, 1 ), __view_get( e__VW.YPort, 1 ), __view_get( e__VW.WPort, 1 ), __view_get( e__VW.HPort, 1 ))
    }

///Draw conquer Button

if !instance_exists(Defeat)
    draw_sprite(ConquerSpr, overConquer, conquerButtonX, conquerButtonY)


