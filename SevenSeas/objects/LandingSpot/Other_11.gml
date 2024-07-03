/// @description Draw Self

/*if !visited and myIndex != 1
    sprite_index = UnknownStopSpr
else*/


image_index = myIndex
if visited or image_index = 1
	sprite_index = StopSpr
else
	sprite_index = UnknownStopSpr

if released{
	visible = true
    dir = point_direction(x, y, checkX, checkY)
    draw_sprite_general(MapFlavorSpr, 1, 0, 0, point_distance(x, y, checkX, checkY), sprite_get_height(MapFlavorSpr), x - sin(degtorad(dir))*sprite_get_height(MapFlavorSpr)/2, y-cos(degtorad(dir))*sprite_get_height(MapFlavorSpr)/2, 1, 1, dir, -1, -1, -1, -1, 1) 
    draw_sprite_ext(MapFlavorSpr, 2, checkX, checkY, drawSize, drawSize, 0, -1, 1)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*drawSize, drawSize, visited, -1, 1)
    if sprite_index == UnknownStopSpr {
        draw_set_color(make_color_rgb(75,35,0))
        draw_set_font(global.LargePirateFont)
        draw_set_halign(fa_center)
        draw_set_valign(fa_center)
        draw_text_transformed(x + (image_xscale == 1), y-(11)*drawSize, string_hash_to_newline("?"), 0.8*drawSize, 0.8*drawSize, 5*image_xscale)
    }
    
    draw_set_font(global.PirateFont)
    draw_sprite_ext(MapFlavorSpr, 0, x, y + (sprite_get_height(StopSpr)-20), image_xscale*drawSize, drawSize, 0, -1, 1)  
}