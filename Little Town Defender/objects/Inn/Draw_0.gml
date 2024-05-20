/// @description Health Bar

if Health > 0
{
HealthRed = make_colour_hsv(0,220,160)

draw_rectangle_color(x - 8, y + 5, x + 8, y + 7, c_black, c_black, c_black, c_black, false)

HealthGreen = make_colour_hsv(80,220,80)
draw_rectangle_colour(x - 8, y + 5, x - 8 + ((Health/MaxHealth) * 16), y + 7, HealthGreen, HealthGreen, HealthGreen, HealthGreen, false)

draw_rectangle_color(x - 8, y + 5, x + 8, y + 7, c_black, c_black, c_black, c_black, true)
}

///Draw Self

//Draw Building Self
if Build < 100
    {
    BuildWidth = sprite_get_width(sprite_index)
    for (i = 0; i < BuildWidth; i+=1)
        {
        if sprite_get_height(sprite_index) * Build div 100 + choose(-1,0,1) > BuildTop
            {
            BuildTop = sprite_get_height(sprite_index) * Build div 100 + choose(-1,0,1)
            }
        draw_sprite_part(sprite_index, image_index, i, sprite_get_height(sprite_index) - BuildTop, 1, BuildTop, x - BuildWidth/2 + i, y - BuildTop);
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

