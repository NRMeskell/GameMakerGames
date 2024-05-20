/// @description Draw Attack Spr

draw_set_font(global.PirateFont)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_color(make_color_rgb(115,115,115))
draw_text_transformed(room_width/2 + 30 - 25 + 15 + 50, 85, string_hash_to_newline(attackText), 1.5, 1.5, 0)

draw_set_color(make_color_rgb(135,0,0))
if animate = false and totalAttacks != -1
    draw_text_transformed(room_width/2 + 30 - 25 + 15 + 50, 100, string_hash_to_newline(Ship.hitAmount), 1.5, 1.5, 0)

