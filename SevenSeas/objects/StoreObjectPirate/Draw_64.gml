///Draw Self


if viewed
    {
    draw_sprite(StoreItemSpr, (overButton or previewSelect) + selected*2, drawX, drawY)
    
	if !surface_exists(fullPirateSurface){
		fullPirateSurface = surface_create(sprite_get_width(PirateManSkinSpr), sprite_get_height(PirateManSkinSpr))
		MakePirateSurface(fullPirateSurface, 0, 0)
	}	
    DrawPirateSurface(smallPirateSurface, drawX - realWidth/2, drawY- realHeight/2)
        
    draw_set_valign(fa_center)
    draw_set_halign(fa_left)
    draw_set_color(c_black)
    draw_text(drawX + 25, drawY, string_hash_to_newline(string_char_at(firstName,0) + "." + string_copy(lastName, 0, min(string_length(lastName), 8))))
    
    draw_set_color(merge_color(c_yellow, c_black, 0.2))
    draw_set_halign(fa_right)
    if cost != 0
        draw_text(drawX + sprite_get_width(sprite_index) - 50, drawY, string_hash_to_newline(cost))
    }

