/// @description Draw Select

display_set_gui_size(980, 540);

if Selected = true
    {
    HealthGreen = make_colour_hsv(80,220,80)
        
    for(i=0; i < instance_number(Worker); i ++)
        {
        ThisWorker = instance_find(Worker,i)
        
        if ThisWorker.MyHouse = id
            draw_sprite_ext(SelectedSpr, 0, ThisWorker.x, ThisWorker.y - ThisWorker.sprite_height/2, 1, 1, 0, HealthGreen, 1)
        }
        
    draw_sprite_ext(SelectedSpr, 0, x, y - sprite_height/2, 1, 1, 0, c_yellow, 1)
    }

///Draw Menu

depth = -1000
if Selected = true
    {
    draw_sprite_ext(MenuArea, 0, room_width - sprite_get_width(MenuArea)*MenuSize - Edge, room_height - sprite_get_height(MenuArea)*MenuSize - Edge, MenuSize, MenuSize, 0, c_white, 1)
    
    //Draw This Buildings Stuff
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_color(c_black)
    draw_set_font(CaptionFont)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Town Hall"))
    draw_set_font(DisplayResourceFont)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + Distance, string_hash_to_newline("Resources:"))
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 6, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + 2.5*Distance, string_hash_to_newline("+" + string(Level)))
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 6, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + 3.5*Distance, string_hash_to_newline("+" + string(Level*2)))
    draw_set_valign(fa_top)
    
    
    draw_sprite(ResourcesSpr, 3, __view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge + 6, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + 2.5 * Distance) 
    draw_sprite(ResourcesSpr, 0, __view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge + 6, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + 3.5 *Distance - 1) 
    
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 1/2 - Edge+4, string_hash_to_newline("Protect at#all costs!")) 
      
    HealthRed = make_colour_hsv(0,200,160)
    
    HealthGreen = make_colour_hsv(80,220,80)
    
    draw_rectangle_colour(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/4 - Edge + 1 + 41, __view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge + 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/4 - Edge + 1 + 38, c_black, c_black, c_black, c_black, false)
    draw_rectangle_colour(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/4 - Edge + 1 + 41, __view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25 + ((Health/MaxHealth) * 50), __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/4 - Edge + 1 + 38, HealthGreen, HealthGreen, HealthGreen, HealthGreen, false)
    draw_rectangle_colour(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/4 - Edge + 1 + 41, __view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge + 25, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/4 - Edge + 1 + 38, c_black, c_black, c_black, c_black, true)
    
    draw_set_valign(fa_top)
    
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/7 - Edge + 18, string_hash_to_newline(string(Health div 1) + "/" + string(MaxHealth))) 
    
    /*///Draw Upgrade to Level 2
    if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2)
    if image_index = 0    
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 0.75, 0.38, 0, c_white, 1)
    
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + DistanceDraw, global.Hall1Cost)
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 2*DistanceDraw,  global.Hall1Wood)
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 3*DistanceDraw, global.Hall1Stone)
        
        draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + DistanceDraw) 
        draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 2*DistanceDraw) 
        draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 3*DistanceDraw)
        }
        
    ///Draw Upgrade to Level 3
    if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2)
    if image_index = 1  
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 0.75, 0.38, 0, c_white, 1)
    
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + DistanceDraw, global.Hall2Cost)
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 2*DistanceDraw,  global.Hall2Wood)
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 3*DistanceDraw, global.Hall2Stone)
        
        draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + DistanceDraw) 
        draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 2*DistanceDraw) 
        draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 3*DistanceDraw)
        } */       
    }
    
depth = - y 

/* */
///Draw Worker Level

draw_sprite(WorkerLevelSpr, 0, room_width/2, room_height - 64)

draw_set_font(DisplayResourceFont)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_black)

draw_text(room_width/2, room_height - 63, string_hash_to_newline(global.WorkerVic))

/* */
/*  */
