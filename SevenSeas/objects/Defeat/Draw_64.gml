/// @description Draw defeat


draw_background_ext(DefeatBackground, 0, 0, 1, 1, 0, c_white, sin((room_speed*2-alarm[0])/(room_speed*2)))

if alarm[0] < 1{
    //sunken ship
    //if Ship.myHealth < 1 or instance_exists(CombatRunner){
        {
        draw_sprite(DefeatFrameBackSpr, 0, drawX, drawY)
        draw_sprite(DefeatBubblesSpr, image_index + 24, drawX + 20, drawY-80) 
        draw_sprite_ext(GrassSpr, image_index, drawX -75, drawY, 1, 1, 0, c_white, 1)
        draw_sprite_ext(GrassSpr, image_index + 6, drawX + 82, drawY - 15, -1, 1, 0, c_white, 1)
        DrawShip(global.hullDict[Ship.shipType], 2, drawX+10, drawY + 30, 17, merge_color(c_white, c_blue, 0.4), PirateFlagSpr, merge_color(c_white, c_blue, 0.2), 3)
        draw_sprite(DefeatBubblesSpr, image_index, drawX - 65, drawY-20) 
        draw_sprite(DefeatFrameFrontSpr, 0, drawX, drawY)
        draw_sprite_ext(GrassSpr, image_index + 2, drawX + 42, drawY + 36, 1, 1, 0, c_white, 1)
        }
        
    draw_sprite(DefeatFrameSpr, 0, drawX, drawY)
    }
    

