/// @description Draw Circle

color = make_color_rgb(0,179,0)

if r < room_width+room_height
    {
    var inner_radius = r - 10;
    var thickness = 16;
    var segments = 50;
    var jadd = 360/segments;
    
    //Create Clouds
    for (var j = 0; j <= 360; j+=jadd){
        if irandom(room_width div r) = 0
            with instance_create(x+lengthdir_x(inner_radius+thickness, j + random(jadd)), y+sprite_get_height(WhiteSpiritSpr)/2+lengthdir_y(inner_radius+thickness,j + random(jadd)), Cloud)
                {
                image_blend = choose(c_white, c_black, c_red, c_aqua, c_lime, c_orange, c_purple, c_yellow)
                image_index = 2+irandom(2)
                shrinkSpeed = 16
                image_speed = 0
                image_angle = choose(0,90,180,270)
                move_towards_point(other.x, other.y, -1)
                depth = 0
                }
        }
    
        
    //draw black outline
    draw_primitive_begin(pr_trianglestrip);
    for (var j = 0; j <= 360; j+=jadd)
        {
        draw_set_color(c_black)
        draw_vertex(x+lengthdir_x(inner_radius,j),y+sprite_get_height(WhiteSpiritSpr)/2+lengthdir_y(inner_radius,j));
        draw_vertex(x+lengthdir_x(inner_radius+thickness + 1,j),y+sprite_get_height(WhiteSpiritSpr)/2+lengthdir_y(inner_radius+thickness + 1,j));
        }
    draw_primitive_end();

    //Draw shaded areas
    for(c=0; c<1; c+=0.25){
        draw_primitive_begin(pr_trianglestrip);
        for (var j = 0; j <= 360; j+=jadd)
            {
            draw_set_color(merge_color(c_ltgray, color, 1-c));
            draw_vertex(x+lengthdir_x(inner_radius+thickness*c,j),y+sprite_get_height(WhiteSpiritSpr)/2+lengthdir_y(inner_radius+thickness*c,j));
            draw_vertex(x+lengthdir_x(inner_radius+thickness*(c+0.25),j),y+sprite_get_height(WhiteSpiritSpr)/2+lengthdir_y(inner_radius+thickness*(c+0.25),j));
            }
        draw_primitive_end();
        }
    }

///Draw self

draw_sprite_ext(RainbowSpiritSpr, shadeImage div 1, x, y, image_xscale, 1, 0, c_white, 1)
draw_sprite_ext(SpiritShadeSpr, shadeImage div 1, x, y, image_xscale, 1, 0, c_black, 1)
draw_sprite_ext(SpiritShadeSpr, (shadeImage + 3 * 2) div 1, x, y, image_xscale, 1, 0, c_black, 0.7)

