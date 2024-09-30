/// @description Draw Self

if preview{
	/// @description Draw Pirate Menu

	draw_sprite_ext(PirateSheetSpr, 0, xWindow, yWindow, size, size, 0, c_white, 1)

	if !surface_exists(fullPirateSurface){
		fullPirateSurface = surface_create(sprite_get_width(PirateManSkinSpr), sprite_get_height(PirateManSkinSpr))
		MakePirateSurface(fullPirateSurface, 0, 0)
	}	
	DrawPirateSurface(fullPirateSurface, xWindow + xPicture, yWindow + yPicture)

	draw_sprite(PirateLifeSpr, -1+sprite_get_number(PirateLifeSpr), xWindow, yWindow)

	/* */
	///Draw Name Menu

	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_black)
	draw_set_font(global.PirateFont)

	draw_text_transformed(xWindow+(sprite_get_width(PirateSheetSpr)/2)*size, yWindow+19*size, string_hash_to_newline(name), size, size, 0)

	/* */
	///Draw Equipment

	draw_sprite_ext(EquipSlotSpr, overHat or myHat.selected, xWindow+drawX1, yWindow+drawY1, size, size, 0, c_white, 1)
	draw_sprite_ext(EquipSlotSpr, overShirt or myShirt.selected, xWindow+drawX2, yWindow+drawY1, size, size, 0, c_white, 1)
	draw_sprite_ext(EquipSlotSpr, overRightHand or myRightHand.selected, xWindow+drawX1, yWindow+drawY2, size, size, 0, c_white, 1)
	draw_sprite_ext(EquipSlotSpr, overLeftHand or myLeftHand.selected, xWindow+drawX2, yWindow+drawY2, size, size, 0, c_white, 1)
	draw_sprite_ext(EquipSlotSpr, overPants or myPants.selected, xWindow+drawX2, yWindow+drawY3, size, size, 0, c_white, 1)
	draw_sprite_ext(EquipSlotSpr, overPet or myPet.selected, xWindow+drawX1, yWindow+drawY3, size, size, 0, c_white, 1)

	if myHat.itemName != "none"
	    {
	    DrawItem(EquipHatSpr, myHat.itemNumber, myHat.myColor, xWindow+drawX1-12, yWindow+drawY1-12, 0, 0, sprite_get_width(EquipHatSpr), sprite_get_height(EquipHatSpr))
	    }
	else
	    draw_sprite_ext(SlotShownSpr, 2, xWindow+drawX1, yWindow+drawY1, size, size, 0, c_white, 1)    
    

	if myShirt.itemName != "none"
	    {
	    DrawItem(EquipShirtSpr, myShirt.itemNumber, myShirt.myColor, xWindow+drawX2-12, yWindow+drawY1-12, 0, 0, sprite_get_width(EquipShirtSpr), sprite_get_height(EquipShirtSpr))
	    }
	else
	    draw_sprite_ext(SlotShownSpr, 1, xWindow+drawX2, yWindow+drawY1, size, size, 0, c_white, 1)
 
	if myPants.itemName != "none"
	    {
	    DrawItem(EquipPantsSpr, myPants.itemNumber, myPants.myColor, xWindow+drawX2-12, yWindow+drawY3-12, 0, 0, sprite_get_width(EquipPantsSpr), sprite_get_height(EquipPantsSpr))
	    }
	else
	    draw_sprite_ext(SlotShownSpr, 4, xWindow+drawX2, yWindow+drawY3, size, size, 0, c_white, 1)
 
	if myPet.itemName != "none"
	    {
	    DrawItem(EquipPetSpr, myPet.itemNumber, myPet.myColor, xWindow+drawX1-12, yWindow+drawY3-12, 0, 0, sprite_get_width(EquipPetSpr), sprite_get_height(EquipPetSpr))
	    }
	else
	    draw_sprite_ext(SlotShownSpr, 5, xWindow+drawX1, yWindow+drawY3, size, size, 0, c_white, 1)
 
    
	if handLostLeft
	    draw_sprite_ext(SlotShownSpr, 3, xWindow+drawX2, yWindow+drawY2, size, size, 0, c_white, 1)  
	else
	    {
	    if myLeftHand.itemName != "none"
	        DrawItem(EquipHandSpr, myLeftHand.itemNumber, myLeftHand.myColor, xWindow+drawX2-12, yWindow+drawY2-12, 0, 0, sprite_get_width(EquipHandSpr), sprite_get_height(EquipHandSpr))
	    else
	        draw_sprite_ext(SlotShownSpr, 0, xWindow+drawX2, yWindow+drawY2, size, size, 0, c_white, 1)    
        
	    }
    
	if handLostRight
	    draw_sprite_ext(SlotShownSpr, 3, xWindow+drawX1+1, yWindow+drawY2, -size, size, 0, c_white, 1)
	else
	    {    
	    if myRightHand.itemName != "none" 
	        {
	        DrawItem(EquipHandSpr, myRightHand.itemNumber, myRightHand.myColor, xWindow+drawX1-12, yWindow+drawY2-12, 0, 0, sprite_get_width(EquipHandSpr), sprite_get_height(EquipHandSpr))
			if myRightHand.twoHanded == true
	            DrawItem(EquipHandSpr, myRightHand.itemNumber, myRightHand.myColor, xWindow+drawX2-12, yWindow+drawY2-12, 0, 0, sprite_get_width(EquipHandSpr), sprite_get_height(EquipHandSpr))
			}
	    else
	        draw_sprite_ext(SlotShownSpr, 0, xWindow+drawX1+1, yWindow+drawY2, -size, size, 0, c_white, 1)
	    }    
        
    

	/* */
	///Over Card
	draw_sprite_ext(MoraleSymbolSpr, myMainPer, xWindow + 87, yWindow+137, size, size, 0, c_white, 1)

	/* */
	///Draw Bonuses

	drawStartY = yWindow + 170
	drawStatDisX = 48
	drawStatDisY = 23
	textShift = 28
	centerOffset = 5

	rowStart[0] = xWindow+sprite_get_width(PirateSheetSpr)/2 + centerOffset
	rowStart[1] = xWindow+sprite_get_width(PirateSheetSpr)/2 + centerOffset
	rowStart[2] = xWindow+sprite_get_width(PirateSheetSpr)/2 + centerOffset

	//Collect stat info
	r = 0
	numBonus = 0
	for(i=0; i < array_length_1d(statTotal); i++)
	    {
	    if statTotal[i] != 0
	        {
	        rowStart[r div 3] -= drawStatDisX/2
	        numBonus ++
	        r ++
	        }
	    }
	//Draw Stats  
	r=0 
	for(i=0; i < array_length_1d(statTotal); i++)
	    {
	    if statTotal[i] != 0
	        {
	        draw_set_halign(fa_left)
	        draw_set_valign(fa_center)
	        draw_set_color(make_color_rgb(158,126,2))
	        draw_set_font(global.LargePirateFont)
        
	        draw_sprite(StatSymbolSpr, i, rowStart[r div 3] + drawStatDisX*(r mod 3), drawStartY - drawStatDisY*((numBonus - 1) div 3)/2 + drawStatDisY*(r div 3) + 47*(sprite_index == EquipHandSpr))
	        draw_text(rowStart[r div 3] + drawStatDisX*(r mod 3) + textShift, drawStartY - drawStatDisY*((numBonus - 1) div 3)/2 + drawStatDisY*(r div 3) + sprite_get_height(StatSymbolSpr)/2, string_hash_to_newline(statTotal[i]))
	        draw_set_font(global.PirateFont)
	        r ++
	        }
	    }
		
	//Draw Actions
	for(i=0; i<array_length_1d(myAction); i++)
	    {
	    actionStartX = 32 + 16
	    actionStartY = 215 + 16
	    if myAction[i] != noone
	        {
	        DrawAction(myAction[i], xWindow + actionStartX + 39*i, yWindow + actionStartY, 1)
	        //Draw stat Info
	        if point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xWindow + actionStartX + 39*i - 16, yWindow + actionStartY - 16, xWindow + actionStartX + 40*i + 16, yWindow + actionStartY + 16)
	            {
	            startX = xWindow - sprite_get_width(ActionInfoSpr)/2 + 8 + sprite_get_width(PirateSheetSpr)/2
	            startX += (point_distance(xWindow, 0, room_width/2 - 50, 0) > 150) *(sign(room_width/2 - xWindow))*50
	            drawInfoY = yWindow + actionStartY - 60
	            DrawActionInfo(myAction[i], startX, drawInfoY, true, "pirate", undefined)
	            }
	        }
	    }


	/* */
	/*  */
}

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

