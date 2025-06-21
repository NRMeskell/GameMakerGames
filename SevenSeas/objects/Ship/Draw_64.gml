var __b__;
__b__ = action_if_variable(instance_exists(Defeat), false, 0);
if __b__
{
{
///Draw Ship Menu

if portSelect = true or global.inPort = false
    {
	var drawLayer = global.menuShipLayer
	if global.menuShipLayer == 0
		drawLayer += 3*(global.mastNumber[shipType]-1)
	else if global.menuShipLayer == 1
		drawLayer += 3*(global.shipCannons[shipType]-1)	
	else if global.menuShipLayer == 2
		drawLayer += 3*(global.shipCargo[shipType]-4)	
		
    draw_sprite_ext(MenuShipSpr, drawLayer, xWindow, yWindow, menuSize, menuSize, 0, -1, 1) 
    
    
    if (!overUp and __view_get( e__VW.XView, 0 ) == 0) and global.menuShipLayer != 0
        draw_sprite_ext(ShipArrowSpr, 0, xWindow + buttonX, yWindow + buttonY, 1, 1, 0, c_white, 1)
    else
        draw_sprite_ext(ShipArrowSpr, 0, xWindow + buttonX, yWindow + buttonY, 1, 1, 0, c_ltgray, 1)
        
    if (!overDown and __view_get( e__VW.XView, 0 ) == 0) and global.menuShipLayer != 2
        draw_sprite_ext(ShipArrowSpr, 1, xWindow + sprite_width - buttonX, yWindow + buttonY, 1, 1, 0, c_white, 1)
    else
        draw_sprite_ext(ShipArrowSpr, 1, xWindow + sprite_width - buttonX, yWindow + buttonY, 1, 1, 0, c_ltgray, 1) 
    }
draw_sprite_ext(StatMenuSpr, 0,  room_width/2 - sprite_get_width(StatMenuSpr)/2 + 100, room_height - sprite_get_height(StatMenuSpr), 1, 1, 0, -1, 1)
//draw_sprite_ext(StatMenuSpr, 0,  room_width/2 - sprite_get_width(StatMenuSpr)/2 + 21, -5, 1, 1, 0, -1, 1)

draw_set_color(c_black)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_font(global.PirateFont)
for(i=0; i<array_length_1d(myStatsNumList); i++)
    {  
    if (i != 4)
        {     
        draw_text_transformed(room_width/2 + statsStartX - sprite_get_width(StatMenuSpr)/2 + 103 + (i - 1*(i>4))*statsDistance, room_height - sprite_get_height(StatMenuSpr )+ 24, string_hash_to_newline(myStatsNumList[i] div 1), 1.25, 1.25, 0)
        draw_sprite_ext(StatSymbolSpr, i, room_width/2 + statsStartX - sprite_get_width(StatMenuSpr)/2 + 100 + (i - 1*(i>4))*statsDistance - sprite_get_height(StatSymbolSpr)*0.8, room_height - sprite_get_height(StatMenuSpr )+ 23 - sprite_get_height(StatSymbolSpr)/2*0.8, 0.8, 0.8, 0, -1, 1)    
        }
    }
    
//DRAW SHIP HEALTH
draw_set_color(make_color_rgb(59, 33, 6))
draw_rectangle(room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + 2, room_height - sprite_get_height(StatMenuSpr) - sprite_get_height(HealthBoxSpr)+6, room_width/2 + 100 + sprite_get_width(HealthBoxSpr)/2-3, room_height - sprite_get_height(StatMenuSpr)+2, false)

if healthDiff > maxHealth
	healthDiff = maxHealth

if healthDiff >= myHealth{
	draw_set_color(make_color_rgb(166, 29, 8))
	draw_rectangle(room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + 2, room_height - sprite_get_height(StatMenuSpr) - sprite_get_height(HealthBoxSpr)+6, room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + (sprite_get_width(HealthBoxSpr)-3)*healthDiff/maxHealth, room_height - sprite_get_height(StatMenuSpr)+2, false)
}else{
	draw_set_color(make_color_rgb(9, 97, 12))
	draw_rectangle(room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + 2, room_height - sprite_get_height(StatMenuSpr) - sprite_get_height(HealthBoxSpr)+6, room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + (sprite_get_width(HealthBoxSpr)-3)*myHealth/maxHealth, room_height - sprite_get_height(StatMenuSpr)+2, false)
}

draw_set_color(c_black)
draw_line_width(room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + (sprite_get_width(HealthBoxSpr)-3)*healthDiff/maxHealth, room_height - sprite_get_height(StatMenuSpr) - sprite_get_height(HealthBoxSpr)+6, room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + (sprite_get_width(HealthBoxSpr)-3)*healthDiff/maxHealth, room_height - sprite_get_height(StatMenuSpr)+2, 1)

if healthDiff >= myHealth{
	draw_set_color(make_color_rgb(105, 45, 6))
	draw_rectangle(room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + 2, room_height - sprite_get_height(StatMenuSpr) - sprite_get_height(HealthBoxSpr)+6, room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + (sprite_get_width(HealthBoxSpr)-3)*myHealth/maxHealth, room_height - sprite_get_height(StatMenuSpr)+2, false)
}else{
	draw_set_color(make_color_rgb(105, 45, 6))
	draw_rectangle(room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + 2, room_height - sprite_get_height(StatMenuSpr) - sprite_get_height(HealthBoxSpr)+6, room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + (sprite_get_width(HealthBoxSpr)-3)*healthDiff/maxHealth, room_height - sprite_get_height(StatMenuSpr)+2, false)
}
draw_set_color(c_black)
draw_line_width(room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + (sprite_get_width(HealthBoxSpr)-3)*myHealth/maxHealth, room_height - sprite_get_height(StatMenuSpr) - sprite_get_height(HealthBoxSpr)+6, room_width/2 + 100 - sprite_get_width(HealthBoxSpr)/2 + (sprite_get_width(HealthBoxSpr)-3)*myHealth/maxHealth, room_height - sprite_get_height(StatMenuSpr)+2, 1)

draw_sprite_ext(HealthBoxSpr, 0,  room_width/2 + 100, room_height - sprite_get_height(StatMenuSpr) - sprite_get_height(HealthBoxSpr)/2 + 4, 1, 1, 0, -1, 1)

draw_set_color(c_black)
draw_set_halign(fa_center)
draw_text(room_width/2 + 100, room_height - sprite_get_height(StatMenuSpr) - sprite_get_height(HealthBoxSpr)/2 + 4, string_hash_to_newline(string(ceil(myHealth)) + "/" + string(ceil(maxHealth))))


with ShipSlot
    event_user(0)
    
with Pirate
    event_user(15)

///Draw Pirate Post

draw_set_font(global.PirateFont)
draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_set_color(c_black)
draw_sprite_part(PirateListSpr, 0, 0, 0, 30 + string_width(string_hash_to_newline(SaveGameRunner.gameName)), sprite_get_height(PirateListSpr) ,drawTagX, drawTagY)
draw_sprite_part(PirateListSpr, 0, sprite_get_width(PirateListSpr) - 16, 0, 16, sprite_get_height(PirateListSpr), drawTagX + 30 + string_width(string_hash_to_newline(SaveGameRunner.gameName)), drawTagY)

draw_text(drawTagX + 30, drawTagY + 38, string_hash_to_newline(SaveGameRunner.gameName))

for(i = drawTagY+sprite_get_height(PirateListSpr); i < room_height; i+= sprite_get_height(PirateListSpr))
    {
    draw_sprite(PirateListSpr, 3, drawTagX, i)
    }

//Draw Pirate List Arrows
/*
if global.slotPosition != 0
    {
    if overListUp and __view_get( e__VW.XView, 0 ) = 0
        draw_sprite_ext(PirateListArrowSpr, 0, drawTagX + listPositionX, drawTagY + listPositionUpY, 1,1,0,c_ltgray, 1)
    else
        draw_sprite_ext(PirateListArrowSpr, 0, drawTagX + listPositionX, drawTagY + listPositionUpY, 1,1,0,c_white, 1)
    }
   
if global.slotPosition + 5 < instance_number(Pirate)
    {
    if overListDown and __view_get( e__VW.XView, 0 ) = 0
        draw_sprite_ext(PirateListArrowSpr, 1, drawTagX + listPositionX, drawTagY + listPositionDownY, 1,1,0,c_ltgray, 1)
    else
        draw_sprite_ext(PirateListArrowSpr, 1, drawTagX + listPositionX, drawTagY + listPositionDownY, 1,1,0,c_white, 1)
    } 

*/  
//Draw Pirates

with Pirate
    {
	tagDistance = sprite_get_height(PirateListSpr) * (7/(2+global.shipMaxCrew[Ship.shipType]))
		
    myTagPlace = tagDistance * (1 + ds_list_find_index(global.crewList, id) - global.slotPosition)
    drawable = -1 < ds_list_find_index(global.crewList, id) - global.slotPosition and ds_list_find_index(global.crewList, id) - global.slotPosition < Ship.drawPiratePostNumber
    
    if ds_list_find_index(global.crewList, id) = 0
        {
        draw_set_font(global.PirateFont)
        draw_set_halign(fa_left)
        draw_set_valign(fa_middle)
        draw_set_color(c_black)
         
        for(var i = Ship.drawTagY+tagDistance*(ds_list_size(global.crewList)+1-global.slotPosition); i < room_height; i+= tagDistance)
            draw_sprite(PirateListSpr, 3, Ship.drawTagX, i + tagShift)
        
		draw_sprite(PirateListSpr, 3, Ship.drawTagX, Ship.drawTagY+tagDistance*5 + tagShift)
        
        }
        
    draw_set_font(global.PirateFont)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_color(c_black)
    
    nameTagShown = firstName + " "
    
    if selected or overSprite
        {
        nameTagLength += curlSpeed
        if nameTagLength > string_width(string_hash_to_newline(nameTagShown + lastName)) + Ship.drawTagX + nameTagStart + 5
            nameTagLength = string_width(string_hash_to_newline(nameTagShown + lastName)) + Ship.drawTagX + nameTagStart + 5
        }
    else
        {
        nameTagLength -= curlSpeed
        if nameTagLength < nameTagMin
            nameTagLength = nameTagMin
        }
    
    if drawable
        {   
        if ds_list_find_index(global.crewList, id) = 0
            crewType = "Captain"
        else if ds_list_find_index(global.crewList, id) = 1
            crewType = "1st Mate"
        else
            crewType = "Deckhand"
        
        draw_sprite_part(PirateListSpr, 1, 0, 0, nameTagLength, sprite_get_height(PirateListSpr), Ship.drawTagX, Ship.drawTagY + myTagPlace + tagShift)
		if healthDiff >= myHealth{
	        draw_sprite_ext(PirateListLifeSpr, (1 - healthDiff/maxHealth)*sprite_get_number(PirateListLifeSpr), Ship.drawTagX, Ship.drawTagY + myTagPlace + tagShift, 1, 1, 0, c_red, 1)
	        draw_sprite_ext(PirateListLifeSpr, (1 - myHealth/maxHealth)*sprite_get_number(PirateListLifeSpr), Ship.drawTagX, Ship.drawTagY + myTagPlace + tagShift, 1, 1, 0, c_yellow, 1)
		}
		else{
			draw_sprite_ext(PirateListLifeSpr, (1 - myHealth/maxHealth)*sprite_get_number(PirateListLifeSpr), Ship.drawTagX, Ship.drawTagY + myTagPlace + tagShift, 1, 1, 0, c_lime, 1)
	        draw_sprite_ext(PirateListLifeSpr, (1 - healthDiff/maxHealth)*sprite_get_number(PirateListLifeSpr), Ship.drawTagX, Ship.drawTagY + myTagPlace + tagShift, 1, 1, 0, c_yellow, 1)
	    }
            
        lastLetter = 1
        while string_width(string_hash_to_newline(nameTagShown)) < nameTagLength - nameTagStart and lastLetter <= string_length(lastName)
            {
            nameTagShown += string_char_at(lastName, lastLetter)
            lastLetter += 1
            }
            
        draw_text(Ship.drawTagX + nameTagStart, 42 + Ship.drawTagY + myTagPlace + tagShift, string_hash_to_newline(nameTagShown))
        draw_sprite(PirateListSpr, 2, Ship.drawTagX + nameTagLength-1, Ship.drawTagY + myTagPlace + tagShift)
        
        draw_set_font(global.PirateFont)
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_set_color(c_black)
        
        draw_sprite(StarsSpr, stars, Ship.drawTagX, Ship.drawTagY + myTagPlace + tagShift - 6)
        
        if stunned
            draw_sprite(PirateInjuredSpr, 3, Ship.drawTagX + 51, Ship.drawTagY + myTagPlace + 4 + tagShift)
        else if bleeding
            draw_sprite(PirateInjuredSpr, 2, Ship.drawTagX + 51, Ship.drawTagY + myTagPlace + 4 + tagShift)
        else if exposed
            draw_sprite(PirateInjuredSpr, 4, Ship.drawTagX + 51, Ship.drawTagY + myTagPlace + 4 + tagShift)
		}
        
    if drawable
        {
		if !surface_exists(tagPirateSurface){
			tagPirateSurface = surface_create(drawTagPictureWidth, drawTagPictureHeight)
			MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY) 
		}
        DrawPirateSurface(tagPirateSurface, Ship.drawTagX + drawTagPictureX, Ship.drawTagY + drawTagPictureY + myTagPlace + tagShift)
        }
		
    }
	
if instance_exists(Pirate)
	for(var i = drawTagY+sprite_get_height(PirateListSpr)+1; i < room_height; i+= Pirate.tagDistance)
        draw_sprite(PirateListSpr, 4, drawTagX, i)
	}
}
