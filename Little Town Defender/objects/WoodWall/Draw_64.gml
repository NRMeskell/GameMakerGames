/// @description Draw Menu


depth = -1000
if Selected = true
    {
    draw_sprite_ext(MenuArea, 0, room_width - sprite_get_width(MenuArea)*MenuSize - Edge, room_height - sprite_get_height(MenuArea)*MenuSize - Edge, MenuSize, MenuSize, 0, c_white, 1)
    
    for(n=2; n < 3; n ++)
        {
        draw_sprite_ext(ButtonsSpr, n, room_width - sprite_get_width(MenuArea)*MenuSize/2 - Edge, room_height - sprite_get_height(MenuArea)*MenuSize *(4-n-1)/5 - Edge, MenuSize, MenuSize, 0, c_white, 1)
        }
      
    draw_sprite_ext(SelectedSpr, 0, x, y - 9, 1, 1, 0, c_yellow, 1)
    
    //Draw This Buildings Stuff
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_set_color(c_black)
    draw_set_font(DisplayResourceFont)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + 15, string_hash_to_newline("Health:"))
    
    draw_set_valign(fa_center)

    draw_set_font(CaptionFont)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Wood Wall"))
    draw_set_font(DisplayResourceFont)
    HealthRed = make_colour_hsv(0,220,160)
    
    HealthGreen = make_colour_hsv(80,220,80)
    
    draw_rectangle_colour(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 + 15, __view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge + 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 + 22, c_black, c_black, c_black, c_black, false)
    draw_rectangle_colour(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 + 15, __view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25 + ((Health/MaxHealth) * 50), __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 + 22, HealthGreen, HealthGreen, HealthGreen, HealthGreen, false)
    draw_rectangle_colour(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 + 15, __view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge + 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/3 - Edge + 1 + 22, c_black, c_black, c_black, c_black, true)
    draw_set_valign(fa_top)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)*1/2 - Edge + 2, string_hash_to_newline(string(Health div 1) + "/" + string(MaxHealth))) 
    }
    
depth = - y 

///Draw Menu Costs
ButtonLeft1 = __view_get( e__VW.WView, 0 ) - sprite_get_width(ButtonsSpr) * MenuSize - 15
ButtonLeft2 = __view_get( e__VW.WView, 0 ) - 15 - sprite_get_width(ButtonsSpr)/2 * MenuSize + 5

ButtonRight1 = __view_get( e__VW.WView, 0 ) - 15
ButtonRight2 = __view_get( e__VW.WView, 0 ) - 15 - sprite_get_width(ButtonsSpr)/2 * MenuSize - 5

ButtonTop1 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 3/5 - sprite_get_height(ButtonsSpr) * MenuSize/2
ButtonBottom1 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 3/5 + sprite_get_height(ButtonsSpr) * MenuSize/2 

ButtonTop2 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 2/5 - sprite_get_height(ButtonsSpr) * MenuSize/2
ButtonBottom2 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 2/5 + sprite_get_height(ButtonsSpr) * MenuSize/2 

ButtonTop3 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 1/5 - sprite_get_height(ButtonsSpr) * MenuSize/2
ButtonBottom3 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 1/5 + sprite_get_height(ButtonsSpr) * MenuSize/2 


if Selected == 1
{
draw_sprite_ext(SelectedSpr, 0, x, y - 8, 1, 1, 0, c_yellow, 1)

DistanceDraw = 10

///Draw Sell and rebuild costs
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop3, ButtonRight1, ButtonBottom3)
    {
    draw_set_halign(fa_left)
    draw_set_valign(fa_center)
    draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 0.75, 0.38, 0, c_white, 1)
    
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + DistanceDraw, string_hash_to_newline(SellCost * Health div MaxHealth))
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 2*DistanceDraw, string_hash_to_newline(SellWood * Health div MaxHealth))
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 3*DistanceDraw, string_hash_to_newline(SellStone * Health div MaxHealth))
    
    draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + DistanceDraw) 
    draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 2*DistanceDraw) 
    draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 3*DistanceDraw)
    }
    
/*if point_in_rectangle(mouse_x, mouse_y, ButtonLeft2, ButtonTop3, ButtonRight1, ButtonBottom3)
    {
    draw_set_halign(fa_left)
    draw_set_valign(fa_center)
    draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 0.75, 0.38, 0, c_white, 1)
    
    RepairCost = (global.WoodWallCost * ((MaxHealth - Health) / MaxHealth)) div 2
    RepairWood = (global.WoodWallWood * ((MaxHealth - Health) / MaxHealth)) div 1
    RepairStone = (global.WoodWallStone * ((MaxHealth-Health) / MaxHealth)) div 2
    
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + DistanceDraw, RepairCost)
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 2*DistanceDraw, RepairWood)
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 3*DistanceDraw, RepairStone)
    
    draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + DistanceDraw) 
    draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 2*DistanceDraw) 
    draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 3*DistanceDraw)
    }*/
}

/* */
/*  */
