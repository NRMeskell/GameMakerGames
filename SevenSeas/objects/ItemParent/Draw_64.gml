/// @description Draw info

if room != PirateChooserRoom and instance_exists(Pirate)
    {
	if ds_list_find_value(ItemRunner.floatingItems, 0) == id or (state == "equipped" and overItem == true)
        {
	    canEquip = false
	    with Pirate
	        if selected
	            other.canEquip = true
    
	    infoBoxY = 58
	    drawWidth = 40
	    drawHeight = 20
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
        
        //Draw Bonuses
        drawStartY = Pirate.yWindow+drawHeight + lineHeight + 20
        drawStatDisX = 48
        drawStatDisY = 23
        textShift = 28
        centerOffset = 5
    
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
        if myAction != noone
            {
            DrawAction(myAction, drawX + sprite_get_width(ItemSheetSpr)/2, drawStartY + drawStatDisY*((r div 3)+1) + 20, 1)
            }
            
        if itemPower != "none"
            {
            draw_set_halign(fa_center)
            draw_set_valign(fa_center)
            draw_set_color(c_black)
            draw_sprite_part(ItemSheetSpr, 2, 0, 0, sprite_get_width(ItemSheetSpr), 5, drawX, drawY+lineHeight + 20)
            draw_sprite_part(ItemSheetSpr, 2, 0, lineHeight + 42, sprite_get_width(ItemSheetSpr), sprite_get_height(ItemSheetSpr) - (lineHeight + 50), drawX, drawY+lineHeight + 25)
            
            draw_text_ext(drawX + sprite_get_width(ItemSheetSpr)/2, drawStartY + 40, string_hash_to_newline(itemPowerDescription), 12, sprite_get_width(ItemSheetSpr) - 30)
            }
        }
    }

///Draw action info

if ds_list_find_value(ItemRunner.floatingItems, 0) == id or (state == "equipped" and overItem == true)
    {
    //draw actions
    if myAction != noone
        {
        //Draw action info
        if instance_exists(Pirate)
        if point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), drawX + sprite_get_width(ItemSheetSpr)/2 - 16, drawStartY + drawStatDisY*((r div 3)+1) + 20 - 16, drawX + sprite_get_width(ItemSheetSpr)/2 + 16, drawStartY + drawStatDisY*((r div 3)+1) + 20 + 16)
            {
            startX = 10 + ((state != "equipped") * 20) + Pirate.xWindow - sprite_get_width(ActionInfoSpr)/2 + 8 + sprite_get_width(PirateSheetSpr)/2
            drawInfoY = Pirate.yWindow + 215+16 - 60
            
            if myAction.myType = "melee"
                draw_sprite(ActionInfoSpr, 0, startX, drawInfoY)
            if myAction.myType = "ranged"
                draw_sprite(ActionInfoSpr, 1, startX, drawInfoY)
            if myAction.myType = "cannon"
                draw_sprite(ActionInfoSpr, 2, startX, drawInfoY)
            if myAction.myType = "ship"
                draw_sprite(ActionInfoSpr, 3, startX, drawInfoY)
            draw_set_color(c_black) 
            draw_set_valign(fa_top)   
            draw_set_halign(fa_right)
            draw_text(startX + myAction.timerX, drawInfoY - myAction.nameY, string_hash_to_newline(myAction.rechargeTime))
            
            draw_set_halign(fa_left)
            draw_text(startX + myAction.shiftX, drawInfoY - myAction.nameY, string_hash_to_newline(myAction.name))
            draw_text_ext(startX + myAction.shiftX, drawInfoY - myAction.descY, string_hash_to_newline(myAction.description), 11, myAction.drawWidth)
            if myAction.requiredSlot[0] != "none"
                {
                draw_text(startX + myAction.shiftX, 3+ drawInfoY - myAction.descY + string_height_ext(string_hash_to_newline("###"), 11, myAction.drawWidth), string_hash_to_newline("Required Slot Type:"))
                for(r=0; r<array_length_1d(myAction.requiredSlot); r++)
                    {
                    if r > 0
                        draw_text(startX + myAction.shiftX + string_width(string_hash_to_newline("Required Slot Type:")) + 16 + (r-1)*18, 3 +drawInfoY - myAction.descY + string_height_ext(string_hash_to_newline("###"), 11, myAction.drawWidth), string_hash_to_newline(","))
                    draw_sprite_ext(StatSymbolSpr, ds_map_find_value(myAction.requiredTypeMap, myAction.requiredSlot[r]), startX + myAction.shiftX + string_width(string_hash_to_newline("Required Slot Type:")) + r*18, 3+ drawInfoY - myAction.descY + string_height_ext(string_hash_to_newline("###"), 11, myAction.drawWidth) - 5, 0.6, 0.6, 0, c_white, 1)
                    }
                }
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
    
    /*if state != "equipped"  
        {
        draw_text(drawX + buttonTextDis, drawY + sprite_get_height(ItemSheetSpr)- buttonTextHieght, string_hash_to_newline("unequip"))
        draw_text(drawX +sprite_get_width(ItemSheetSpr) - buttonTextDis, drawY + sprite_get_height(ItemSheetSpr) - buttonTextHieght, string_hash_to_newline("close"))
        }
    else*/
        {
		draw_text(drawX + buttonTextDis, drawY  + sprite_get_height(ItemSheetSpr)- buttonTextHieght, string_hash_to_newline("equip"))
        if !AbleToStore(1, 1)
			draw_text(drawX +sprite_get_width(ItemSheetSpr) - buttonTextDis, drawY + sprite_get_height(ItemSheetSpr) - buttonTextHieght, string_hash_to_newline("discard"))
        else{
			draw_text(drawX +sprite_get_width(ItemSheetSpr) - buttonTextDis - 8, drawY + sprite_get_height(ItemSheetSpr) - buttonTextHieght, string_hash_to_newline("store"))
			draw_sprite_ext(CargoSpr, 1, drawX +sprite_get_width(ItemSheetSpr) - buttonTextDis + 20, drawY + sprite_get_height(ItemSheetSpr) - buttonTextHieght, 0.7, 0.7, 0, merge_color(c_white, c_ltgray, overRight), 1)
		}
		
		if ds_list_size(ItemRunner.floatingItems) > 1
            {
            draw_sprite(EndCombatSpr, 7, drawX-3 + sprite_get_width(ItemSheetSpr), drawY+3)
            if ds_list_size(ItemRunner.floatingItems) < 10
                draw_text_transformed(drawX-3 + sprite_get_width(ItemSheetSpr)+1.2, drawY+3+1.2, string_hash_to_newline(ds_list_size(ItemRunner.floatingItems)), 1.2, 1.2, 0)
            else
                draw_text_transformed(drawX-3 + sprite_get_width(ItemSheetSpr)+0.8, drawY+3+0.8, string_hash_to_newline(ds_list_size(ItemRunner.floatingItems)), 0.8, 0.8, 0)
            }
        }
    }

