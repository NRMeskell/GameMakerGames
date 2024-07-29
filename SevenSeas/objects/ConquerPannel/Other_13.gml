/// @description Draw Text and Check sea

name = mySeaType
des = ds_map_find_value(MapCreator.condDes, mySeaType)
critera = ds_map_find_value(MapCreator.condCritera, mySeaType)
image = ds_map_find_value(MapCreator.condImage, mySeaType)


///Text surface
textSurface = surface_create(panelWidth*2, panelHeight*2)
surface_set_target(textSurface)

draw_sprite(SeaConqueredDecorSpr, image, panelWidth, 0)
draw_sprite_ext(SeaConqueredDecorSpr, image, panelWidth, 0, -1, 1, 0, c_white, 1)

draw_set_valign(fa_center)
draw_set_halign(fa_center)

//draw name
draw_set_color(merge_color(c_yellow, c_black, 0.4))
draw_set_font(global.LargePirateFont)
draw_text_transformed(panelWidth, 50, name, 1.2, 1.2, 0)

//draw description
draw_set_color(c_black)
draw_set_font(global.PirateFont)
draw_text(panelWidth, 85, "Level: " + string(global.seaLevel+1))

draw_text_ext(panelWidth, 128, des, 14, panelWidth*2 - 40)

//draw criteria
draw_set_font(global.PirateFont)
draw_set_color(c_black)
draw_text_ext(panelWidth-1, 150, string_hash_to_newline(critera), 14, panelWidth*2 - 40)
draw_text_ext(panelWidth, 151, string_hash_to_newline(critera), 14, panelWidth*2 - 40)
draw_text_ext(panelWidth+1, 150, string_hash_to_newline(critera), 14, panelWidth*2 - 40)
draw_text_ext(panelWidth, 149, string_hash_to_newline(critera), 14, panelWidth*2 - 40)

draw_set_color(c_gray)
draw_text_ext(panelWidth, 150, string_hash_to_newline(critera), 14, panelWidth*2 - 40)
surface_reset_target()


