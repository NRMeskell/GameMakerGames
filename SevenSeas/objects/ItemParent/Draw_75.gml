/// @description Draw info

if room != PirateChooserRoom and instance_exists(Pirate)
    {
	if ds_list_find_value(ItemRunner.floatingItems, 0) == id or (state == "equipped" and overItem == true) {
	    canEquip = false
	    with Pirate
	        if selected
	            other.canEquip = true
    
	    infoBoxY = 58
	    drawWidth = 40
	    drawHeight = 20
		//Draw Bonuses
        drawStartY = Pirate.yWindow+drawHeight + lineHeight + 20
        drawStatDisX = 48
        drawStatDisY = 23
        textShift = 28
        centerOffset = 5
		
	    if state == "equipped"
	        drawX = Pirate.xWindow-sprite_get_width(ItemSheetSpr)
	    else if state == "floating"
	        drawX = room_width - sprite_get_width(ItemSheetSpr) - 20
	    else if state == "none"
	        drawX = room_width - sprite_get_width(ItemSheetSpr)/2
    
	    drawY = Pirate.yWindow+drawHeight
	    infoTextSize = string_height_ext(string_hash_to_newline(itemInfo), 12, sprite_get_width(ItemSheetSpr)-drawWidth)
	    infoTextHeight = max(infoBoxY + 25, infoBoxY + 10 + infoTextSize div 2)
	    lineHeight = max(infoBoxY + 10 + string_height_ext(string_hash_to_newline(itemInfo), 12, sprite_get_width(ItemSheetSpr)-drawWidth), infoBoxY + 45)
    
        draw_set_color(c_yellow)
        //draw_text(100,50 + selected*25, itemNumber)
        draw_sprite(ItemSheetSpr, 0, drawX, drawY)
		if itemPower != "none"
            {
            draw_set_halign(fa_center)
            draw_set_valign(fa_center)
            draw_set_color(c_black)
            draw_sprite_part(ItemSheetSpr, 2, 0, 0, sprite_get_width(ItemSheetSpr), 5, drawX, drawY+lineHeight + 20)
            draw_sprite_part(ItemSheetSpr, 2, 0, lineHeight + 42, sprite_get_width(ItemSheetSpr), sprite_get_height(ItemSheetSpr) - (lineHeight + 50), drawX, drawY+lineHeight + 25)
            
            draw_text_ext(drawX + sprite_get_width(ItemSheetSpr)/2, drawStartY + 40, string_hash_to_newline(itemPowerDescription), 12, sprite_get_width(ItemSheetSpr) - 30)
            }
        DrawItem(sprite_index, itemNumber, myColor, drawX+28-12, drawY + 34-12, 0, 0, sprite_width, sprite_height)

        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_set_color(c_black)
        draw_text(drawX+60, Pirate.yWindow+drawHeight+37, string_hash_to_newline(itemName))
        
        draw_sprite_part(ItemSheetSpr, 2, 0, 0, sprite_get_width(ItemSheetSpr), lineHeight -(infoBoxY), drawX, drawY+infoBoxY)
        draw_sprite_part(ItemSheetSpr, 2, 0, 210, sprite_get_width(ItemSheetSpr), 5, drawX, drawY + lineHeight)
        
        
        draw_set_halign(fa_center)
        draw_text_ext(drawX+sprite_get_width(ItemSheetSpr)/2, drawY+infoTextHeight, string_hash_to_newline(itemInfo), 12, sprite_get_width(ItemSheetSpr)-drawWidth)
        
        draw_sprite(ItemSheetSpr, 1, drawX, drawY+lineHeight + 10)
        
        //Draw Damage and accuracy
        if damage != 0
            {
            draw_set_halign(fa_center)
            draw_set_valign(fa_top)
            draw_set_color(make_color_rgb(158,126,2))
            draw_set_font(global.LargePirateFont)
            
            draw_text_ext(drawX+sprite_get_width(ItemSheetSpr)/2, drawY+lineHeight + 30, string_hash_to_newline("accuracy: " + string(accuracy) + "#damage: " + string(damage)), 16, sprite_get_width(ItemSheetSpr)-drawWidth)
            }
    
        rowStart[0] = drawX+sprite_get_width(ItemSheetSpr)/2 + centerOffset
        rowStart[1] = drawX+sprite_get_width(ItemSheetSpr)/2 + centerOffset
        rowStart[2] = drawX+sprite_get_width(ItemSheetSpr)/2 + centerOffset
        
        //Collect stat info
        r = 0
        for(i=0; i < array_length_1d(bonus); i++)
            {
            if bonus[i] != 0
                {
                rowStart[r div 3] -= drawStatDisX/2
                r ++
                }
            }
        //Draw Stats  
        r=0 
        for(i=0; i < array_length_1d(bonus); i++)
            {
            if bonus[i] != 0
                {
                draw_set_halign(fa_left)
                draw_set_valign(fa_center)
                draw_set_color(make_color_rgb(158,126,2))
                draw_set_font(global.LargePirateFont)
                
                draw_sprite(StatSymbolSpr, i, rowStart[r div 3] + drawStatDisX*(r mod 3), drawStartY + drawStatDisY*(r div 3) + 20)
                draw_text(rowStart[r div 3] + drawStatDisX*(r mod 3) + textShift, drawStartY + drawStatDisY*(r div 3) + sprite_get_height(StatSymbolSpr)/2 * (myAction == noone) + 20, string_hash_to_newline(bonus[i]))
                r ++
                }
            }
        draw_set_font(global.PirateFont)
        
        //draw actions
        if myAction != noone{
            DrawAction(myAction, drawX + sprite_get_width(ItemSheetSpr)/2, drawStartY + 40, 1)
            
			if point_in_rectangle(window_view_mouse_get_x(0), mouse_y, drawX + sprite_get_width(ItemSheetSpr)/2 - 16, drawStartY + 40 - 16, drawX + sprite_get_width(ItemSheetSpr)/2 + 16, drawStartY + 40 + 16) or (state == "equipped") {
	            startX = Pirate.xWindow - sprite_get_width(ActionInfoSpr)/2 + 20 + sprite_get_width(PirateSheetSpr)/2
	            drawInfoY = Pirate.yWindow + Pirate.actionStartY - 45
	            DrawActionInfo(myAction, startX, drawInfoY, true, "pirate", undefined)
	        }
		}		
        
	    //Draw buttons
		if state != "equipped"{
		    draw_sprite(ItemSheetSpr, 3 + (overLeft or !canEquip), drawX, drawY)
		    draw_sprite(ItemSheetSpr, 5 + overRight, drawX, drawY)
		}
	    draw_set_font(global.PirateFont)
	    draw_set_colour(c_black)
	    draw_set_halign(fa_center)
	    draw_set_valign(fa_center)
    
	    buttonTextDis = 48
	    buttonTextHieght = 13
    
	    if state != "equipped"  
	        {
			draw_text(drawX + buttonTextDis, drawY  + sprite_get_height(ItemSheetSpr)- buttonTextHieght, string_hash_to_newline("equip"))
	        if !AbleToStore(1, 1)
				draw_text(drawX +sprite_get_width(ItemSheetSpr) - buttonTextDis, drawY + sprite_get_height(ItemSheetSpr) - buttonTextHieght, string_hash_to_newline("discard"))
	        else{
				draw_text(drawX +sprite_get_width(ItemSheetSpr) - buttonTextDis - 8, drawY + sprite_get_height(ItemSheetSpr) - buttonTextHieght, string_hash_to_newline("store"))
				draw_sprite_ext(CargoSpr, 1, drawX +sprite_get_width(ItemSheetSpr) - buttonTextDis + 20, drawY + sprite_get_height(ItemSheetSpr) - buttonTextHieght, 0.7, 0.7, 0, merge_color(c_white, c_ltgray, overRight), 1)
			}
		
			if ds_list_size(ItemRunner.floatingItems) > 1 {
	            draw_sprite(EndCombatSpr, 7, drawX-3 + sprite_get_width(ItemSheetSpr), drawY+3)
	            if ds_list_size(ItemRunner.floatingItems) < 10
	                draw_text_transformed(drawX-3 + sprite_get_width(ItemSheetSpr)+1.2, drawY+3+1.2, string_hash_to_newline(ds_list_size(ItemRunner.floatingItems)), 1.2, 1.2, 0)
	            else
	                draw_text_transformed(drawX-3 + sprite_get_width(ItemSheetSpr)+0.8, drawY+3+0.8, string_hash_to_newline(ds_list_size(ItemRunner.floatingItems)), 0.8, 0.8, 0)
	        }
	    }
	}
}

