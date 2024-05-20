/// @description Draw Selected

if Selected = true
    {
    draw_sprite_ext(MenuArea, 0, x + sprite_width + 2 * Edge, room_height - 5*Edge - 1.2*sprite_get_height(MenuArea), 1.2, 1.2, 0, c_white, 1)
    draw_set_font(CaptionFont)
    draw_set_halign(fa_center)
    draw_text(x +sprite_width + 2 * Edge + 1.2*sprite_get_width(MenuArea)/2, room_height - 4*Edge - 1.2*sprite_get_height(MenuArea) * 8/9, string_hash_to_newline(Name))
    
    draw_set_font(DisplayResourceFont)
    draw_text(x + sprite_width + 2 * Edge + 1.2*sprite_get_width(MenuArea)/2, room_height - 4*Edge - 1.2*sprite_get_height(MenuArea) * 6/9, string_hash_to_newline("Damage: " + string(Damage)))
    draw_text(x + sprite_width + 2 * Edge + 1.2*sprite_get_width(MenuArea)/2, room_height - 4*Edge - 1.2*sprite_get_height(MenuArea) * 5/9, string_hash_to_newline("Speed: " + string(Spd)))
    draw_text(x + sprite_width + 2 * Edge + 1.2*sprite_get_width(MenuArea)/2, room_height - 4*Edge - 1.2*sprite_get_height(MenuArea) * 4/9, string_hash_to_newline("Health: " + string(Health)))
    
    if Specialty != "None"
    draw_text(x + sprite_width + 2 * Edge + 1.2*sprite_get_width(MenuArea)/2, room_height - 4*Edge - 1.2*sprite_get_height(MenuArea) * 2/9, string_hash_to_newline(Specialty))
    }

