/// @description Draw Background

draw_background_ext(LoadingWaveBack, drawX[1], room_height, 1, -1, 0, c_white, 1)
draw_background(LoadingWaveBack, drawX[0], 0)
draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_set_color(c_gray)
draw_set_font(global.LargePirateFont)
draw_text_transformed(drawX[0] + room_width/2, room_height/2, string_hash_to_newline("LOADING..."), 1.2, 1.2, 0)
draw_set_font(global.PirateFont)
    

