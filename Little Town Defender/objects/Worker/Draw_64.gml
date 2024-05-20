/// @description Draw Select

if Selected = true
    {
    HealthGreen = make_colour_hsv(80,220,80)
        
    draw_sprite_ext(SelectedSpr, 0, MyHouse.x, MyHouse.y - MyHouse.sprite_height/2, 1, 1, 0, HealthGreen, 1)
    
    draw_sprite_ext(SelectedSpr, 0, x, y - sprite_height/2, 1, 1, 0, c_yellow, 1)
    
    if Task != "None"
        draw_sprite_ext(SelectedSpr, 1, MyTag.x - 1, MyTag.y, 1, 1, 0, c_yellow, 1)
    else
        draw_sprite_ext(SelectedSpr, 0, MyTag.x - 1, MyTag.y, 1, 1, 0, c_yellow, 1)
    }

///Draw Menu


depth = -1000
if Selected = true
    {
    draw_sprite_ext(MenuArea, 0, room_width - sprite_get_width(MenuArea)*MenuSize - Edge, room_height - sprite_get_height(MenuArea)*MenuSize - Edge, MenuSize, MenuSize, 0, c_white, 1)
    
    for(n=0; n < 3; n ++)
        {
        draw_sprite_ext(ButtonsSpr, 0, room_width - sprite_get_width(MenuArea)*MenuSize/2 - Edge, room_height - sprite_get_height(MenuArea)*MenuSize *(4-n-1)/5 - Edge, MenuSize, MenuSize, 0, c_white, 1)
        }
    //Draw This Buildings Stuff
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_color(c_black)
    draw_set_font(CaptionFont)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Worker"))
    draw_set_font(DisplayResourceFont)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace, string_hash_to_newline("Task:"))
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 3/5 - Edge + 1, string_hash_to_newline("Harvest"))
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/5 - Edge + 2, string_hash_to_newline("Mine")) 
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 1/5 - Edge + 2, string_hash_to_newline("Build")) 
    draw_set_valign(fa_top)
    }
    
depth = - y 

