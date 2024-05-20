/// @description Draw Menu


depth = -1000
if Selected = true
    {
    draw_set_valign(fa_center)
    draw_set_halign(fa_center)
    draw_sprite_ext(MenuArea, 0, room_width - sprite_get_width(MenuArea)*MenuSize - Edge, room_height - sprite_get_height(MenuArea)*MenuSize - Edge, MenuSize, MenuSize, 0, c_white, 1)
    
    for(n=2; n < 3; n ++)
        {
        draw_sprite_ext(ButtonsSpr, n, room_width - sprite_get_width(MenuArea)*MenuSize/2 - Edge, room_height - sprite_get_height(MenuArea)*MenuSize *(4-n-1)/5 - Edge, MenuSize, MenuSize, 0, c_white, 1)
        }
        
    draw_sprite_ext(ButtonsSpr, 0, room_width - sprite_get_width(MenuArea)*MenuSize/2 - Edge, room_height - sprite_get_height(MenuArea)*MenuSize *(4-1-1)/5 - Edge, MenuSize, MenuSize, 0, c_white, 1)
            
    draw_set_font(CaptionFont)
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + CaptionPlace, string_hash_to_newline("Gong"))
        
    draw_sprite_ext(SelectedSpr, 0, x, y - sprite_height/2, 1, 1, 0, c_yellow, 1)
    
    //Draw This Buildings Stuff
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_color(c_black)
    draw_set_font(DisplayResourceFont)
    
    draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge - 6, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize) - Edge + UpgradePlace + 4/2*Distance, string_hash_to_newline("Summons The#Dragon")) 
        
    draw_set_valign(fa_center)
    if Level < 2
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/5 - Edge + 2, string_hash_to_newline("Summon")) 
    
    if Level = 2
        draw_text(__view_get( e__VW.WView, 0 ) - (sprite_get_width(MenuArea)*MenuSize)/2 - Edge, __view_get( e__VW.HView, 0 ) - (sprite_get_height(MenuArea)*MenuSize)* 2/5 - Edge + 2, string_hash_to_newline("No Upgrade")) 
        
    }
    
depth = - y 

///Draw Menu Costs
if Selected == 1
{
DistanceDraw = 10

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
    

if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2)
    {
    draw_set_halign(fa_left)
    draw_set_valign(fa_center)
    draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 0.75, 0.38, 0, c_white, 1)

    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + DistanceDraw, string_hash_to_newline(RingCost))
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 2*DistanceDraw,  string_hash_to_newline(RingWood))
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 5, mouse_y + 3*DistanceDraw, string_hash_to_newline(RingStone))
    
    draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + DistanceDraw) 
    draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 2*DistanceDraw) 
    draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 5, mouse_y + 3*DistanceDraw)
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
///Draw Selected Workers

if Selected = true
for(i=0; i < instance_number(Worker); i ++)
    {
    ThisWorker = instance_find(Worker,i)
    
    if ThisWorker.MyHouse = id
        draw_sprite_ext(SelectedSpr, 0, ThisWorker.x, ThisWorker.y - ThisWorker.sprite_height/2, 1, 1, 0, HealthGreen, 1)
    }

/* */
/*  */
