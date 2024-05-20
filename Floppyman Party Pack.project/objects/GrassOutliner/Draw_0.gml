/// @description Draw grass w/ outline

if drawOutline{
    drawOutline = false;
    grass = surface_create(room_width, room_height)
    surface_set_target(other.grass)
    for(i=0; i<room_height; i++){
        with GrassDrawer
            if y = other.i {draw_sprite(sprite_index, image_index, x, y)}
        }     
    grassSprite = sprite_create_from_surface(grass, 0, 0, room_width, room_height, false, false, 0, 0)
    surface_reset_target()
    surface_free(grass)
}

draw_sprite_ext(grassSprite, 0, -1, 0, 1, 1, 0, c_black, 1)
draw_sprite_ext(grassSprite, 0, 1, 0, 1, 1, 0, c_black, 1)

draw_sprite_ext(grassSprite, 0, 0, -1, 1, 1, 0, c_black, 1)
draw_sprite_ext(grassSprite, 0, 0, 1, 1, 1, 0, c_black, 1)

draw_sprite(grassSprite, 0, 0, 0)


