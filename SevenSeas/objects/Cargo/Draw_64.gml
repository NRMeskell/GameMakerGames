/// @description Draw Cargo

dis = 2
shiftX = 0
shiftY = 2

if showReal = true and (Ship.portSelect = true or !global.inPort)
    {
    if cargoType != 4
        draw_sprite(CargoSpr, cargoType, mySlot.x+1 + realHeight/2, mySlot.y+2 + realHeight/2)
    else
        draw_sprite(FoodQualitySpr, round(global.foodQuality), mySlot.x+1 + realHeight/2, mySlot.y+2 + realHeight/2)
   
    draw_set_color(merge_color(c_gray, c_black, 0.2))
    draw_rectangle(mySlot.x+realWidth-string_width(string_hash_to_newline(cargoAmount))/2 - dis + 1 + shiftX, mySlot.y+realHeight - string_height(string_hash_to_newline(cargoAmount))/2 - dis + 1 + shiftY, mySlot.x+realWidth+string_width(string_hash_to_newline(cargoAmount))/2+dis + shiftX, mySlot.y+realHeight+ dis + string_height(string_hash_to_newline(cargoAmount))/2 + shiftY, false)
    draw_set_color(c_black)
    draw_rectangle(mySlot.x+realWidth-string_width(string_hash_to_newline(cargoAmount))/2 - dis + shiftX, mySlot.y+realHeight - string_height(string_hash_to_newline(cargoAmount))/2 - dis + shiftY, mySlot.x+realWidth+string_width(string_hash_to_newline(cargoAmount))/2 + dis + shiftX, mySlot.y+realHeight + string_height(string_hash_to_newline(cargoAmount))/2 + dis + shiftY, true)
    draw_set_font(global.PirateFont)
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    
    
    draw_text_transformed(mySlot.x+realWidth+2 + shiftX, mySlot.y+realHeight+1 + shiftY, string_hash_to_newline(cargoAmount), 1.2, 0.9, 0)
    }
    
if selected = true// and Ship.portSelect = true
    {
    if !overDump
        draw_sprite(ShipSlotSpr, 3, dumpX, dumpY)
    else
        draw_sprite(ShipSlotSpr, 9, dumpX, dumpY)
    }
    


