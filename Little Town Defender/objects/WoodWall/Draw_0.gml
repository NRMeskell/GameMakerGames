/// @description Draw Self
/*draw_text(x,y,alarm[1])
draw_text(x,y+20,Created)*/

//Draw Building Self
if Build < 100
    {
    if image_index = 0 ///Flat
        {
        BuildWidth = sprite_get_width(sprite_index)
        for (i = 0; i < BuildWidth; i+=1)
            {
            if 15 * Build div 100 + choose(-1,0,1) > BuildTop
                {
                BuildTop = 16 * Build div 100
                }
            draw_sprite_part(sprite_index, image_index, i, 43 - BuildTop, 1, BuildTop, x - BuildWidth/2 + i, y - BuildTop + 1);
            }
        }
        
    if image_index = 1 ///Left Up
        {
        BuildWidth = sprite_get_width(sprite_index)
        for (i = 0; i < BuildWidth; i+=1)
            {
            if 18 * Build div 100 + choose(-1,0,1) > BuildTop
                {
                BuildTop = 18 * Build div 100
                }
            draw_sprite_part(sprite_index, 1, i, i + 21 - BuildTop, 1, BuildTop, x - BuildWidth/2 + i, y - 42 + i + 21 - BuildTop);
            }
        }
        
    if image_index = 2 ///Flat
        {
        BuildWidth = sprite_get_width(sprite_index)
        for (i = 0; i < BuildWidth; i+=1)
            {
            if 50 * Build div 100 + choose(-1,0,1) > BuildTop
                {
                BuildTop = 50 * Build div 100
                }
            draw_sprite_part(sprite_index, image_index, i, 60 - BuildTop, 1, BuildTop, x - BuildWidth/2 + i, y + 18 - BuildTop + 1);
            }
        }
    if image_index = 3 ///Right Up
        {
        BuildWidth = sprite_get_width(sprite_index)
        for (i = 0; i < BuildWidth; i+=1)
            {
            if 18 * Build div 100 + choose(-1,0,1) > BuildTop
                {
                BuildTop = 18 * Build div 100
                }
            draw_sprite_part(sprite_index, 3, i, 66 - i - BuildTop, 1, BuildTop, x - BuildWidth/2 + i, y + 24 - i - BuildTop);
            }
        }
    }
else
    {
    if Created = true
        {
        draw_self()
        image_alpha = 1
        }
    else
        {
        draw_self()
        image_alpha = 0.6
        }
    }

/* */
/*  */
