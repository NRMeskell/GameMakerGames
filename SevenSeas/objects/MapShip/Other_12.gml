/// @description Draw Path

moveTotal = 0

if !global.inPort{
	for(var i=0; i<1; i+=15/path_get_length(sailPath)){
		if path_position < i{
			var path_angle = point_direction(path_get_x(sailPath, i), path_get_y(sailPath, i), path_get_x(sailPath, i+0.1), path_get_y(sailPath, i+0.1))
			draw_sprite_ext(MapDotsSpr, 0, path_get_x(sailPath, i), path_get_y(sailPath, i), 1, 1, path_angle, c_white, 0.8)
		}
	}
    
}

draw_sprite_ext(MapMarkerSpr, 0, moveX, moveY, 1, 1, 0, -1, 1)   
///Draw Self
draw_self()
if !global.inPort {
    draw_sprite_ext(MapFlavorSpr, 3, x, y, image_xscale, 1, 0, -1, 1)
}
