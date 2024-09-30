/// @description Draw Event Card

buttonNumber = ds_list_size(buttons)

pirateEventText = eventText
   
textBorder = 35
captionY = 29 + (string_height_ext(string_hash_to_newline(captionText), 12, sprite_get_width(EventSpr) - textBorder*1.2)/2)*1.2
buttonCenter = sprite_get_height(EventSpr) - buttonNumber/2*(buttonSpacing*2) + 7
    
textTop = captionY + (string_height_ext(string_hash_to_newline(captionText), 12, sprite_get_width(EventSpr) - textBorder*1.2)/2)*1.2
textBottom = buttonCenter - (ds_list_size(buttons)/2)*(buttonSpacing*2) - buttonSpacing
textY = (textTop + textBottom)/2 + 4
    
	

    
draw_sprite(EventSpr, 0, drawX, drawY)
draw_set_color(c_black)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
    
    
for(i=-buttonNumber; i < buttonNumber; i+=2) 
    {    
    requiredAmount = ds_list_find_value(buttonRequires, (i+buttonNumber)/2)
    requiredCost = ds_list_find_value(buttonCosts, (i+buttonNumber)/2)
    haveAmount = (requiredAmount == 0) ? 1 : Ship.myStatsNumList[ds_list_find_value(buttonStats, (i+buttonNumber)/2)]
    haveCost = CargoAmount(ds_list_find_value(buttonStats, (i+buttonNumber)/2))
    successChance  = (requiredAmount == 0) ? 100 : min(round(200/(1+exp(-(haveAmount/requiredAmount-0.6)*4)) div 2), 99)
        
    if overButton[(i+buttonNumber)/2] or requiredCost > haveCost
        draw_sprite(ButtonSpr, 2, drawX, drawY + buttonCenter + i*(buttonSpacing))
    else
        draw_sprite(ButtonSpr, 1, drawX, drawY + buttonCenter + i*(buttonSpacing))
                    
    if requiredAmount <= 0 and requiredCost <= 0
        draw_text_ext_transformed(drawX, 1 + drawY + buttonCenter + i*(buttonSpacing), string_hash_to_newline(ds_list_find_value(buttonText, (i+buttonNumber)/2)), 9, sprite_get_width(ButtonSpr) - 8, 0.8, 1, 0)
    else
        {
		draw_text_ext_transformed(drawX - sprite_get_width(StatSymbolSpr)/2, 1 + drawY + buttonCenter + i*(buttonSpacing), ds_list_find_value(buttonText, (i+buttonNumber)/2), 9, sprite_get_width(ButtonSpr) - sprite_get_width(StatSymbolSpr) - 8, 0.8, 1, 0)
			
        if requiredAmount > 0
            {
			if !(overButton[(i+buttonNumber)/2])
				draw_sprite_ext(StatSymbolSpr, ds_list_find_value(buttonStats, (i+buttonNumber)/2), drawX + sprite_get_width(ButtonSpr)/2 - sprite_get_width(StatSymbolSpr)*5/4, 2 + drawY + buttonCenter + i*(buttonSpacing)- sprite_get_height(StatSymbolSpr)/2, 0.8, 0.8, 0, -1, 1)
			else{
				draw_set_color(c_black)
				draw_set_halign(fa_center)
				draw_set_valign(fa_center)
				draw_text_transformed(drawX + sprite_get_width(ButtonSpr)/2 - sprite_get_width(StatSymbolSpr)*3/4, drawY + buttonCenter + i*(buttonSpacing), string(successChance) + "%", 1, 1.1, 0)
				}
			}
        else 
            {
			if !(overButton[(i+buttonNumber)/2])
				draw_sprite_ext(CargoSpr, ds_list_find_value(buttonStats, (i+buttonNumber)/2), drawX + sprite_get_width(ButtonSpr)/2 - sprite_get_width(StatSymbolSpr)*3/4, 1 + drawY + buttonCenter + i*(buttonSpacing), 0.8, 0.8, 0, -1, 1)
            else{
				draw_set_color(c_black)
				draw_set_halign(fa_center)
				draw_set_valign(fa_center)
				draw_text_ext_transformed(drawX + sprite_get_width(ButtonSpr)/2 - sprite_get_width(StatSymbolSpr)*3/4, drawY + buttonCenter + i*(buttonSpacing), string_hash_to_newline(requiredCost), 9, 100, 1, 1.1, 1)
				}
            }
        }
    }
        
    
draw_set_font(global.LargePirateFont)
draw_set_color(make_color_rgb(149, 126, 1))

if myCharacter == -1    
    {
	var captionWidth = string_width_ext(string_hash_to_newline(captionText), 14, sprite_get_width(EventSpr) - textBorder*1.6),
		captionSize = min(1.2, (sprite_get_width(EventSpr) - textBorder*1.6)/captionWidth),
		captionHeight = string_height_ext(string_hash_to_newline(captionText), 14, sprite_get_width(EventSpr) - textBorder*1.6)
		
	draw_set_halign(fa_center)
	draw_sprite_part(ItemSheetSpr, 7, 0, 0, captionWidth*captionSize/2 + 16, 7, drawX - captionWidth*captionSize/2 - 16, drawY+captionY-captionHeight*captionSize/2-7)
    draw_sprite_part(ItemSheetSpr, 7, sprite_get_width(ItemSheetSpr) - captionWidth*captionSize/2 - 16, 0, captionWidth*captionSize/2 + 16, 7, drawX, drawY+captionY-captionHeight*captionSize/2-7)
    
	draw_sprite_part(ItemSheetSpr, 7, 0, sprite_get_height(ItemSheetSpr) - 34 - captionHeight*captionSize, captionWidth*captionSize/2 + 16, captionHeight*captionSize+6, drawX - captionWidth*captionSize/2 - 16, drawY+captionY-captionHeight*captionSize/2)
    draw_sprite_part(ItemSheetSpr, 7, sprite_get_width(ItemSheetSpr) - captionWidth*captionSize/2 - 16, sprite_get_height(ItemSheetSpr) - 34 - captionHeight*captionSize, captionWidth*captionSize/2 + 16, captionHeight*captionSize+6, drawX, drawY+captionY-captionHeight*captionSize/2)
                   
    draw_text_ext_transformed(drawX, drawY + captionY, string_hash_to_newline(captionText), 14, sprite_get_width(EventSpr) - textBorder*1.6, captionSize, captionSize, 0)
	}
else
    {
	var captionWidth = string_width_ext(string_hash_to_newline(captionText), 14, sprite_get_width(EventSpr) - textBorder*1.2 - 57),
		captionSize = captionWidth/(sprite_get_width(EventSpr) - textBorder*1.2 - 57),
		captionHeight = string_height_ext(string_hash_to_newline(captionText), 14, sprite_get_width(EventSpr) - textBorder*1.2 - 57)
	
    draw_set_halign(fa_left)
    draw_text_ext_transformed(drawX - sprite_get_width(EventSpr)/2 + 57, drawY + captionY, string_hash_to_newline(captionText), 14, sprite_get_width(EventSpr) - textBorder*1.2 - 57, 1, 1, 0)
    draw_sprite(CharacterFrameSpr, myCharacter, drawX - sprite_get_width(EventSpr)/2 + 35, drawY + captionY - 2)
    }
draw_set_halign(fa_center)
draw_set_color(c_black)
draw_set_font(global.PirateFont)
draw_text_ext_transformed(drawX, drawY + textY + 5, string_hash_to_newline(pirateEventText), 12, sprite_get_width(EventSpr) - textBorder, 0.9, 0.9, 0)


