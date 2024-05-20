/// @description Draw Menu


depth = -1000
if Selected = true
    {
    draw_sprite_ext(MenuArea, 0, room_width - sprite_get_width(MenuArea)*MenuSize - Edge, room_height - sprite_get_height(MenuArea)*MenuSize - Edge, MenuSize, MenuSize, 0, c_white, 1)
    
    draw_sprite_ext(ButtonsSpr, 0, ButtonLeft1+sprite_get_width(ButtonsSpr)*MenuSize/2, ButtonTop1+sprite_get_height(ButtonsSpr)*MenuSize/2, MenuSize, MenuSize, 0, c_white, 1)
    draw_sprite_ext(ButtonsSpr, 1, ButtonLeft1+sprite_get_width(ButtonsSpr)*MenuSize/2, ButtonTop2+sprite_get_height(ButtonsSpr)*MenuSize/2, MenuSize, MenuSize, 0, c_white, 1)
    draw_text(ButtonLeft1+sprite_get_width(ButtonsSpr)*MenuSize/2, (ButtonTop2+sprite_get_height(ButtonsSpr)*MenuSize/2 + ButtonTop3+sprite_get_height(ButtonsSpr)*MenuSize/2)/2+2, string_hash_to_newline("Damage: " + string(DamageDelt div 1)))
    draw_sprite_ext(ButtonsSpr, 2, ButtonLeft1+sprite_get_width(ButtonsSpr)*MenuSize/2, ButtonTop3+sprite_get_height(ButtonsSpr)*MenuSize/2, MenuSize, MenuSize, 0, c_white, 1)
 
    draw_sprite_ext(SelectedSpr, 0, x, y - sprite_height/2, 1, 1, 0, c_yellow, 1)
    
    //Draw This Buildings Stuff
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_set_color(c_black)
    draw_set_font(DisplayResourceFont)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace, string_hash_to_newline("Upgrades:"))
    
    draw_set_valign(fa_center)
    
    if image_index = 0 //Basic Tower
        {
        draw_set_font(CaptionFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Arrow Tower"))
        draw_set_font(DisplayResourceFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 3/5 - Edge + 1, string_hash_to_newline("Fast Tower"))
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/5 - Edge + 2-5, string_hash_to_newline("Range Tower")) 
        }
        
    if image_index = 1 //Heavy Tower
        {
        draw_set_font(CaptionFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Fast Tower"))
        draw_set_font(DisplayResourceFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 3/5 - Edge + 1, string_hash_to_newline("Rapid Tower"))
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/5 - Edge + 2-5, string_hash_to_newline("Spray Tower")) 
        }
        
    if image_index = 4 //Sniper Tower
        {
        draw_set_font(CaptionFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Range Tower"))
        draw_set_font(DisplayResourceFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 3/5 - Edge + 1, string_hash_to_newline("Stun Tower"))
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/5 - Edge + 2-5, string_hash_to_newline("Sniper Tower")) 
        }
        
    if image_index = 3 //SprayTower Tower
        {
        draw_set_font(CaptionFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Spray Tower"))
        draw_set_font(DisplayResourceFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 3/5 - Edge + 1, string_hash_to_newline("No Upgrades"))
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/5 - Edge + 2-5, string_hash_to_newline("No Upgrades")) 
        }
        
    if image_index = 2 //Strong Tower
        {
        draw_set_font(CaptionFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Rapid Tower"))
        draw_set_font(DisplayResourceFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 3/5 - Edge + 1, string_hash_to_newline("No Upgrades"))
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/5 - Edge + 2-5, string_hash_to_newline("No Upgrades")) 
        }
    
    if image_index = 6 //Punch Tower
        {
        draw_set_font(CaptionFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Sniper Tower"))
        draw_set_font(DisplayResourceFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 3/5 - Edge + 1, string_hash_to_newline("No Upgrades"))
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/5 - Edge + 2-5, string_hash_to_newline("No Upgrades")) 
        }
        
    if image_index = 5 //Piercing Tower
        {
        draw_set_font(CaptionFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Stun Tower"))
        draw_set_font(DisplayResourceFont)
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 3/5 - Edge + 1, string_hash_to_newline("No Upgrades"))
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/5 - Edge + 2-5, string_hash_to_newline("No Upgrades")) 
        }
    
    draw_set_circle_precision(32);
    draw_circle(x,y-sprite_height/2, Range, true)
    
    draw_set_valign(fa_top)
    }
    
depth = - y 

///Draw Menu Costs
if Selected == 1
{
DistanceDraw = 10

if image_index = 0
    {
    if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop1, ButtonRight1, ButtonBottom1)
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 0.75, 0.38, 0, c_white, 1)
    
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + DistanceDraw, string_hash_to_newline(global.StrongCost))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 2*DistanceDraw, string_hash_to_newline(global.StrongWood))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 3*DistanceDraw, string_hash_to_newline(global.StrongStone))
        
        draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + DistanceDraw) 
        draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 2*DistanceDraw) 
        draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 3*DistanceDraw)
        }
    if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2)
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 0.75, 0.38, 0, c_white, 1)
    
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + DistanceDraw, string_hash_to_newline(global.SniperCost))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 2*DistanceDraw, string_hash_to_newline(global.SniperWood))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 3*DistanceDraw, string_hash_to_newline(global.SniperStone))
        
        draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + DistanceDraw) 
        draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 2*DistanceDraw) 
        draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 3*DistanceDraw)
        }
    }
    
if image_index = 1
    {
    if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop1, ButtonRight1, ButtonBottom1)
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 0.75, 0.38, 0, c_white, 1)
    
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + DistanceDraw, string_hash_to_newline(global.HeavyCost))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 2*DistanceDraw, string_hash_to_newline(global.HeavyWood))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 3*DistanceDraw, string_hash_to_newline(global.HeavyStone))
        
        draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + DistanceDraw) 
        draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 2*DistanceDraw) 
        draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 3*DistanceDraw)
        }
    if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2)
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 0.75, 0.38, 0, c_white, 1)
    
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + DistanceDraw, string_hash_to_newline(global.SprayCost))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 2*DistanceDraw, string_hash_to_newline(global.SprayWood))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 3*DistanceDraw, string_hash_to_newline(global.SprayStone))
        
        draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + DistanceDraw) 
        draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 2*DistanceDraw) 
        draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 3*DistanceDraw)
        }
    }
    
    if image_index = 4
    {
    if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop1, ButtonRight1, ButtonBottom1)
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 0.75, 0.38, 0, c_white, 1)
    
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + DistanceDraw, string_hash_to_newline(global.PierceCost))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 2*DistanceDraw, string_hash_to_newline(global.PierceWood))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 3*DistanceDraw, string_hash_to_newline(global.PierceStone))
        
        draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + DistanceDraw) 
        draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 2*DistanceDraw) 
        draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 3*DistanceDraw)
        }
    if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2)
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 0.75, 0.38, 0, c_white, 1)
    
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + DistanceDraw, string_hash_to_newline(global.PunchCost))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 2*DistanceDraw, string_hash_to_newline(global.PunchWood))
        draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 3*DistanceDraw, string_hash_to_newline(global.PunchStone))
        
        draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + DistanceDraw) 
        draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 2*DistanceDraw) 
        draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 3*DistanceDraw)
        }
    }
    
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
    
    RepairCost = 2*SellCost*((MaxHealth-Health) / MaxHealth) div 1
    RepairWood = 2*SellWood*((MaxHealth-Health) / MaxHealth) div 1
    RepairStone = 2*SellStone*((MaxHealth-Health) / MaxHealth) div 1
    
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
