/// @description Draw Self

if (!instance_exists(LevelButton) or object_index == LevelButton)
    {
    if !point_in_rectangle(mouse_x, mouse_y, x-width, y-height, x+width, y+height) and !instance_exists(Credits)
        draw_set_color(myColor)
    else
        draw_set_color(merge_color(myColor, c_black, 0.2))
        
    draw_rectangle(x-width, y-height, x+width, y+height, false)
    draw_set_color(c_black)
    draw_rectangle(x-width, y-height, x+width, y+height, true)
    
    draw_set_color(textColor)
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_text(x, y, string_hash_to_newline(textString))
    }

