/// @description Draw Event Card

buttonNumber = ds_list_size(buttons)
pirateEventText = PirateTalkTranslator(eventText, myPirate)

//if view_current = 0
    {    
    textBorder = 35
    captionY = 24 + (string_height_ext(string_hash_to_newline(captionText), 12, sprite_get_width(EventSpr) - textBorder*1.2)/2)*1.2
    buttonCenter = sprite_get_height(EventSpr) - 35
    
    pictureX = -60
    pictureY = captionY
    buttonTop = buttonCenter - buttonSpacing/2
    
    textY = ((pictureY + 35) + buttonTop)/2
    
    draw_sprite(EventSpr, 0, drawX, drawY)
    draw_set_color(c_black)
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    
    with myPirate{
		if !surface_exists(smallPirateSurface){
			smallPirateSurface = surface_create(realWidth, realHeight)
			MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy) 
		}
        DrawPirateSurface(smallPirateSurface, other.drawX + other.pictureX, other.drawY + other.pictureY)
		surface_free(smallPirateSurface)
	}
   draw_sprite(ShipSlotSpr, 0, drawX + pictureX - 1, drawY + pictureY - 2)  
    
    if overButton[0]
        draw_sprite(ButtonSpr, 11, drawX, drawY + buttonCenter)
    else if overButton[1]
        draw_sprite(ButtonSpr, 12, drawX, drawY + buttonCenter)
    else
        draw_sprite(ButtonSpr, 10, drawX, drawY + buttonCenter)
    
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_font(global.LargePirateFont)
    draw_set_color(c_green)
    draw_text(drawX - 38, drawY + buttonCenter, string_hash_to_newline("aye"))
    draw_set_color(merge_color(c_red, c_black, 0.1))
    draw_text(drawX + 38, drawY + buttonCenter, string_hash_to_newline("nay")) 
    
    draw_set_color(make_color_rgb(193, 147, 1))
    draw_set_font(global.LargePirateFont)
    draw_text_ext_transformed(drawX + 20, drawY + captionY + 12, string_hash_to_newline(captionText), 14, sprite_get_width(EventSpr) - textBorder*1.6, 1, 1, 0)
    draw_set_font(global.PirateFont)
    draw_text_ext_transformed(drawX, drawY + captionY + 45, string_hash_to_newline(myPirate.name), 14, sprite_get_width(EventSpr) - textBorder*1.6, 1, 1, 0)
    draw_set_color(c_black)
    draw_text_ext(drawX, drawY + textY + 5, string_hash_to_newline(pirateEventText), 12, sprite_get_width(EventSpr) - textBorder)
}

