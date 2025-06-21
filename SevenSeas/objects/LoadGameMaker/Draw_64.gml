/// @description Draw Self

//draw text backing
draw_sprite(sprite_index, image_index, x, y)

//draw buttons
for(var i=buttonPos; i<min(ds_list_size(myGames), buttonPos + 3); i++){
    draw_sprite(LoadGameButtonSpr, overButton[i] + 2*overTrash[i], x - buttonAlign, y - buttonStartY + buttonDistance*(i-buttonPos))
    draw_set_font(global.LargePirateFont)
    draw_set_halign(fa_left)
    draw_set_valign(fa_center)
    draw_set_color(merge_color(c_gray, c_ltgray, 0.2-0.1*overButton[i]))
    draw_text_transformed(x - buttonAlign, y - buttonStartY + buttonDistance*(i-buttonPos), string_hash_to_newline(ds_list_find_value(myGames, i)[0]), 1, 1, 0)
    
	draw_set_font(global.PirateFont)
    draw_set_color(c_black)
	var stats = ds_list_find_value(myGames, i)[1]
	draw_text(x - buttonAlign + 13, y - buttonStartY + buttonDistance*(i-buttonPos) + 22, stats[0])
	draw_text(x - buttonAlign + 43, y - buttonStartY + buttonDistance*(i-buttonPos) + 22, stats[1])
	draw_text(x - buttonAlign + 73, y - buttonStartY + buttonDistance*(i-buttonPos) + 22, stats[2])
	}
 
draw_set_font(global.LargePirateFont)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(make_color_rgb(182,154,8))
draw_text(x, y - 101, string_hash_to_newline("Load Game"))
draw_set_color(merge_color(c_red, c_gray, 0.4))
draw_text(x, y + 109, string_hash_to_newline("return"))
