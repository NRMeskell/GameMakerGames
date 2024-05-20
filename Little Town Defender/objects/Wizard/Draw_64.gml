/// @description Draw Menu

depth = -1000
if Selected = true
    {
    draw_sprite_ext(MenuArea, 0, room_width - sprite_get_width(MenuArea)*MenuSize - Edge, room_height - sprite_get_height(MenuArea)*MenuSize - Edge, MenuSize, MenuSize, 0, c_white, 1)
    
    //Draw This Buildings Stuff
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_color(c_black)
    draw_set_font(CaptionFont)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Wizard"))
    draw_set_font(DisplayResourceFont)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + Distance - 5, string_hash_to_newline("Stats:"))
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + 2*Distance, string_hash_to_newline("Damage: " + string(Damage)))
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + 3*Distance, string_hash_to_newline("Speed: " + string(Spd * 10 div 1)))
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + 5*Distance, string_hash_to_newline(Special))
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + 6*Distance, string_hash_to_newline(Special2))
    draw_set_valign(fa_top)
   
    HealthRed = make_colour_hsv(0,220,160)
    
    HealthGreen = make_colour_hsv(80,220,80)
    
    draw_rectangle_colour(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 + 55, __view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge + 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 + 62, c_black, c_black, c_black, c_black, false)
    draw_rectangle_colour(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 + 55, __view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25 + ((Health/MaxHealth) * 50), __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 +62, HealthGreen, HealthGreen, HealthGreen, HealthGreen, false)
    draw_rectangle_colour(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 + 55, __view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge + 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 + 62, c_black, c_black, c_black, c_black, true)
    draw_set_valign(fa_top)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)*1/2 - Edge + 42, string_hash_to_newline(string(Health div 1) + "/" + string(MaxHealth))) 
    }
    
depth = - y 

///Draw Select

if Selected = true
    {
    HealthGreen = make_colour_hsv(80,220,80)
        
    draw_sprite_ext(SelectedSpr, 0, MyHouse.x, MyHouse.y - MyHouse.sprite_height/2, 1, 1, 0, HealthGreen, 1)
        
    draw_sprite_ext(SelectedSpr, 0, x, y - sprite_height/2, 1, 1, 0, c_yellow, 1)
    }

