/// @description Check sea

name = ds_map_find_value(MapCreator.condName, mySeaType)
des = ds_map_find_value(MapCreator.condDes, mySeaType)
critera = ds_map_find_value(MapCreator.condCritera, mySeaType)


///Text surface

textSurface = surface_create(panelWidth*2, panelHeight*2)
surface_set_target(textSurface)
draw_set_valign(fa_center)
draw_set_halign(fa_center)

//draw name
draw_set_color(merge_color(c_yellow, c_black, 0.4))
draw_set_font(global.LargePirateFont)
draw_text_transformed(panelWidth, 28, string_hash_to_newline(name), 1.2, 1.2, 0)

//draw description
draw_set_color(c_black)
draw_set_font(global.PirateFont)
draw_text_ext(panelWidth, panelHeight, string_hash_to_newline(des), 14, panelWidth*2 - 40)

//draw criteria
draw_set_font(global.PirateFont)
draw_set_color(c_black)
draw_text_ext(panelWidth-1, panelHeight*2 - 30, string_hash_to_newline(critera), 14, panelWidth*2 - 40)
draw_text_ext(panelWidth, panelHeight*2 - 29, string_hash_to_newline(critera), 14, panelWidth*2 - 40)
draw_text_ext(panelWidth+1, panelHeight*2 - 30, string_hash_to_newline(critera), 14, panelWidth*2 - 40)
draw_text_ext(panelWidth, panelHeight*2 - 31, string_hash_to_newline(critera), 14, panelWidth*2 - 40)

draw_set_color(make_color_rgb(185, 0, 0))
draw_text_ext(panelWidth, panelHeight*2 - 30, string_hash_to_newline(critera), 14, panelWidth*2 - 40)
surface_reset_target()


