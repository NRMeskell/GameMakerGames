/// @description Draw self and shadows

door = object_is_ancestor(object_index, Door)
if x>=0 and x<room_width and y>=0 and y<room_height{
    draw_sprite_shear(sprite_index, image_index, x+(sprite_width)*0.1-door, y+(16-2*door)*(1+0.5), 0.2, 0, 1, -0.5, c_black, 0.1)
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, myColor, 1)
    
    if !place_meeting(x,y+10, Wall) and !door{
        near = instance_nearest(x,y,GroundTile)
        draw_sprite_ext(GroundPepplesSpr, near.image_index, x+sprite_width/2, y+14, near.image_xscale, 1, 0, c_white, 1) 
        }
}

