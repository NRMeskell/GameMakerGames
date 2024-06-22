/// @description Draw Path

moveTotal = 0

if !global.inPort
    {
    n = path_get_number(sailPath)
    
    for(i=0; i<n-1; i++)
        {
        px1 = path_get_point_x(sailPath, i)
        px2 = path_get_point_x(sailPath, i+1)
        py1 = path_get_point_y(sailPath, i)
        py2 = path_get_point_y(sailPath, i+1)
        
        //dis = point_distance(px1, py1, px2, py2)
        dir = point_direction(px1, py1, px2, py2)
        
        if i/path_get_number(sailPath) >= (path_position) and (i mod 4) = 0
            {
            draw_sprite_ext(MapDotsSpr, 0, px1, py1, 1, 1, dir, -1, 1)
            }
        }
    }

draw_sprite_ext(MapMarkerSpr, 0, moveX, moveY, 1, 1, 0, -1, 1)   
///Draw Self
draw_self()
if !global.inPort {
    draw_sprite_ext(MapFlavorSpr, 3, x, y, image_xscale, 1, 0, -1, 1)
}
